//
//  GJApplyUserController.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/14.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJCustomPresentController.h"

@interface GJApplyUserController : GJCustomPresentController

@property (nonatomic, copy) void (^blockShowHome)(NSUInteger idx);

@end
