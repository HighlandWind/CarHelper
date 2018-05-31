//
//  GJBindingListCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBindingListCell.h"

@implementation GJBindingListCell

- (void)commonInit {
    [super commonInit];
    self.textLabel.textColor = [APP_CONFIG blackTextColor];
}

- (void)setCellModel:(GJNormalCellModel *)cellModel {
    [super setCellModel:cellModel];
    if ([cellModel.detail isEqualToString:@"未绑定"]) {
        self.detailTextLabel.textColor = [APP_CONFIG appMainColor];
    }
}

@end

@implementation GJBindingListFooter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithRGB:246 g:246 b:251];
        UILabel *lb = [[UILabel alloc] init];
        lb.font = AdapFont([APP_CONFIG appFontOfSize:14]);
        lb.textColor = [UIColor grayColor];
        lb.text = @"· 提现需要同时绑定支付宝和微信账号";
        [lb sizeToFit];
        [self addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(12);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

@end

