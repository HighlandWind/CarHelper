//
//  GJGiveScoreView.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJGiveScoreView.h"

@interface GJGiveScoreView () <UITextFieldDelegate>
@property (nonatomic, strong) UILabel *phoneLB;
@property (nonatomic, strong) UILabel *moneyLB;
@property (nonatomic, strong) UIView *phoneLine;
@property (nonatomic, strong) UIView *moneyLline;
@property (nonatomic, strong) UILabel *giveRemindLB;
@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UITextField *moneyTF;
@property (nonatomic, strong) UIButton *giveBtn;
@property (nonatomic, strong) UIImageView *leftImgInTF1;
@property (nonatomic, strong) UILabel *leftImgInTF2;
@end

@implementation GJGiveScoreView

- (void)giveBtnClick {
    if (![_phoneTF.text isValidMobileNumber]) {
        ShowWaringAlertHUD(@"手机号不正确", self);
        return;
    }
    if (_moneyTF.text.length == 0) {
        ShowWaringAlertHUD(@"请输入收款金额", self);
        return;
    }
    BLOCK_SAFE(_blockGiveBtnClick)(_phoneTF.text, _moneyTF.text);
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL ret = YES;
    NSString *textStr = [textField.text changeCharactersInRange:range replacementString:string];
    if (textField == _phoneTF && textStr.length > 11) {
        ret = NO;
        ShowWaringAlertHUD(@"手机号为11位数字", nil);
    }
    if (textField == _moneyTF) {
        if ([textStr isValidMoneyCharge]) {
            _giveRemindLB.text = [NSString stringWithFormat:@"本次赠送 %@ 积分", textStr];
            ret = YES;
        }else {
            if (!JudgeContainerCountIsNull(textStr)) {
                ret = NO;
            }else {
                _giveRemindLB.text = @"本次赠送 0 积分";
            }
        }
    }
    return ret;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (textField == _moneyTF) {
        _giveRemindLB.text = @"本次赠送 0 积分";
    }
    return YES;
}

- (void)commonInit {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    
    _phoneLB = [self createLabel:15 color:[UIColor darkGrayColor]];
    _phoneLB.text = @"付款人手机号";
    _moneyLB = [self createLabel:15 color:[UIColor darkGrayColor]];
    _moneyLB.text = @"收款金额";
    _giveRemindLB = [self createLabel:13 color:APP_CONFIG.appMainColor];
    _giveRemindLB.text = @"本次赠送 0 积分";
    
    _phoneLine = [[UIView alloc] init];
    _moneyLline = [[UIView alloc] init];
    _phoneLine.backgroundColor = _moneyLline.backgroundColor = APP_CONFIG.separatorLineColor;
    
    _phoneTF = [[UITextField alloc] init];
    _phoneTF.delegate = self;
    _phoneTF.font = [APP_CONFIG appFontOfSize:40];
    _phoneTF.tintColor= [UIColor blackColor];
    _phoneTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    _leftImgInTF1 = [[UIImageView alloc] init];
    _leftImgInTF1.contentMode = UIViewContentModeScaleAspectFit;
    
    _moneyTF = [[UITextField alloc] init];
    _moneyTF.delegate = self;
    _moneyTF.font = _phoneTF.font;
    _moneyTF.tintColor= [UIColor blackColor];
    _moneyTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _moneyTF.keyboardType = UIKeyboardTypeNumberPad;
    _leftImgInTF2 = [[UILabel alloc] init];
    _leftImgInTF2.font = AdapFont([APP_CONFIG appBoldFontOfSize:30]);
    _leftImgInTF2.textAlignment = NSTextAlignmentCenter;
    
    _giveBtn = [[UIButton alloc] init];
    _giveBtn.titleLabel.font = AdapFont([APP_CONFIG appBoldFontOfSize:16]);
    _giveBtn.backgroundColor = APP_CONFIG.appMainColor;
    _giveBtn.layer.cornerRadius = 5;
    _giveBtn.clipsToBounds = YES;
    [_giveBtn setTitle:@"赠送" forState:UIControlStateNormal];
    [_giveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_giveBtn addTarget:self action:@selector(giveBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_phoneLB];
    [self addSubview:_moneyLB];
    [self addSubview:_phoneLine];
    [self addSubview:_moneyLline];
    [self addSubview:_giveRemindLB];
    [self addSubview:_phoneTF];
    [self addSubview:_moneyTF];
    [self addSubview:_giveBtn];
    [self addSubview:_leftImgInTF1];
    [self addSubview:_leftImgInTF2];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrames];
    _leftImgInTF1.image = [UIImage imageNamed:@"dianhua"];
    _leftImgInTF2.text = @"¥";
}

- (void)updateFrames {
    [_phoneLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(20));
        make.top.equalTo(self).with.offset(AdaptatSize(15));
    }];
    [_leftImgInTF1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLB);
        make.top.equalTo(_phoneLB.mas_bottom).with.offset(20);
        make.width.height.mas_equalTo(AdaptatSize(25));
    }];
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImgInTF1.mas_right).with.offset(10);
        make.top.equalTo(_leftImgInTF1);
        make.right.equalTo(self).with.offset(-AdaptatSize(15));
    }];
    [_phoneLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLB);
        make.bottom.equalTo(_phoneTF).with.offset(5);
        make.right.equalTo(_phoneTF).with.offset(-7);
        make.height.mas_equalTo(1);
    }];
    [_moneyLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLB);
        make.top.equalTo(_phoneLine.mas_bottom).with.offset(30);
    }];
    [_leftImgInTF2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLB);
        make.top.equalTo(_moneyLB.mas_bottom).with.offset(20);
        make.width.height.mas_equalTo(AdaptatSize(20));
    }];
    [_moneyTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_leftImgInTF2.mas_right).with.offset(10);
        make.top.equalTo(_leftImgInTF2);
        make.right.equalTo(_phoneTF);
    }];
    [_moneyLline mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLB);
        make.bottom.equalTo(_moneyTF).with.offset(5);
        make.right.equalTo(_phoneTF).with.offset(-7);
        make.height.mas_equalTo(1);
    }];
    [_giveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLB);
        make.bottom.equalTo(self).with.offset(-AdaptatSize(30));
        make.right.equalTo(_phoneTF);
        make.height.mas_equalTo(45);
    }];
    [_giveRemindLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_phoneLB);
        make.bottom.equalTo(_giveBtn.mas_top).with.offset(-AdaptatSize(15));
    }];
}

- (UILabel *)createLabel:(CGFloat)font color:(UIColor *)color {
    UILabel *lb = [[UILabel alloc] init];
    lb.font = AdapFont([APP_CONFIG appBoldFontOfSize:font]);
    lb.textColor = color;
    [lb sizeToFit];
    return lb;
}

@end
