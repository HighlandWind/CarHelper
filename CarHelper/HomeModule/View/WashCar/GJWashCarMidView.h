//
//  GJWashCarMidView.h
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseView.h"

@interface GJWashCarMidView : GJBaseView

@property (nonatomic, copy) void (^blockClickBtmBtn)(void);
@property (nonatomic, strong) NSArray *contents;

@end


@interface GJWashCarMidBGView : GJBaseView

@end
