//
//  GJMineTBVCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJMineTBVCell.h"

@implementation GJMineTBVCell

- (void)commonInit {
    [super commonInit];
    
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.bottom.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

@end
