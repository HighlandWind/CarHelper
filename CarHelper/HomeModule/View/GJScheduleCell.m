//
//  GJScheduleCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/21.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJScheduleCell.h"

@interface GJScheduleCell ()

@end

@implementation GJScheduleCell

- (void)commonInit {
    self.backgroundColor = APP_CONFIG.appBackgroundColor;
}

- (CGFloat)height {
    return AdaptatSize(266);
}


@end
