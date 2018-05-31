//
//  GJApplyUserTopView.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/14.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyUserTopView.h"

@interface GJApplyUserTopView ()
@property (nonatomic, strong) UIView *topBackV;
@property (nonatomic, strong) UIView *bottomBackV;
@property (nonatomic, strong) UIButton *topButton;
@property (nonatomic, strong) UIButton *topRightBtn;
@property (nonatomic, strong) UIButton *partner_1_Btn;
@property (nonatomic, strong) UIButton *partner_2_Btn;
@property (nonatomic, strong) UIButton *partner_3_Btn;
@property (nonatomic, strong) UIButton *partner_4_Btn;
@property (nonatomic, strong) UIButton *bottom_1_Btn;
@property (nonatomic, strong) UIButton *bottom_2_Btn;
@property (nonatomic, strong) UIButton *bottom_3_Btn;
@property (nonatomic, strong) UIButton *bottom_4_Btn;
@end

@implementation GJApplyUserTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)partner_1_BtnCLick {
    BLOCK_SAFE(_blockClick_1)();
}

- (void)partner_2_BtnCLick {
    BLOCK_SAFE(_blockClick_2)();
}

- (void)partner_3_BtnCLick {
    BLOCK_SAFE(_blockClick_3)();
}

- (void)partner_4_BtnCLick {
    BLOCK_SAFE(_blockClick_4)();
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    _topBackV = [[UIView alloc] init];
    _bottomBackV = [[UIView alloc] init];
    
    _topButton  =[GJApplyUserTopView createButtonTitle:@"成为全智易联合伙人" font:0 norImg:nil color:[UIColor whiteColor] t:0];
    _topButton.titleLabel.font = AdapFont([APP_CONFIG appBoldFontOfSize:16]);
    _topRightBtn  =[GJApplyUserTopView createButtonTitle:nil font:0 norImg:@"Doubt" color:nil t:0];
    CGFloat f = 14;
    CGFloat f2 = 12;
    _partner_1_Btn  =[GJApplyUserTopView createButtonTitle:@"初级合伙" font:f norImg:@"Partner1" color:[UIColor whiteColor] t:1];
    _partner_2_Btn  =[GJApplyUserTopView createButtonTitle:@"区县合伙" font:f norImg:@"Partner2" color:[UIColor whiteColor] t:1];
    _partner_3_Btn  =[GJApplyUserTopView createButtonTitle:@"城市合伙" font:f norImg:@"Partner3" color:[UIColor whiteColor] t:1];
    _partner_4_Btn  =[GJApplyUserTopView createButtonTitle:@"天使投资" font:f norImg:@"Partner4" color:[UIColor whiteColor] t:1];
    [_partner_1_Btn addTarget:self action:@selector(partner_1_BtnCLick) forControlEvents:UIControlEventTouchUpInside];
    [_partner_2_Btn addTarget:self action:@selector(partner_2_BtnCLick) forControlEvents:UIControlEventTouchUpInside];
    [_partner_3_Btn addTarget:self action:@selector(partner_3_BtnCLick) forControlEvents:UIControlEventTouchUpInside];
    [_partner_4_Btn addTarget:self action:@selector(partner_4_BtnCLick) forControlEvents:UIControlEventTouchUpInside];
    
    _bottom_1_Btn  =[GJApplyUserTopView createButtonTitle:@"推荐商家佣金" font:f2 norImg:@"item1" color:[UIColor lightGrayColor] t:2];
    _bottom_2_Btn  =[GJApplyUserTopView createButtonTitle:@"推荐合伙佣金" font:f2 norImg:@"item2" color:[UIColor lightGrayColor] t:2];
    _bottom_3_Btn  =[GJApplyUserTopView createButtonTitle:@"直推商家收益" font:f2 norImg:@"item3" color:[UIColor lightGrayColor] t:2];
    _bottom_4_Btn  =[GJApplyUserTopView createButtonTitle:@"间推商家收益" font:f2 norImg:@"item4" color:[UIColor lightGrayColor] t:2];
    
    [self addSubview:_topBackV];
    [self addSubview:_bottomBackV];
    [self addSubview:_topButton];
    [self addSubview:_topRightBtn];
    [self addSubview:_partner_1_Btn];
    [self addSubview:_partner_2_Btn];
    [self addSubview:_partner_3_Btn];
    [self addSubview:_partner_4_Btn];
    [self addSubview:_bottom_1_Btn];
    [self addSubview:_bottom_2_Btn];
    [self addSubview:_bottom_3_Btn];
    [self addSubview:_bottom_4_Btn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrames];
}

- (void)updateFrames {
    [_topBackV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.bottom.equalTo(self.mas_centerY).with.offset(5);
    }];
    [_bottomBackV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.top.equalTo(_topBackV.mas_bottom);
    }];
    [_topButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset([UIApplication sharedApplication].statusBarFrame.size.height+10);
        make.left.equalTo(self).with.offset(AdaptatSize(20));
        if (SCREEN_H >= kGJIphoneX) {
            make.size.mas_equalTo((CGSize){AdaptatSize(180), 30});
        }else if (SCREEN_H <= kGJIphone5Height) {
            make.size.mas_equalTo((CGSize){AdaptatSize(185), 30});
        }else {
            make.size.mas_equalTo((CGSize){AdaptatSize(170), 30});
        }
    }];
    _topButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Getinto"]];
    [_topButton addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.centerY.equalTo(_topButton);
    }];
    
    [_topRightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-7);
        make.centerY.equalTo(_topButton);
        make.size.mas_equalTo((CGSize){AdaptatSize(50), AdaptatSize(30)});
    }];
    CGSize btnSize = (CGSize){AdaptatSize(80), AdaptatSize(80)};
    [_partner_1_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.bottom.equalTo(_topBackV.mas_bottom).with.offset(-5);
        make.size.mas_equalTo(btnSize);
    }];
    [_partner_2_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_partner_1_Btn.mas_right).with.offset(10);
        make.size.mas_equalTo(btnSize);
        make.centerY.equalTo(_partner_1_Btn);
    }];
    [_partner_3_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_partner_2_Btn.mas_right).with.offset(10);
        make.size.mas_equalTo(btnSize);
        make.centerY.equalTo(_partner_1_Btn);
    }];
    [_partner_4_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_partner_3_Btn.mas_right).with.offset(10);
        make.size.mas_equalTo(btnSize);
        make.centerY.equalTo(_partner_1_Btn);
    }];
    [_bottom_1_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bottomBackV.mas_centerX).with.offset(-AdaptatSize(45));
        make.bottom.equalTo(_bottomBackV.mas_centerY).with.offset(-AdaptatSize(10));
    }];
    [_bottom_2_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomBackV.mas_centerX).with.offset(AdaptatSize(15));
        make.bottom.equalTo(_bottomBackV.mas_centerY).with.offset(-AdaptatSize(10));
    }];
    [_bottom_3_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_bottomBackV.mas_centerX).with.offset(-AdaptatSize(45));
        make.top.equalTo(_bottomBackV.mas_centerY).with.offset(AdaptatSize(10));
    }];
    [_bottom_4_Btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_bottomBackV.mas_centerX).with.offset(AdaptatSize(15));
        make.top.equalTo(_bottomBackV.mas_centerY).with.offset(AdaptatSize(10));
    }];
}

+ (UIButton *)createButtonTitle:(NSString *)title font:(CGFloat)font norImg:(NSString *)norImg color:(UIColor *)color t:(NSInteger)type {
    UIButton *btn = [[UIButton alloc] init];
    if (title) {
        btn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:font]);
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    [btn setTitleColor:color forState:UIControlStateHighlighted];
    if (norImg) {
        [btn setImage:[UIImage imageNamed:norImg] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:norImg] forState:UIControlStateHighlighted];
    }
    if (type == 1) {
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(AdaptatSize(50), -AdaptatSize(45), 0, 0)];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, AdaptatSize(15), AdaptatSize(20), 0)];
    }
    if (type == 2) {
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -8, 0, 0)];
    }
    return btn;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [self.layer insertSublayer:gradient atIndex:0];
    gradient.colors = @[
                        (__bridge id)[UIColor colorWithRGB:253 g:102 b:40].CGColor,(__bridge id)[UIColor colorWithRGB:255 g:65 b:19].CGColor];
    gradient.locations = @[@0,@1];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.frame = CGRectMake(0, 0, self.width, self.height/2+5);
}

@end
