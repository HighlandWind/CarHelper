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
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *passBtn;
@property (nonatomic, strong) UILabel *titleLB;
@end

@implementation GJPayWayWeChatCell

- (void)passButtonClick {
    [AlertManager showAlertTitle:@"温馨提示" content:@"确定解除微信支付的绑定吗？\n小额免密支付更方便哟。" viecontroller:nil cancel:@"解绑" sure:@"取消" cancelHandle:^{
        BLOCK_SAFE(_blockSureClose)();
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
    self.contentView.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _backView = [[UIView alloc] init];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.cornerRadius = 10;
    _backView.clipsToBounds = YES;
    
    _passBtn = [[UIButton alloc] init];
    _passBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:12];
    [_passBtn setTitle:@"开通" forState:UIControlStateNormal];
    [_passBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
    _passBtn.layer.cornerRadius = 5;
    _passBtn.layer.borderColor = APP_CONFIG.appMainColor.CGColor;
    _passBtn.layer.borderWidth = 1;
    [_passBtn addTarget:self action:@selector(passButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:24];
    _titleLB.textColor = APP_CONFIG.blackTextColor;
    _titleLB.text = @"微信";
    [_titleLB sizeToFit];
    
    [self.contentView addSubview:_backView];
    [self.contentView addSubview:_passBtn];
    [self.contentView addSubview:_titleLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(15));
        make.right.equalTo(self).with.offset(-AdaptatSize(15));
        make.bottom.equalTo(self).with.offset(-AdaptatSize(10));
        make.top.equalTo(self).with.offset(AdaptatSize(10));
    }];
    [_passBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_backView).with.offset(5);
        make.right.equalTo(_backView).with.offset(-5);
        make.width.mas_equalTo(AdaptatSize(40));
        make.height.mas_equalTo(AdaptatSize(18));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (CGFloat)height {
    return AdaptatSize(90);
}

@end
