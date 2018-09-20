//
//  GJPayWayWeChatCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/20.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJPayWayWeChatCell.h"

@interface GJPayWayWeChatCell ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *passBtn;
@end

@implementation GJPayWayWeChatCell

- (void)passButtonClick {
    
}

- (void)commonInit {
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
    
    [self.contentView addSubview:_backView];
    [self.contentView addSubview:_passBtn];
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
}

- (CGFloat)height {
    return AdaptatSize(90);
}

@end
