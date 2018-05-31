//
//  GJApplyUserBtmBtn.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/14.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@interface GJApplyUserBtmBtn : GJBaseView
@property (nonatomic, strong) void (^bottomScanBtnBlock)(void);
+ (GJApplyUserBtmBtn *)install;
@end
