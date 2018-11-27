//
//  GJPayWayZFBCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/20.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJPayWayZFBCell.h"
#import "AlertManager.h"

@interface GJPayWayZFBCell ()
@property (nonatomic, strong) UIImageView *backView;
@property (nonatomic, strong) UIButton *closeBtn;
@end

@implementation GJPayWayZFBCell

- (void)closeBtnAction {
    [AlertManager showAlertTitle:@"温馨提示" content:@"确定解除支付宝的绑定吗？\n小额免密支付更方便哟。" viecontroller:nil cancel:@"解绑" sure:@"取消" cancelHandle:^{
        BLOCK_SAFE(self.blockSureClose)();
    } sureHandle:^{
    }];
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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _backView = [[UIImageView alloc] init];
    _backView.image = [UIImage imageNamed:@"mine_payway_zfb"];
    
    _closeBtn = [[UIButton alloc] init];
    [_closeBtn setImage:[UIImage imageNamed:@"mine_payway_gray_close"] forState:UIControlStateNormal];
    [_closeBtn addTarget:self action:@selector(closeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_backView];
    [self.contentView addSubview:_closeBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(10));
        make.right.equalTo(self).with.offset(-AdaptatSize(10));
        make.bottom.equalTo(self);
        make.top.equalTo(self).with.offset(AdaptatSize(5));
    }];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.backView);
        make.width.height.mas_equalTo(AdaptatSize(40));
    }];
}

- (CGFloat)height {
    return AdaptatSize(160);
}

@end
