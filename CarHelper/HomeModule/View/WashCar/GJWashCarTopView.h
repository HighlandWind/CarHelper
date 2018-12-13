//
//  GJWashCarTopView.h
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseView.h"

@interface GJWashCarTopView : GJBaseView

@property (nonatomic, strong) NSString *address;
@property (nonatomic, copy) void (^blockClickTopBtn)(void);
@property (nonatomic, copy) void (^blockClickYuYinBtn)(void);

@end
