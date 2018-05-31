//
//  GJCashDeskController.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/4/21.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJCustomPresentController.h"

@class GJApplyPartnerData;

@interface GJCashDeskController : GJCustomPresentController

@property (nonatomic, strong) GJApplyPartnerData *applyData;
@property (nonatomic, assign) NSInteger type;   // 0合伙人，1店铺  入驻支付

@property (nonatomic, copy) void (^blockApplySuccessToLogin)(void);

@end
