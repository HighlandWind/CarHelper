//
//  GJWithdrawCashVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJWithdrawCashVC.h"
#import "GJWithdrawCashView.h"
#import "GJPartnerManager.h"

@interface GJWithdrawCashVC ()
@property (nonatomic, strong) GJWithdrawCashView *cashView;
@property (nonatomic, strong) GJPartnerManager *partnerManager;
@end

@implementation GJWithdrawCashVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _cashView.frame = CGRectMake(15, 15, self.view.width-30, SCREEN_H/2+10);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    _partnerManager = [[GJPartnerManager alloc] init];
}

- (void)initializationSubView {
    self.title = @"提现";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    self.view.backgroundColor = [UIColor colorWithRGB:247 g:247 b:247];
    [self.view addSubview:self.cashView];
    [self blockHanddls];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle
- (void)requestWithdrawCash:(double)money {
    [self.view.loadingView startAnimation];
    
    NSInteger type;
    if (_isFromShop) {
        type = 1;
    }else {
        type = 0;
    }
    
    [_partnerManager requestWithdrawCashWithType:type money:money success:^(NSString *message) {
        [self.view.loadingView stopAnimation];
        ShowSucceedAlertHUD(message, nil);
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
        ShowWaringAlertHUD(error.localizedDescription, self.view);
    }];
}

#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)blockHanddls {
    __weak typeof(self)weakSelf = self;
    _cashView.blockClickSubmit = ^(double money) {
        [weakSelf requestWithdrawCash:money];
    };
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJWithdrawCashView *)cashView {
    if (!_cashView) {
        _cashView = [[GJWithdrawCashView alloc] initIsFromShop:_isFromShop];;
        _cashView.yueMoney = _yueMoney;
    }
    return _cashView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
