//
//  GJGetCarSelectStep2.h
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseView.h"

@interface GJGetCarSelectStep2 : GJBaseView

+ (GJGetCarSelectStep2 *)installContext:(UIViewController *)context;
@property (nonatomic, copy) void (^blockClickStartPoint)(void);
@property (nonatomic, copy) void (^blockClickEndPoint)(void);

@end
