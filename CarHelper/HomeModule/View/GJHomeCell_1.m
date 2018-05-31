//
//  GJHomeCell_1.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJHomeCell_1.h"
#import "GJThreeColumnLabel.h"
#import "GJHomeShopData.h"

@interface GJHomeCell_1 ()
@property (nonatomic, strong) UISegmentedControl *segmentCtl;
@property (nonatomic, strong) GJThreeColumnLabel *threeColumnLB;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *centerButton;
@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UIButton *leftButton1;
@property (nonatomic, strong) UIButton *centerButton1;
@property (nonatomic, strong) UIButton *rightButton1;
@end

@implementation GJHomeCell_1

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setShopData:(GJHomeShopData *)shopData {
    _shopData = shopData;
    [_threeColumnLB setLeft:_shopData.dp_yyr_sr center:_shopData.dp_user_add right:_shopData.fr_money];
}

- (void)buttonClick:(UIButton *)button {
    if (button == _leftButton1) {
        BLOCK_SAFE(_blockClickThreeBtn)(1);
    }
    if (button == _centerButton1) {
        BLOCK_SAFE(_blockClickThreeBtn)(2);
    }
    if (button == _rightButton1) {
        BLOCK_SAFE(_blockClickThreeBtn)(3);
    }
    if (button == _leftButton) {
        BLOCK_SAFE(_blockClickThreeBtn)(4);
    }
    if (button == _centerButton) {
        BLOCK_SAFE(_blockClickThreeBtn)(5);
    }
    if (button == _rightButton) {
        BLOCK_SAFE(_blockClickThreeBtn)(6);
    }
}

- (void)selectSegment {
    BLOCK_SAFE(_blockClickSegment)(_segmentCtl.selectedSegmentIndex);
}

- (void)setupSubViews {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSArray *titles = @[@"今日", @"昨日", @"近7天"];
    _segmentCtl = [[UISegmentedControl alloc] initWithItems:titles];
    _segmentCtl.selectedSegmentIndex = 0;
    _segmentCtl.tintColor = [UIColor whiteColor];
    NSDictionary *dicS = [NSDictionary dictionaryWithObjectsAndKeys:APP_CONFIG.appMainColor,
                         NSForegroundColorAttributeName,
                         AdapFont([APP_CONFIG appFontOfSize:13]),
                         NSFontAttributeName,nil];
    [_segmentCtl setTitleTextAttributes:dicS forState:UIControlStateSelected];
    [_segmentCtl addTarget:self action:@selector(selectSegment) forControlEvents:UIControlEventValueChanged];
    
    _threeColumnLB = [GJThreeColumnLabel installLeft:@"营业收入" center:@"新增会员" right:@"异店分润"];
    
    _leftButton1 = [self createButtonTitle:@"好礼核检" image:@"heyan"];
    _centerButton1 = [self createButtonTitle:@"赠送积分" image:@"jifen"];
    _rightButton1 = [self createButtonTitle:@"店铺收益" image:@"shouyi"];
    
    _leftButton = [self createButtonTitle:@"店铺相册" image:@"xiangce"];
    _centerButton = [self createButtonTitle:@"店铺充值" image:@"chongzhi"];
    _rightButton = [self createButtonTitle:@"会员管理" image:@"huiyuan"];
    
    [self.contentView addSubview:_segmentCtl];
    [self.contentView addSubview:_threeColumnLB];
    
    [self updateFrames];
}

- (void)updateFrames {
    [_segmentCtl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.mas_centerY).with.offset(-AdaptatSize(43));
    }];
    [_threeColumnLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(_segmentCtl.mas_top).with.offset(-AdaptatSize(12));
        make.height.mas_equalTo(AdaptatSize(60));
    }];
    [_centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).with.offset(-AdaptatSize(15));
        make.width.height.mas_equalTo(AdaptatSize(70));
    }];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_centerButton);
        make.right.equalTo(_centerButton.mas_left).with.offset(-AdaptatSize(50));
    }];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_centerButton);
        make.left.equalTo(_centerButton.mas_right).with.offset(AdaptatSize(50));
    }];
    [_centerButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(_centerButton.mas_top).with.offset(-AdaptatSize(15));
        make.width.height.mas_equalTo(AdaptatSize(70));
    }];
    [_leftButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_centerButton1);
        make.right.equalTo(_centerButton1.mas_left).with.offset(-AdaptatSize(50));
    }];
    [_rightButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_centerButton1);
        make.left.equalTo(_centerButton1.mas_right).with.offset(AdaptatSize(50));
    }];
}

- (UIButton *)createButtonTitle:(NSString *)title image:(NSString *)image {
    UIButton *button = [[UIButton alloc] init];
    button.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:14]);
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(45, -38, 0, 0)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 20, 0)];
    [self.contentView addSubview:button];
    return button;
}

- (CGFloat)height {
    return AdaptatSize(330);
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [self.layer insertSublayer:gradient atIndex:0];
    gradient.colors = @[
                        (__bridge id)[UIColor colorWithHexRGB:@"#ff7840"].CGColor,(__bridge id)[UIColor colorWithHexRGB:@"#ff3936"].CGColor];
    gradient.locations = @[@0,@1];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1.0, 0.5);
    gradient.frame = CGRectMake(0, 0, self.width, AdaptatSize(141));
}

@end
