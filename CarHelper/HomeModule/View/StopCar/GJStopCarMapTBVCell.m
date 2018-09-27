//
//  GJStopCarMapTBVCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJStopCarMapTBVCell.h"

@interface GJStopCarMapTBVCell ()

@end

@implementation GJStopCarMapTBVCell

- (void)commonInit {
    [self showBottomLine];
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

@end
