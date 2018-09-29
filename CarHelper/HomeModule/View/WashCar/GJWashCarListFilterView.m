//
//  GJWashCarListFilterView.m
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarListFilterView.h"

@interface GJWashCarListFilterView ()

@end

@implementation GJWashCarListFilterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIView *btmLine = [[UIView alloc] init];
        btmLine.backgroundColor = APP_CONFIG.appBackgroundColor;
        [self addSubview:btmLine];
        [btmLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.left.equalTo(self);
            make.height.mas_equalTo(1);
        }];
        
        
        
    }
    return self;
}

@end
