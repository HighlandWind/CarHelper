//
//  GJNormalNaviView.h
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseView.h"

@interface GJNormalNaviView : GJBaseView

+ (GJNormalNaviView *)installTitle:(NSString *)title;
@property (nonatomic, copy) void (^blockBackClick)(void);

@end
