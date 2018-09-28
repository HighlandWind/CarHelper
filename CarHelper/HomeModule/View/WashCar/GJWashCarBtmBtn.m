//
//  GJWashCarBtmBtn.m
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarBtmBtn.h"

@implementation GJWashCarBtmBtn

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = APP_CONFIG.appMainColor;
        self.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:16];
        [self setTitle:@"出发" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
    }
    return self;
}

@end
