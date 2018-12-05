//
//  GJMineInputPhoneVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/11/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineInputPhoneVC.h"
#import "GJMineInputCarTypeVC.h"

@interface GJMineInputPhoneVC ()
@property (nonatomic, strong) UITextField *codeTF;
@property (nonatomic, strong) UIButton *codeBtn;
@end

@implementation GJMineInputPhoneVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.titleLB.mas_bottom).with.offset(AdaptatSize(10));
        make.width.mas_equalTo(self.topInputTFW);
        make.height.mas_equalTo(self.topInputTFH);
    }];
    [self.codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(self.textField);
        make.width.mas_equalTo(self.topInputTFW * 0.55);
        make.top.equalTo(self.textField.mas_bottom).with.offset(AdaptatSize(15));
    }];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.codeTF);
        make.right.equalTo(self.textField);
        make.bottom.equalTo(self.codeTF);
        make.left.equalTo(self.codeTF.mas_right).with.offset(AdaptatSize(30));
    }];
    [self.remindLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.codeTF.mas_bottom).with.offset(AdaptatSize(10));
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    
}

- (void)initializationSubView {
    [self initUITitle:@"请输入您的手机号码" nextText:@"继续"];
    [self addSubview:self.textField];
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self addSubview:self.codeTF];
    [self addSubview:self.codeBtn];
    [self addSubview:self.remindLB];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)nextStepBtnClick {
    GJMineInputCarTypeVC *vc = [[GJMineInputCarTypeVC alloc] init];
    [vc pushPageWith:self];
}

- (void)codeBtnClick {
    NSString *phone = self.textField.text;
    self.remindLB.text = [NSString stringWithFormat:@"请输入手机%@收到的验证码", phone];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (UITextField *)codeTF {
    if (!_codeTF) {
        _codeTF = [[UITextField alloc] init];
        _codeTF.font = [APP_CONFIG appAdaptFontOfSize:17];
        _codeTF.textColor = APP_CONFIG.darkTextColor;
        [_codeTF setTintColor:APP_CONFIG.appMainColor];
        _codeTF.backgroundColor = [UIColor whiteColor];
        _codeTF.layer.cornerRadius = 2;
        _codeTF.clipsToBounds = YES;
        _codeTF.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _codeTF;
}

- (UIButton *)codeBtn {
    if (!_codeBtn) {
        _codeBtn = [[UIButton alloc] init];
        _codeBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:16];
        _codeBtn.backgroundColor = [UIColor whiteColor];
        _codeBtn.layer.cornerRadius = 2;
        _codeBtn.clipsToBounds = YES;
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_codeBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
        [_codeBtn addTarget:self action:@selector(codeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
