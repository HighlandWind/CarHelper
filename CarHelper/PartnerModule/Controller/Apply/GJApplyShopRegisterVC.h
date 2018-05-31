//
//  GJApplyShopRegisterVC.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJCustomPresentController.h"

@class GJApplyShopRegisterData;

@interface GJApplyShopRegisterVC : GJCustomPresentController

@property (nonatomic, strong) GJApplyShopRegisterData *data;

@property (nonatomic, copy) void (^blockApplySuccessShowHome)(void);

@end
