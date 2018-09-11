//
//  GJScheduleCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/21.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJScheduleCell.h"
#import "GJScheduleCellView.h"

@interface GJScheduleCell ()
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UILabel *topLB;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UIView *topBackLine;
@property (nonatomic, strong) UIView *midLine;
@property (nonatomic, strong) GJScheduleCellView *topSV;
@property (nonatomic, strong) GJScheduleCellView *midSV;
@property (nonatomic, strong) GJScheduleCellView *btmSV;
@end

@implementation GJScheduleCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)moreBtnClick {
    
}

- (void)setupSubviews {
    self.backgroundColor = APP_CONFIG.whiteGrayColor;
    
    _topLine = [[UIView alloc] init];
    _topLine.backgroundColor = APP_CONFIG.appMainColor;
    
    _topBackLine = [[UIView alloc] init];
    _topBackLine.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _topLB = [[UILabel alloc] init];
    _topLB.font = [APP_CONFIG appAdaptBoldFontOfSize:14];
    _topLB.textColor = APP_CONFIG.darkTextColor;
    _topLB.text = @"待办事项";
    [_topLB sizeToFit];
    
    _moreBtn = [[UIButton alloc] init];
    _moreBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:12];
    [_moreBtn setTitleColor:APP_CONFIG.grayTextColor forState:UIControlStateNormal];
    [_moreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
    [_moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _midLine = [[UIView alloc] init];
    _midLine.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _topSV = [GJScheduleCellView installColor:[UIColor colorWithRGB:236 g:250 b:254]];
    _midSV = [GJScheduleCellView installColor:[UIColor colorWithRGB:237 g:255 b:245]];
    _btmSV = [GJScheduleCellView installColor:[UIColor colorWithRGB:253 g:250 b:236]];
    _btmSV.model = @"111";
    
    [self.contentView addSubview:_topLine];
    [self.contentView addSubview:_topBackLine];
    [self.contentView addSubview:_topLB];
    [self.contentView addSubview:_moreBtn];
    [self.contentView addSubview:_midLine];
    [self.contentView addSubview:_topSV];
    [self.contentView addSubview:_midSV];
    [self.contentView addSubview:_btmSV];
}

- (void)layoutSubviews {
    [_topBackLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(AdaptatSize(10));
    }];
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(_topBackLine.mas_bottom).with.offset(AdaptatSize(10));
        make.height.mas_equalTo(AdaptatSize(16));
        make.width.mas_equalTo(3);
    }];
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLine.mas_right).with.offset(7);
        make.centerY.height.equalTo(_topLine);
    }];
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_topLB);
        make.right.equalTo(self);
        make.width.mas_equalTo(AdaptatSize(70));
        make.height.mas_equalTo(AdaptatSize(30));
    }];
    [_midLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLine);
        make.right.equalTo(self);
        make.top.equalTo(_topLB.mas_bottom).with.offset(7);
        make.height.mas_equalTo(1);
    }];
    [_topSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_midLine.mas_bottom).with.offset(AdaptatSize(8));
        make.left.equalTo(_topLine);
        make.right.equalTo(self).with.offset(-10);
        make.height.mas_equalTo(AdaptatSize(40));
    }];
    [_midSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_topSV.mas_bottom).with.offset(AdaptatSize(5));
        make.left.equalTo(_topLine);
        make.right.equalTo(self).with.offset(-10);
        make.height.mas_equalTo(AdaptatSize(40));
    }];
    [_btmSV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_midSV.mas_bottom).with.offset(AdaptatSize(5));
        make.left.equalTo(_topLine);
        make.right.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self);
    }];
}

- (CGFloat)height {
    return AdaptatSize(266);
}

@end
