//
//  GJPartnerTopCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPartnerTopCell.h"
#import "GJThreeColumnLabel.h"

@interface GJPartnerTopCell ()
@property (nonatomic, strong) UIImageView *backImgV;
@property (nonatomic, strong) UISegmentedControl *segmentCtl;
@property (nonatomic, strong) GJThreeColumnLabel *threeColumnLB;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *centerButton;
@property (nonatomic, strong) UIButton *centerButton1;
@property (nonatomic, strong) UIButton *rightButton;
@end

@implementation GJPartnerTopCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubView];
    }
    return self;
}

- (void)buttonClick:(UIButton *)button {
    if (button == _leftButton) {
        BLOCK_SAFE(_blockClickFourBtn)(1);
    }else if (button == _centerButton) {
        BLOCK_SAFE(_blockClickFourBtn)(2);
    }else if (button == _centerButton1) {
        BLOCK_SAFE(_blockClickFourBtn)(3);
    }else {
        BLOCK_SAFE(_blockClickFourBtn)(4);
    }
}

- (void)selectSegment {
    BLOCK_SAFE(_blockClickSegment)(_segmentCtl.selectedSegmentIndex);
}

- (void)setLeft:(NSString *)left center:(NSString *)center right:(NSString *)right {
    [_threeColumnLB setLeft:left center:center right:right];
}

- (void)setupSubView {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _backImgV  =[[UIImageView alloc] init];
    _backImgV.contentMode = UIViewContentModeScaleAspectFill;
    _backImgV.image = [UIImage imageNamed:@"partnerBg"];
    
    NSArray *titles = @[@"今日", @"昨日", @"近7天"];
    _segmentCtl = [[UISegmentedControl alloc] initWithItems:titles];
    _segmentCtl.selectedSegmentIndex = 0;
    _segmentCtl.tintColor = APP_CONFIG.partnerMainColor;
    NSDictionary *dicS = [NSDictionary dictionaryWithObjectsAndKeys:APP_CONFIG.blackTextColor,
                          NSForegroundColorAttributeName,
                          AdapFont([APP_CONFIG appFontOfSize:13]),
                          NSFontAttributeName,nil];
    [_segmentCtl setTitleTextAttributes:dicS forState:UIControlStateSelected];
    [_segmentCtl addTarget:self action:@selector(selectSegment) forControlEvents:UIControlEventValueChanged];
//    _segmentCtl.layer.borderWidth = 1;
//    _segmentCtl.layer.borderColor = [UIColor whiteColor].CGColor;
    
    _threeColumnLB = [GJThreeColumnLabel installLeft:@"营业额" center:@"店铺量" right:@"我的收益"];
    [_threeColumnLB setLeft:@"0" center:@"0" right:@"0"];
    
    _leftButton = [self createButtonTitle:@"合伙升级" image:@"Partnerfunction1"];
    _centerButton = [self createButtonTitle:@"我的推荐码" image:@"Partnerfunction2"];
    _centerButton1 = [self createButtonTitle:@"推荐关系" image:@"Partnerfunction3"];
    _rightButton = [self createButtonTitle:@"合伙收益" image:@"Partnerfunction4"];
    
    [self.contentView addSubview:_backImgV];
    [self.contentView addSubview:_segmentCtl];
    [self.contentView addSubview:_threeColumnLB];
    
    [self updateFrames];
}

- (void)updateFrames {
    [_backImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.height.mas_equalTo(AdaptatSize(140)+NavBar_H);
    }];
    [_segmentCtl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(_backImgV).with.offset(-18);
    }];
    [_threeColumnLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(_segmentCtl.mas_top).with.offset(-AdaptatSize(15));
        make.height.mas_equalTo(AdaptatSize(60));
    }];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-AdaptatSize(12));
        make.width.height.mas_equalTo(AdaptatSize(80));
        make.left.equalTo(self).with.offset(15);
    }];
    [_centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_leftButton);
        make.right.equalTo(self.mas_centerX).with.offset(-7);
    }];
    [_centerButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_leftButton);
        make.left.equalTo(self.mas_centerX).with.offset(7);
    }];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerY.equalTo(_leftButton);
        make.right.equalTo(self).with.offset(-15);
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
    [button setTitleEdgeInsets:UIEdgeInsetsMake(45, -34, 0, 0)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 20, 0)];
    [self.contentView addSubview:button];
    return button;
}

- (CGFloat)height {
    return AdaptatSize(237)+NavBar_H;
}

@end
