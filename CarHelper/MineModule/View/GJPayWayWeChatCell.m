//
//  GJPayWayWeChatCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/20.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJPayWayWeChatCell.h"
#import "AlertManager.h"

@interface GJPayWayWeChatCell ()
@property (nonatomic, strong) UIImageView *backView;
@property (nonatomic, strong) UIButton *passBtn;
@end

@implementation GJPayWayWeChatCell

- (void)passButtonClick {
    [AlertManager showAlertTitle:@"温馨提示" content:@"确定解除微信支付的绑定吗？\n小额免密支付更方便哟。" viecontroller:nil cancel:@"解绑" sure:@"取消" cancelHandle:^{
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
    _backView.image = [UIImage imageNamed:@"mine_payway_wx"];
    
    _passBtn = [[UIButton alloc] init];
    _passBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:12];
    [_passBtn setTitle:@"开通" forState:UIControlStateNormal];
    [_passBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
    _passBtn.layer.cornerRadius = 5;
    _passBtn.layer.borderColor = APP_CONFIG.appMainColor.CGColor;
    _passBtn.layer.borderWidth = 1;
    [_passBtn addTarget:self action:@selector(passButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.contentView addSubview:_backView];
    [self.contentView addSubview:_passBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(10));
        make.right.equalTo(self).with.offset(-AdaptatSize(10));
        make.bottom.equalTo(self);
        make.top.equalTo(self).with.offset(AdaptatSize(5));
    }];
    [_passBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).with.offset(AdaptatSize(10));
        make.right.equalTo(self.backView).with.offset(-AdaptatSize(10));
        make.width.mas_equalTo(AdaptatSize(40));
        make.height.mas_equalTo(AdaptatSize(18));
    }];
}

- (CGFloat)height {
    return AdaptatSize(90);
}

@end
