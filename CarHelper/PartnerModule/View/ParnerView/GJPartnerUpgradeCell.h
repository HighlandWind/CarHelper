//
//  GJPartnerUpgradeCell.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"
#import "GJMyPartnerIdentifierData.h"

@interface GJPartnerUpgradeCell : GJBaseTableViewCell

@property (nonatomic, strong) GJMyPartnerIdentifierData *model;
+ (CGFloat)height;

@end
