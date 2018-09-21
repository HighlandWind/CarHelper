//
//  GJPayWayUnionCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/20.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJPayWayUnionCell.h"
#import "AlertManager.h"

@interface GJPayWayUnionCell ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UILabel *titleLB;
@end

@implementation GJPayWayUnionCell

- (void)closeBtnAction {
    [AlertManager showAlertTitle:@"温馨提示" content:@"确定解除银联的绑定吗？\n小额免密支付更方便哟。" viecontroller:nil cancel:@"解绑" sure:@"取消" cancelHandle:^{
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
    
    _closeBtn = [[UIButton alloc] init];
    [_closeBtn setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
    [_closeBtn addTarget:self action:@selector(closeBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:24];
    _titleLB.textColor = APP_CONFIG.blackTextColor;
    _titleLB.text = @"银联";
    [_titleLB sizeToFit];
    
    [self.contentView addSubview:_backView];
    [self.contentView addSubview:_closeBtn];
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
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(_backView);
        make.width.height.mas_equalTo(AdaptatSize(40));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (CGFloat)height {
    return AdaptatSize(160);
}

@end
