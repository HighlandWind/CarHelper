//
//  GJHomeTopCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeTopCell.h"

@interface GJHomeTopCell ()
@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) UIButton *broadcastBG;
@property (nonatomic, strong) UIImageView *broadImg;
@property (nonatomic, strong) UILabel *broadLB;

@property (nonatomic, strong) UIButton *topCenterBtn;
@property (nonatomic, strong) UIButton *topLeft1Btn;
@property (nonatomic, strong) UIButton *topLeft2Btn;
@property (nonatomic, strong) UIButton *topRight1Btn;
@property (nonatomic, strong) UIButton *topRight2Btn;
@end

@implementation GJHomeTopCell

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    if (SCREEN_H >= kGJIphoneX) {
        _cellHeight = AdaptatSize(230) + 15;
    }else if (SCREEN_H <= kGJIphone5Height) {
        _cellHeight = AdaptatSize(210) + 15;
    }else {
        _cellHeight = AdaptatSize(190) + 15;
    }
    
    _broadcastBG = [[UIButton alloc] init];
    _broadcastBG.backgroundColor = [UIColor whiteColor];
    _broadcastBG.layer.cornerRadius = 5;
    _broadcastBG.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _broadcastBG.layer.shadowOpacity = 0.2;
    _broadcastBG.layer.shadowRadius = 4.f;
    _broadcastBG.layer.shadowOffset = CGSizeMake(0,0);
    
    _broadImg = [[UIImageView alloc] init];
    _broadImg.contentMode = UIViewContentModeScaleAspectFit;
    
    _broadLB = [[UILabel alloc] init];
    _broadLB.font = [APP_CONFIG appAdaptBoldFontOfSize:12];
    _broadLB.textColor = [UIColor grayColor];
    _broadLB.textAlignment = NSTextAlignmentCenter;
    _broadLB.text = @"您的车辆驶入了限行路段？请及时进行标注！";
    _broadImg.image = [UIImage imageNamed:@"setup"];
    
    _topCenterBtn = [self createButtonTitle:@"拼车" titleColor:[UIColor whiteColor] image:@"scan"];
    _topLeft1Btn = [self createButtonTitle:@"洗车" titleColor:[UIColor whiteColor] image:@"scan"];
    _topLeft2Btn = [self createButtonTitle:@"停车" titleColor:[UIColor whiteColor] image:@"scan"];
    _topRight1Btn = [self createButtonTitle:@"汽车用品" titleColor:[UIColor whiteColor] image:@"scan"];
    _topRight2Btn = [self createButtonTitle:@"更多" titleColor:[UIColor whiteColor] image:@"scan"];
    
    [self.contentView addSubview:_broadcastBG];
    [self.contentView addSubview:_broadImg];
    [self.contentView addSubview:_broadLB];
    [self.contentView addSubview:_topCenterBtn];
    [self.contentView addSubview:_topLeft1Btn];
    [self.contentView addSubview:_topLeft2Btn];
    [self.contentView addSubview:_topRight1Btn];
    [self.contentView addSubview:_topRight2Btn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _broadcastBG.frame = CGRectMake(10, self.height-32, SCREEN_W-20, 32);
    [_broadImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_broadcastBG);
        make.left.equalTo(_broadcastBG).with.offset(10);
        make.height.mas_equalTo(_broadcastBG.height-10);
        make.width.mas_equalTo(_broadcastBG.height);
    }];
    [_broadLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_broadcastBG);
        make.left.equalTo(_broadImg.mas_right);
        make.right.equalTo(_broadcastBG).with.offset(-10);
    }];
    
    _topCenterBtn.hidden = _topLeft1Btn.hidden = _topLeft2Btn.hidden = _topRight1Btn.hidden = _topRight2Btn.hidden = NO;
    [_topCenterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(_broadcastBG.mas_top).with.offset(-10);
        make.width.height.mas_equalTo(AdaptatSize(60));
    }];
    [_topLeft1Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_topCenterBtn);
        make.right.equalTo(_topCenterBtn.mas_left).with.offset(-10);
    }];
    [_topLeft2Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_topCenterBtn);
        make.right.equalTo(_topLeft1Btn.mas_left).with.offset(-10);
    }];
    [_topRight1Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_topCenterBtn);
        make.left.equalTo(_topCenterBtn.mas_right).with.offset(10);
    }];
    [_topRight2Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_topCenterBtn);
        make.left.equalTo(_topRight1Btn.mas_right).with.offset(10);
    }];
}

- (CGFloat)height {
    return _cellHeight;
}

- (UIButton *)createButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor image:(NSString *)image {
    UIButton *btn = [[UIButton alloc] init];
    btn.hidden = YES;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, AdaptatSize(25), 0)];
    UILabel *titleLB = [[UILabel alloc] init];
    titleLB.font = [APP_CONFIG appAdaptBoldFontOfSize:15];
    titleLB.text = title;
    titleLB.textColor = [UIColor whiteColor];
    [titleLB sizeToFit];
    [btn addSubview:titleLB];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(btn).with.offset(-5);
        make.centerX.equalTo(btn);
    }];
    return btn;
}

@end
