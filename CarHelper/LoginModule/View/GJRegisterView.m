//
//  GJRegisterView.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRegisterView.h"

#define TAG_PHONE_TF 123456
#define TAG_SMSCODE_TF 123465

@interface GJRegisterView () <UITextFieldDelegate>
@property (nonatomic, strong) UILabel *bottomLB;
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) UITextField *recomandTF;
@property (nonatomic, strong) UITextField *verifyCodeTF;
@property (nonatomic, strong) UIButton *scanBtn;
@end

@implementation GJRegisterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)getVerifyCodeBtnClick {
    NSString *phone = _phoneNumTF.text;
    if (![phone isValidMobileNumber]) {
        ShowWaringAlertHUD(@"手机号格式不正确", nil);
        return;
    }
    [_phoneNumTF resignFirstResponder];
    BLOCK_SAFE(_getVerifyCodeClick)(phone);
}

- (void)scanBtnEvent {
    BLOCK_SAFE(_scanBtnClick)();
}

- (void)codeTFBecomrFirst {
    [_verifyCodeTF becomeFirstResponder];
}

- (void)submitBtnClick {
    NSString *recommand = _recomandTF.text;
    NSString *phone = _phoneNumTF.text;
    NSString *code = _verifyCodeTF.text;
    if (recommand.length == 0) {
        ShowWaringAlertHUD(@"请输入推荐人手机号", nil);
        return;
    }
    if (![recommand isValidMobileNumber]) {
        ShowWaringAlertHUD(@"推荐人手机号格式不正确", nil);
        return;
    }
    if (code.length == 0) {
        ShowWaringAlertHUD(@"请输入验证码", nil);
        return;
    }
    BLOCK_SAFE(_blockSubmit)(recommand, phone, code);
}

- (void)bottomBtnClick {
    BLOCK_SAFE(_scanProtocolClick)();
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL ret = YES;
    NSString *textStr = [textField.text changeCharactersInRange:range replacementString:string];
    if (textStr.length > 11) {
        ret = NO;
        ShowWaringAlertHUD(@"长度超出范围", nil);
    }
    if (textField == _phoneNumTF) {
        if (textStr.length == 11) {
            _getVerifyCodeBtn.enabled = YES;
            _submitBtn.enabled = YES;
        }else {
            _getVerifyCodeBtn.enabled = NO;
            _submitBtn.enabled = NO;
        }
    }
    return ret;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (textField == _phoneNumTF) {
        _getVerifyCodeBtn.enabled = NO;
        _submitBtn.enabled = NO;
    }
    return YES;
}

- (void)setupSubViews {
    _recomandTF = [self createTFHolder:@"请输入推荐人手机号" leftText:@"推荐人"];
    
    _phoneNumTF = [self createTFHolder:@"请输入手机号" leftText:@"手机号"];
    
    _verifyCodeTF = [self createTFHolder:@"请输入验证码" leftText:@"验证码"];
    
    _getVerifyCodeBtn = [[GJVerifyButton alloc] initWithFrame:CGRectZero verifyTitle:@"获取验证码"];
    _getVerifyCodeBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:13]);
    _getVerifyCodeBtn.selected = NO;
    _getVerifyCodeBtn.enabled = NO;
    _getVerifyCodeBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [_getVerifyCodeBtn addTarget:self action:@selector(getVerifyCodeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _submitBtn = [[UIButton alloc] init];
    _submitBtn.titleLabel.font = [APP_CONFIG appFontOfSize:17];
    _submitBtn.enabled = NO;
    [_submitBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [_submitBtn setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
    [_submitBtn setBackgroundImage:CreatImageWithColor([UIColor colorWithRGB:216 g:216 b:216]) forState:UIControlStateDisabled];
    [_submitBtn setBackgroundImage:CreatImageWithColor([UIColor colorWithRGB:255 g:38 b:0]) forState:UIControlStateNormal];
    [_submitBtn setBackgroundImage:CreatImageWithColor([UIColor colorWithRGB:255 g:38 b:0]) forState:UIControlStateHighlighted];
    [_submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _bottomLB = [[UILabel alloc] init];
    _bottomLB.font = AdapFont([APP_CONFIG appFontOfSize:12]);
    _bottomLB.text = @"点击开始，即表示已阅读并同意";
    _bottomLB.textColor = APP_CONFIG.grayTextColor;
    [_bottomLB sizeToFit];
    
    _bottomBtn = [[UIButton alloc] init];
    _bottomBtn.titleLabel.font = _bottomLB.font;
    [_bottomBtn setTitle:@"《全智易联用户协议》" forState:UIControlStateNormal];
    [_bottomBtn setTitleColor:[UIColor colorWithRGB:253 g:38 b:0] forState:UIControlStateNormal];
    [_bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_bottomBtn sizeToFit];
    
    _scanBtn = [[UIButton alloc] init];
    [_scanBtn setImage:[UIImage imageNamed:@"scanCode"] forState:UIControlStateNormal];
    [_scanBtn setImage:[UIImage imageNamed:@"scanCode"] forState:UIControlStateHighlighted];
    [_scanBtn addTarget:self action:@selector(scanBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    _scanBtn.backgroundColor = _recomandTF.backgroundColor;
    
    [self addSubview:_recomandTF];
    [self addSubview:_phoneNumTF];
    [self addSubview:_verifyCodeTF];
    [self addSubview:_getVerifyCodeBtn];
    [self addSubview:_submitBtn];
    [self addSubview:_bottomLB];
    [self addSubview:_bottomBtn];
    [self addSubview:_scanBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrames];
}

- (void)updateFrames {
    CGFloat height = AdaptatSize(45);
    [_recomandTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(self).with.offset(10);
        make.height.mas_equalTo(height);
        make.right.equalTo(self).with.offset(-AdaptatSize(50));
    }];
    [_scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_recomandTF);
        make.right.equalTo(self).with.offset(-15);
        make.left.equalTo(_recomandTF.mas_right);
        make.height.equalTo(_recomandTF);
    }];
    [_phoneNumTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(_recomandTF.mas_bottom).with.offset(12);
        make.height.mas_equalTo(height);
        make.right.equalTo(self).with.offset(-15);
    }];
    [_getVerifyCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_verifyCodeTF);
        make.size.mas_equalTo((CGSize){AdaptatSize(85), height});
        make.right.equalTo(_phoneNumTF);
    }];
    [_verifyCodeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.top.equalTo(_phoneNumTF.mas_bottom).with.offset(12);
        make.height.mas_equalTo(height);
        make.right.equalTo(_getVerifyCodeBtn.mas_left).with.offset(-10);
    }];
    [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.right.equalTo(self).with.offset(-15);
        make.top.equalTo(_getVerifyCodeBtn.mas_bottom).with.offset(AdaptatSize(40));
        make.height.mas_equalTo(height);
    }];
    [_bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_submitBtn.mas_bottom).with.offset(10);
        make.right.equalTo(_submitBtn.mas_centerX).with.offset(AdaptatSize(35));
    }];
    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_bottomLB);
        make.left.equalTo(_submitBtn.mas_centerX).with.offset(AdaptatSize(35));
    }];
}

- (UITextField *)createTFHolder:(NSString *)holder leftText:(NSString *)leftText {
    UITextField *tf = [[UITextField alloc] init];
    tf.delegate = self;
    tf.backgroundColor = [UIColor colorWithRGB:242 g:242 b:242];
    tf.font = [APP_CONFIG appFontOfSize:14];
    tf.placeholder = holder;
    tf.tintColor= [UIColor blueColor];
    tf.clearButtonMode = UITextFieldViewModeWhileEditing;
    tf.keyboardType = UIKeyboardTypeNumberPad;
    tf.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    [tf setValue:[APP_CONFIG appFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
    UILabel *left = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
    left.text = [NSString stringWithFormat:@"   %@", leftText];
    left.font = AdapFont([APP_CONFIG appFontOfSize:14]);
    tf.leftViewMode = UITextFieldViewModeAlways;
    tf.leftView = left;
    return tf;
}

@end
