//
//  GJCashDeskController.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/4/21.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJCashDeskController.h"
#import "GJCashDeskTopView.h"
#import "GJCashDeskMiddleView.h"
#import "GJOrderManager.h"
#import "GJWeChatPayModel.h"
#import "GJAlipayModel.h"
#import "GJApplyPartnerData.h"
#import "GJRechargeHistoryVC.h"

@interface GJCashDeskController ()
@property (nonatomic, strong) GJCashDeskTopView *topView;
@property (nonatomic, strong) GJCashDeskMiddleView *middleView;
@property (nonatomic, strong) GJOrderManager *orderManager;
@property (nonatomic, strong) GJOrderPaymentData *payData;
@property (nonatomic, assign) BOOL cannotInputLimit;
@end

@implementation GJCashDeskController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _topView.frame = CGRectMake(15, NavBar_H+15, SCREEN_W-30, SCREEN_H/2-NavBar_H-15);
    _middleView.frame = CGRectMake(15, _topView.y+_topView.height+15, _topView.width, SCREEN_H-_topView.y-_topView.height-30);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    [self bindPayNotification];
}

- (void)initializationSubView {
    self.title = @"收银台";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    self.view.backgroundColor = [UIColor colorWithRGB:247 g:247 b:247];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.middleView];
    _orderManager = [[GJOrderManager alloc] init];
    _topView.priceTF.text = _applyData.money;
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"充值明细" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName, APP_CONFIG.darkTextColor,NSForegroundColorAttributeName, nil];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateHighlighted];
}

- (void)initializationNetWorking {
    if (_type) {
        [_topView setCashDetail:@"礼品款（店铺充值）" type:_type];
    }else {
        [_topView setCashDetail:[NSString stringWithFormat:@"礼品款（%@）", _applyData.group_name] type:_type];
    }
}

#pragma mark - Request Handle
- (void)requestPayWithYqid:(NSString *)yqid type:(PayTypes)type token:(NSString *)token pay_leixing:(NSString *)pay_leixing {
    [self.view.loadingView startAnimation];
    [_orderManager requestPayWithYqid:yqid type:type pay_leixing:pay_leixing token:token success:^(GJOrderPaymentData *data) {
        [self.view.loadingView stopAnimation];
        _payData = data;
        // 去支付
        if (type == ZhiFuBaoPay) {
            [[GJAlipayModel new] jumpToPayWithOrder:data];
        }else if (type == WeChatPay) {
            [[GJWeChatPayModel new] jumpToPayWithOrder:data];
        }
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
    }];
}

- (void)requestOrderPaySuccess {
    ShowSucceedAlertHUD(@"支付成功", self.view);
    ShowProgressHUDWithText(YES, nil, @"请稍候");
    // 支付回调处理，回调中调到支付完成
    [_orderManager requestPayOrderStatus:_payData.pay_sn yqid:_applyData.yqid success:^{
        ShowProgressHUDWithText(NO, nil, nil);
        ShowSucceedAlertHUD(@"登录成功", nil);
        BLOCK_SAFE(_blockApplySuccessToLogin)();
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        ShowProgressHUDWithText(NO, nil, nil);
        ShowWaringAlertHUD(@"支付结果查询失败", nil);
    }];
}

#pragma mark - Private methods
- (void)bindPayNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alipayResultNotification:) name:AliPaySucessNotice object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wxResultNotification:) name:WeChatPaySucessNotice object:nil];
}

- (void)alipayResultNotification:(NSNotification *)notification {
//    GJPaymentResultType resultType;
    NSDictionary *resultDic = notification.object;
    NSString *result = [NSString stringWithFormat:@"%@",resultDic[@"result"]];
    NSInteger code = [resultDic[@"resultStatus"] integerValue];
    if ([result isKindOfClass:[NSNull class]] || result.length == 0) {
//        resultType = GJPaymentResultError;
        ShowWaringAlertHUD(@"支付出错", self.view);
    }
    else if (code == 9000) {
        [self requestOrderPaySuccess];
    }
    else if (code == 6001) {
        ShowWaringAlertHUD(@"已取消支付", self.view);
    }
    else {
        ShowWaringAlertHUD(@"支付失败", self.view);
    }
}

- (void)wxResultNotification:(NSNotification *)notification {
    NSDictionary *resultDic = notification.object;
    NSInteger type = [resultDic[@"result"] integerValue];
    if (type == GJPaymentResultCancleType) {
        ShowWaringAlertHUD(@"已取消支付", self.view);
    }
    else if (type == GJPaymentResultError) {
        ShowWaringAlertHUD(@"支付失败", self.view);
    }
    else if (type == GJPaymentResultSuccess) {
        [self requestOrderPaySuccess];
    }
}

#pragma mark - Public methods
- (void)rightClick {
    GJRechargeHistoryVC *vc = [GJRechargeHistoryVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Event response
- (void)payButtonClick {
    if ([_topView.priceTF.text doubleValue] != 0) {
        [_topView.priceTF resignFirstResponder];
        // 申请合伙人支付
        [self requestPayWithYqid:_applyData.yqid type:_middleView.payType token:_applyData.api_token pay_leixing:_applyData.type];
    }else {
        ShowWaringAlertHUD(@"请输入正确的金额", nil);
    }
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJCashDeskTopView *)topView {
    if (!_topView) {
        _topView = [[GJCashDeskTopView alloc] init];
    }
    return _topView;
}

- (GJCashDeskMiddleView *)middleView {
    if (!_middleView) {
        _middleView = [[GJCashDeskMiddleView alloc] init];
        _middleView.backgroundColor = self.view.backgroundColor;
        [_middleView.payButton addTarget:self action:@selector(payButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _middleView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
