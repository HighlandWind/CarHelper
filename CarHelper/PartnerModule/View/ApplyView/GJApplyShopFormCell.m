//
//  GJApplyShopFormCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/21.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyShopFormCell.h"

@interface GJApplyShopFormCell ()
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) NSString *centerBtnText;
@property (nonatomic, strong) NSString *rightImgS;

@property (nonatomic, strong) UIView *backV;
@property (nonatomic, strong) UILabel *leftLB;
@property (nonatomic, strong) UIButton *centerBtn;
@property (nonatomic, strong) UIImageView *rightImgV;
@end

@implementation GJApplyShopFormCell

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
    [_backV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.bottom.equalTo(self);
        make.width.mas_equalTo(SCREEN_W-20);
    }];
    [_leftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(_backV).with.offset(10);
    }];
    _rightImgV = [[UIImageView alloc] init];
    _rightImgV.contentMode = UIViewContentModeScaleAspectFit;
    if (_rightImgS) {
        _rightImgV.image = [UIImage imageNamed:_rightImgS];
        [self.contentView addSubview:_rightImgV];
    }
    
    _centerTF = [[UITextField alloc] init];
    _centerTF.font = [APP_CONFIG appFontOfSize:15];
    _centerTF.placeholder = _centerBtnText;
    _centerTF.keyboardType = UIKeyboardTypeNumberPad;
    _centerTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    if (_index == 2 || _index == 4) {
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
        [_rightImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(_backV).with.offset(-7);
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

+ (GJApplyShopFormCell *)installTitle1:(NSString *)title1 title2:(NSString *)title2 rightImg:(NSString *)rightImg index:(NSInteger)index {
    GJApplyShopFormCell *cell = [[GJApplyShopFormCell alloc] init];
    [cell setTitle1:title1 title2:(NSString *)title2 rightImg:rightImg index:index];
    return cell;
}

@end
