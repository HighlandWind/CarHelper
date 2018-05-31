//
//  GJApplyUserFormVC.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseViewController.h"

@interface GJApplyUserFormVC : GJBaseViewController

@property (nonatomic, assign) BOOL isFromUpgrade;

@property (nonatomic, strong) NSString *currentPartnerType;
@property (nonatomic, copy) void (^blockApplySuccessShowHome)(void);
- (void)presentSelfID:(NSString *)identifier context:(UIViewController *)context;
@end
