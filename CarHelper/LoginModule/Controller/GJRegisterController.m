//
//  GJRegisterController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRegisterController.h"
#import "GJLoginNaviBar.h"
#import "GJApplyFormTitleView.h"
#import "GJRegisterView.h"
#import "GJLoginApi.h"
#import "GJQRCodeController.h"
#import "GJPartnerManager.h"
#import "GJApplyShopRegisterVC.h"

@interface GJRegisterController ()
@property (nonatomic, strong) GJLoginNaviBar *naviBar;
@property (nonatomic, strong) GJApplyFormTitleView *titleView;
@property (nonatomic, strong) GJRegisterView *contentView;
@property (nonatomic, strong) GJPartnerManager *partnerManager;
@property (nonatomic, strong) GJLoginApi *loginApi;
@property (strong, nonatomic) NSString *tempTelePhoneNum;
@property (nonatomic, strong)  NSString *oldTelPhone;
@property (nonatomic, assign)  BOOL hadGetPhoneCode;
@end

@implementation GJRegisterController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(_titleView.mas_bottom);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

#pragma mark - Iniitalization methods
- (void)initializationData {}

- (void)initializationSubView {
    [self.view addSubview:self.naviBar];
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.contentView];
}

- (void)initializationNetWorking {
    _loginApi  =[[GJLoginApi alloc] init];
    _partnerManager = [[GJPartnerManager alloc] init];
    __weak typeof(self)weakSelf = self;
    _contentView.blockSubmit = ^(NSString *recommandPhone, NSString *phone, NSString *code) {
        [weakSelf requesstNextStep:recommandPhone phone:phone code:code];
    };
    _contentView.getVerifyCodeClick = ^(NSString *phone) {
        [weakSelf requestVerifyCode:phone];
    };
    _contentView.scanBtnClick = ^{
        GJQRCodeController *vc = [GJQRCodeController new];
        [vc pushPageWith:weakSelf];
    };
    _contentView.scanProtocolClick = ^{
        
    };
}

#pragma mark - Request Handle
- (void)requesstNextStep:(NSString *)recommand phone:(NSString *)phone code:(NSString *)code {
//    if (![_contentView.phoneNumTF.text isEqualToString:_oldTelPhone]) {
//        ShowWaringAlertHUD(@"手机号和验证码不匹配", nil);
//        return;
//    }
    [self.view.loadingView startAnimation];
    [_partnerManager requestShopPhone:phone tjrPhone:recommand code:code success:^(GJApplyShopRegisterData *data) {
        [self.view.loadingView stopAnimation];
        GJApplyShopRegisterVC *vc = [GJApplyShopRegisterVC new];
        vc.data = data;
        vc.blockApplySuccessShowHome = ^{
            BLOCK_SAFE(_blockApplySuccessShowHome)();
        };
        [vc pushPageWith:self];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
        ShowWaringAlertHUD(error.localizedDescription, self.view);
    }];
}

- (void)requestVerifyCode:(NSString *)phone {
    _tempTelePhoneNum = phone;
    if (!_tempTelePhoneNum) return ;
    [_contentView.getVerifyCodeBtn showActive:YES];
    [self.loginApi loginGetSmsCode:_tempTelePhoneNum success:^(NSURLResponse *urlResponse, id response) {
        self.oldTelPhone = _tempTelePhoneNum;
        [_contentView.getVerifyCodeBtn showActive:NO];
        ShowSucceedAlertHUD(@"验证码发送成功", self.view);
        _hadGetPhoneCode = YES;
        [_contentView codeTFBecomrFirst];
//        _contentView.submitBtn.enabled = YES;
        if (!_contentView.getVerifyCodeBtn.enabled) {
            return;
        }
        [_contentView.getVerifyCodeBtn startEndTime];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [_contentView.getVerifyCodeBtn showActive:NO];
        ShowWaringAlertHUD(error.localizedDescription, nil);
    }];
}

#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJLoginNaviBar *)naviBar {
    if (!_naviBar) {
        _naviBar = [GJLoginNaviBar install];
        __weak typeof(self)weakSelf = self;
        _naviBar.backClickBlock = ^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        };
    }
    return _naviBar;
}

- (GJApplyFormTitleView *)titleView {
    if (!_titleView) {
        _titleView = [GJApplyFormTitleView installTitle:@"注册账号" detail:@"请确定您的手机号，注册属于您的账号"];
    }
    return _titleView;
}

- (GJRegisterView *)contentView {
    if (!_contentView) {
        _contentView = [[GJRegisterView alloc] init];
    }
    return _contentView;
}

@end
