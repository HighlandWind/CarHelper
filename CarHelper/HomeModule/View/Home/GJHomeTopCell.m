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

- (void)buttonClick:(UIButton *)btn {
    BLOCK_SAFE(_blockClickFiveBtns)(btn.tag);
}

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
    _broadImg.image = [UIImage imageNamed:@"home_noti_remind"];
    
    _topLeft2Btn = [self createButtonTitle:@"停车" titleColor:[UIColor whiteColor] image:@"home_park_white" tag:1];
    _topLeft1Btn = [self createButtonTitle:@"洗车" titleColor:[UIColor whiteColor] image:@"home_washcar_white" tag:2];
    _topCenterBtn = [self createButtonTitle:@"拼车" titleColor:[UIColor whiteColor] image:@"home_pin_white" tag:3];
    _topRight1Btn = [self createButtonTitle:@"汽车用品" titleColor:[UIColor whiteColor] image:@"home_chepin_white" tag:4];
    _topRight2Btn = [self createButtonTitle:@"更多" titleColor:[UIColor whiteColor] image:@"home_more_white" tag:5];
    
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
    _broadcastBG.frame = CGRectMake(AdaptatSize(12), self.height - AdaptatSize(32), SCREEN_W - AdaptatSize(24), AdaptatSize(32));
    [_broadImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.broadcastBG);
        make.left.equalTo(self.broadcastBG).with.offset(10);
        make.height.mas_equalTo(self.broadcastBG.height - AdaptatSize(17));
        make.width.mas_equalTo(self.broadcastBG.height);
    }];
    [_broadLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.broadcastBG);
        make.left.equalTo(self.broadImg.mas_right);
        make.right.equalTo(self.broadcastBG).with.offset(-10);
    }];
    
    _topCenterBtn.hidden = _topLeft1Btn.hidden = _topLeft2Btn.hidden = _topRight1Btn.hidden = _topRight2Btn.hidden = NO;
    [_topCenterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.broadcastBG.mas_top).with.offset(-10);
        make.width.height.mas_equalTo(AdaptatSize(65));
    }];
    [_topLeft1Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(self.topCenterBtn);
        make.right.equalTo(self.topCenterBtn.mas_left).with.offset(-10);
    }];
    [_topLeft2Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(self.topCenterBtn);
        make.right.equalTo(self.topLeft1Btn.mas_left).with.offset(-10);
    }];
    [_topRight1Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(self.topCenterBtn);
        make.left.equalTo(self.topCenterBtn.mas_right).with.offset(10);
    }];
    [_topRight2Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(self.topCenterBtn);
        make.left.equalTo(self.topRight1Btn.mas_right).with.offset(10);
    }];
}

- (CGFloat)height {
    return _cellHeight;
}

- (UIButton *)createButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor image:(NSString *)image tag:(NSInteger)tag {
    UIButton *btn = [[UIButton alloc] init];
    btn.tag = tag;
    btn.hidden = YES;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, AdaptatSize(28), 0)];
    UILabel *titleLB = [[UILabel alloc] init];
    titleLB.font = [APP_CONFIG appAdaptBoldFontOfSize:14];
    titleLB.text = title;
    titleLB.textColor = titleColor;
    [titleLB sizeToFit];
    [btn addSubview:titleLB];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(btn).with.offset(-5);
        make.centerX.equalTo(btn);
    }];
    return btn;
}

@end
