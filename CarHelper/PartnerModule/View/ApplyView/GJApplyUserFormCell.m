//
//  GJApplyUserFormCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyUserFormCell.h"

@interface GJApplyUserFormCell ()
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *centerBtnText;
@property (nonatomic, strong) NSString *rightImgS;

@property (nonatomic, strong) UIView *backV;
@property (nonatomic, strong) UILabel *leftLB;
@property (nonatomic, strong) UIButton *centerBtn;
@property (nonatomic, strong) UIImageView *rightImgV;
@end

@implementation GJApplyUserFormCell

- (void)setSelectTitle:(NSString *)title {
    [_centerBtn setTitle:title forState:UIControlStateNormal];
}

- (void)buttonClick {
    BLOCK_SAFE(_blockBtnClick)();
}

- (void)setTitle1:(NSString *)title1 title2:(NSString *)title2 rightImg:(NSString *)rightImg index:(NSInteger)index {
    _index = index;
    _leftLB.text = title1;
    _centerBtnText = title2;
    _rightImgS = rightImg;
    
    [self updateFrames];
}

- (void)setTitle2:(NSString *)title2 {
    [_centerBtn setTitle:title2 forState:UIControlStateNormal];
}

#pragma mark - init
- (void)commonInit {
    _backV = [[UIView alloc] init];
    _backV.backgroundColor = [UIColor colorWithRGB:242 g:242 b:242];
    
    _leftLB = [[UILabel alloc] init];
    _leftLB.font = AdapFont([APP_CONFIG appFontOfSize:14]);
    _leftLB.textColor = APP_CONFIG.blackTextColor;
    [_leftLB sizeToFit];
    
    [self.contentView addSubview:_backV];
    [self.contentView addSubview:_leftLB];
}

- (void)updateFrames {
    if (_index == 6) {
        _codeBtn = [[GJVerifyButton alloc] initWithFrame:CGRectZero verifyTitle:@"获取验证码"];
        _codeBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:13]);
        _codeBtn.selected = NO;
        _codeBtn.enabled = NO;
        _codeBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_codeBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_codeBtn];
        [_codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).with.offset(-10);
            make.top.bottom.equalTo(self);
            make.width.mas_equalTo(AdaptatSize(110));
        }];
        [_backV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(10);
            make.top.bottom.equalTo(self);
            make.right.equalTo(_codeBtn.mas_left).with.offset(-10);
        }];
    }else {
        [_backV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(10);
            make.top.bottom.equalTo(self);
            make.width.mas_equalTo(SCREEN_W-20);
        }];
    }
    
    [_leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(_backV).with.offset(10);
    }];
    if (_rightImgS) {
        _rightImgV = [[UIImageView alloc] init];
        _rightImgV.contentMode = UIViewContentModeScaleAspectFit;
        _rightImgV.image = [UIImage imageNamed:_rightImgS];
        [self.contentView addSubview:_rightImgV];
    }
    
    _centerTF = [[UITextField alloc] init];
    _centerTF.font = [APP_CONFIG appFontOfSize:15];
    _centerTF.placeholder = _centerBtnText;
    _centerTF.keyboardType = UIKeyboardTypeNumberPad;
    _centerTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    if (_index == 1) {
        [_rightImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(_backV).with.offset(-15);
        }];
        [self.contentView addSubview:_centerTF];
        [_centerTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_backV).with.offset(AdaptatSize(90));
            make.centerY.equalTo(_leftLB);
            make.top.bottom.equalTo(self);
            make.right.equalTo(_rightImgV.mas_left).with.offset(-10);
        }];
        UIButton *scanBtn = [[UIButton alloc] init];
        [self.contentView addSubview:scanBtn];
        [scanBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [scanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self);
            make.left.equalTo(_centerTF.mas_right);
        }];
    }
    else if (_index >= 2 && _index <= 4) {
        _centerBtn = [[UIButton alloc] init];
        [self.contentView addSubview:_centerBtn];
        _centerBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:15]);
        if (_centerBtnText) {
            [_centerBtn setTitle:_centerBtnText forState:UIControlStateNormal];
        }
        [_centerBtn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [_centerBtn setTitleColor:APP_CONFIG.blackTextColor forState:UIControlStateNormal];
        _centerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_backV).with.offset(AdaptatSize(90));
            make.centerY.equalTo(_leftLB);
            make.top.bottom.equalTo(self);
            make.right.equalTo(_backV);
        }];
        if (_rightImgV) {
            [_rightImgV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.right.equalTo(_backV).with.offset(-17);
            }];
        }
    }
    else if (_index == 5) {
        [self.contentView addSubview:_centerTF];
        [_centerTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_backV).with.offset(AdaptatSize(90));
            make.centerY.equalTo(_leftLB);
            make.top.bottom.equalTo(self);
            make.right.equalTo(_backV);
        }];
    }
    else {
        [self.contentView addSubview:_centerTF];
        [_centerTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_backV).with.offset(AdaptatSize(90));
            make.centerY.equalTo(_leftLB);
            make.top.bottom.equalTo(self);
            make.right.equalTo(_backV);
        }];
    }
}

- (CGFloat)height {
    return AdaptatSize(45);
}

+ (GJApplyUserFormCell *)installTitle1:(NSString *)title1 title2:(NSString *)title2 rightImg:(NSString *)rightImg index:(NSInteger)index {
    GJApplyUserFormCell *cell = [[GJApplyUserFormCell alloc] init];
    [cell setTitle1:title1 title2:(NSString *)title2 rightImg:rightImg index:index];
    return cell;
}

@end
