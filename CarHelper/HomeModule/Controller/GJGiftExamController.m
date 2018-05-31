//
//  GJGiftExamController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/28.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJGiftExamController.h"
#import "GJHomeManager.h"
#import "GJGiftExamListController.h"

@interface GJGiftExamController ()
@property (nonatomic, strong) UITextField *inputField;
@property (nonatomic, strong) UIButton *submitBtn;
@property (nonatomic, strong) GJHomeManager *homeManager;
@end

@implementation GJGiftExamController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _inputField.frame = CGRectMake(0, 15, self.view.width, 45);
    _submitBtn.frame = CGRectMake(15, _inputField.y+_inputField.height+15, self.view.width-30, 50);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setStatusBarLight:NO];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    _homeManager = [[GJHomeManager alloc] init];
}

- (void)initializationSubView {
    self.title = @"好礼核验";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    [self.view addSubview:self.inputField];
    [self.view addSubview:self.submitBtn];
    self.view.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle
- (void)requestExamWithPhone:(NSString *)phone {
    [self.view.loadingView startAnimation];
    [_homeManager requestGiftExamList:phone success:^(NSArray<GJGiftExamListData *> *model) {
        [self.view.loadingView stopAnimation];
        GJGiftExamListController *vc = [GJGiftExamListController new];
        vc.phone = phone;
        vc.datas = model;
        [self.navigationController pushViewController:vc animated:YES];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
        ShowWaringAlertHUD(error.localizedDescription, self.view);
    }];
}

#pragma mark - Private methods

#pragma mark - Public methods

#pragma mark - Event response
- (void)submitBtnCLick {
    if (![_inputField.text isValidMobileNumber]) {
        ShowWaringAlertHUD(@"请输入正确的手机号", nil);
        return ;
    }
    [self requestExamWithPhone:_inputField.text];
}

#pragma mark - Custom delegate

#pragma mark - Getter/Setter
- (UITextField *)inputField {
    if (!_inputField) {
        _inputField = [[UITextField alloc] init];
        _inputField.font = [APP_CONFIG appFontOfSize:15];
        _inputField.placeholder = @"请输入手机号";
        _inputField.keyboardType = UIKeyboardTypeNumberPad;
        _inputField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _inputField.backgroundColor = [UIColor whiteColor];
        UILabel *leftImgInTF1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _inputField.leftViewMode = UITextFieldViewModeAlways;
        _inputField.leftView = leftImgInTF1;
    }
    return _inputField;
}

- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [[UIButton alloc] init];
        _submitBtn.titleLabel.font = AdapFont([APP_CONFIG appBahnschriftSemiFontOfSize:18]);
        _submitBtn.clipsToBounds = YES;
        _submitBtn.backgroundColor = APP_CONFIG.appMainRedColor;
        _submitBtn.layer.cornerRadius = 5;
        [_submitBtn setTitle:@"核验" forState:UIControlStateNormal];
        [_submitBtn setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
        [_submitBtn addTarget:self action:@selector(submitBtnCLick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
