//
//  GJMineCarListTopCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineCarListTopCell.h"

@interface GJMineCarListTopCell ()
@property (nonatomic, strong) UILabel *topLeftLB;
@property (nonatomic, strong) UILabel *topRightLB;
@property (nonatomic, strong) UILabel *midLB;
@property (nonatomic, strong) UILabel *btmLB;
@property (nonatomic, strong) UIButton *verifyBtn;
@property (nonatomic, strong) UITextField *midTF;
@property (nonatomic, strong) UITextField *btmTF;
@end

@implementation GJMineCarListTopCell

- (void)verifyBtnClick {
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    CGFloat textFont = 16;
    
    _topLeftLB = [[UILabel alloc] init];
    _topLeftLB.font = [APP_CONFIG appAdaptBoldFontOfSize:textFont];
    _topLeftLB.text = @"车牌号：";
    _topLeftLB.textColor = APP_CONFIG.darkTextColor;
    [_topLeftLB sizeToFit];
    
    _topRightLB = [[UILabel alloc] init];
    _topRightLB.font = [APP_CONFIG appAdaptBoldFontOfSize:textFont];
    _topRightLB.text = @"贵A-12345";
    _topRightLB.textColor = APP_CONFIG.darkTextColor;
    [_topRightLB sizeToFit];
    
    _midLB = [[UILabel alloc] init];
    _midLB.font = [APP_CONFIG appAdaptBoldFontOfSize:textFont];
    _midLB.text = @"发动机号：";
    _midLB.textColor = APP_CONFIG.darkTextColor;
    [_midLB sizeToFit];
    
    _midTF = [[UITextField alloc] init];
    _midTF.font = [APP_CONFIG appAdaptFontOfSize:textFont];
    _midTF.backgroundColor = [UIColor whiteColor];
    _midTF.placeholder = @" 请输入发动机号";
    
    _btmLB = [[UILabel alloc] init];
    _btmLB.font = [APP_CONFIG appAdaptBoldFontOfSize:textFont];
    _btmLB.text = @"车架号：";
    _btmLB.textColor = APP_CONFIG.darkTextColor;
    [_btmLB sizeToFit];
    
    _btmTF = [[UITextField alloc] init];
    _btmTF.font = [APP_CONFIG appAdaptFontOfSize:textFont];
    _btmTF.backgroundColor = [UIColor whiteColor];
    _btmTF.placeholder = @" 请输入机架号";
    
    _verifyBtn = [[UIButton alloc] init];
    _verifyBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:textFont];
    [_verifyBtn setTitle:@"认证" forState:UIControlStateNormal];
    _verifyBtn.backgroundColor = APP_CONFIG.appMainColor;
    _verifyBtn.layer.cornerRadius = 5;
    _verifyBtn.clipsToBounds = YES;
    [_verifyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_verifyBtn addTarget:self action:@selector(verifyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_topLeftLB];
    [self.contentView addSubview:_topRightLB];
    [self.contentView addSubview:_midLB];
    [self.contentView addSubview:_btmLB];
    [self.contentView addSubview:_midTF];
    [self.contentView addSubview:_btmTF];
    [self.contentView addSubview:_verifyBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_topLeftLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(40));
        make.top.equalTo(self).with.offset(AdaptatSize(30));
    }];
    [_topRightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-AdaptatSize(40));
        make.centerY.equalTo(self.topLeftLB);
    }];
    [_midLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topLeftLB);
        make.top.equalTo(self.topLeftLB.mas_bottom).with.offset(AdaptatSize(30));
    }];
    [_midTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.topRightLB);
        make.centerY.equalTo(self.midLB);
        make.height.mas_equalTo(AdaptatSize(35));
        make.width.mas_equalTo(AdaptatSize(170));
    }];
    [_btmLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topLeftLB);
        make.top.equalTo(self.midLB.mas_bottom).with.offset(AdaptatSize(30));
    }];
    [_btmTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.topRightLB);
        make.centerY.equalTo(self.btmLB);
        make.width.height.equalTo(self.midTF);
    }];
    [_verifyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(15));
        make.right.equalTo(self).with.offset(AdaptatSize(-15));
        make.bottom.equalTo(self);
        make.height.mas_offset(AdaptatSize(30));
    }];
}

@end
