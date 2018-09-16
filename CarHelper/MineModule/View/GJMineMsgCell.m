//
//  GJMineMsgCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineMsgCell.h"

@interface GJMineMsgCell ()

@end

@implementation GJMineMsgCell

- (void)commonInit {
    [self showBottomLine];
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self);
        make.height.mas_equalTo(AdaptatSize(8));
    }];
}

@end
