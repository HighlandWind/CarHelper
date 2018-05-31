//
//  GJWithdrawCashView.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJWithdrawCashView.h"

@interface GJWithdrawCashView () <UITextFieldDelegate>
@property (nonatomic, strong) UILabel *topLB;
@property (nonatomic, strong) UILabel *tfLeftLB;
@property (nonatomic, strong) UIView *tfLine;
@property (nonatomic, strong) UILabel *lShopLB;
@property (nonatomic, strong) UILabel *rShopLB;
@property (nonatomic, strong) UILabel *shopLB;
@property (nonatomic, strong) UITextField *priceTF;

@property (nonatomic, strong) UILabel *bottomLB;
@property (nonatomic, strong) UIButton *allCashBtn;
@property (nonatomic, strong) UIButton *submitBtn;

@property (nonatomic, strong) UIColor *mainColor;
@end

@implementation GJWithdrawCashView

- (instancetype)initIsFromShop:(BOOL)isFromShop
{
    self = [super init];
    if (self) {
        if (isFromShop) {
            _mainColor = APP_CONFIG.appMainColor;
        }else {
            _mainColor = APP_CONFIG.partnerMainColor;
        }
        [self setupSubViews];
    }
    return self;
}

- (void)allCashBtnClick {
    _priceTF.text = [NSString stringWithFormat:@"%.2f", [_yueMoney doubleValue]];
}

- (void)submitBtnClick {
    double money = [_priceTF.text doubleValue];
    if (money == 0) {
        ShowWaringAlertHUD(@"金额不能为零", nil);
        return;
    }
    BLOCK_SAFE(_blockClickSubmit)(money);
}

- (void)setYueMoney:(NSString *)yueMoney {
    _yueMoney = yueMoney;
    _bottomLB.text = [NSString stringWithFormat:@"合伙余额¥%.2f，", [yueMoney doubleValue]];
}

- (void)setContent {
    _lShopLB.text = @"到账";
    _rShopLB.text = @"已绑定支付宝或微信";
    _shopLB.text = @"72小时内到账";
    _topLB.text = @"提现金额";
    _tfLeftLB.text = @"¥";
}

- (void)setupSubViews {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    
    _topLB = [[UILabel alloc] init];
    _topLB.font = AdapFont([APP_CONFIG appFontOfSize:14]);
    _topLB.textColor = [UIColor blackColor];
    [_topLB sizeToFit];
    _tfLeftLB = [[UILabel alloc] init];
    _tfLeftLB.font = AdapFont([APP_CONFIG appBoldFontOfSize:30]);
    _tfLeftLB.textColor = [UIColor blackColor];
    _priceTF = [[UITextField alloc] init];
    _priceTF.font = AdapFont([APP_CONFIG appBahnschriftSemiBoldFontOfSize:44]);
    _priceTF.textColor = [UIColor blackColor];
    _priceTF.delegate = self;
    _priceTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    _priceTF.keyboardType = UIKeyboardTypeDecimalPad;
    _tfLine = [[UIView alloc] init];
    _tfLine.backgroundColor = [UIColor colorWithRGB:233 g:233 b:233];
    
    _lShopLB = [[UILabel alloc] init];
    _lShopLB.font = _topLB.font;
    _lShopLB.textColor = [UIColor blackColor];
    [_lShopLB sizeToFit];
    _rShopLB = [[UILabel alloc] init];
    _rShopLB.font = _topLB.font;
    _rShopLB.textColor = _mainColor;
    [_rShopLB sizeToFit];
    _shopLB = [[UILabel alloc] init];
    _shopLB.font = _topLB.font;
    _shopLB.textColor = [UIColor grayColor];
    [_shopLB sizeToFit];
    
    _bottomLB = [[UILabel alloc] init];
    _bottomLB.font = AdapFont([APP_CONFIG appFontOfSize:13]);
    _bottomLB.textColor = [UIColor grayColor];
    [_bottomLB sizeToFit];
    
    _submitBtn = [[UIButton alloc] init];
    _submitBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:16]);
    _submitBtn.layer.cornerRadius = 5;
    _submitBtn.clipsToBounds = YES;
    _submitBtn.backgroundColor = _mainColor;
    [_submitBtn setTitle:@"提现" forState:UIControlStateNormal];
    [_submitBtn setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
    [_submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _allCashBtn = [[UIButton alloc] init];
    _allCashBtn.titleLabel.font = _bottomLB.font;
    [_allCashBtn setTitle:@"全部提现" forState:UIControlStateNormal];
    [_allCashBtn setTitleColor:_mainColor forState:UIControlStateNormal];
    [_allCashBtn addTarget:self action:@selector(allCashBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_allCashBtn sizeToFit];
    
    [self addSubview:self.lShopLB];
    [self addSubview:self.rShopLB];
    [self addSubview:self.shopLB];
    [self addSubview:self.topLB];
    [self addSubview:self.tfLeftLB];
    [self addSubview:self.priceTF];
    [self addSubview:self.tfLine];
    [self addSubview:self.bottomLB];
    [self addSubview:self.allCashBtn];
    [self addSubview:self.submitBtn];
    
    [self setContent];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_lShopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(25));
        make.top.equalTo(self).with.offset(AdaptatSize(25));
    }];
    [_rShopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lShopLB);
        make.left.equalTo(_lShopLB.mas_right).with.offset(AdaptatSize(25));
    }];
    [_shopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_rShopLB.mas_bottom).with.offset(10);
        make.left.equalTo(_rShopLB);
    }];
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lShopLB);
        make.top.equalTo(_shopLB.mas_bottom).with.offset(AdaptatSize(40));
    }];
    [_tfLeftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLB);
        make.top.equalTo(_topLB.mas_bottom).with.offset(AdaptatSize(30));
        make.size.mas_equalTo((CGSize){30, 30});
    }];
    [_priceTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_tfLeftLB.mas_right).with.offset(5);
        make.top.equalTo(_topLB.mas_bottom).with.offset(AdaptatSize(25));
        make.right.equalTo(self).with.offset(-AdaptatSize(25));
        make.height.mas_equalTo(AdaptatSize(50));
    }];
    [_tfLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLB);
        make.right.equalTo(_priceTF);
        make.bottom.equalTo(_priceTF).with.offset(3);
        make.height.mas_equalTo(1);
    }];
    [_bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tfLine).with.offset(AdaptatSize(20));
        make.left.equalTo(_topLB);
    }];
    [_allCashBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_bottomLB);
        make.left.equalTo(_bottomLB.mas_right);
    }];
    [_submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLB);
        make.right.equalTo(_tfLine);
        make.top.equalTo(_bottomLB.mas_bottom).with.offset(AdaptatSize(20));
        make.height.mas_equalTo(45);
    }];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL ret = YES;
    NSString *textStr = [self changeCharactersInRange:range replacementString:string text:textField.text];
    if (textStr.length > 0) {
        if ([textStr isValidMoneyCharge]) {
            ret = YES;
        }else {
            ret = NO;
        }
    }else {
        ret = YES;
    }
    return ret;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    
    return YES;
}

- (NSString *)changeCharactersInRange:(NSRange)range replacementString:(NSString *)string text:(NSString *)text  {
    NSMutableString * futureString = [NSMutableString stringWithString:text];
    if (range.length == 0) {
        [futureString insertString:string atIndex:range.location];
    } else {
        [futureString deleteCharactersInRange:range];
    }
    return futureString;
}

@end
