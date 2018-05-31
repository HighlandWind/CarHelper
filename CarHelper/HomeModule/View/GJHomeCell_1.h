//
//  GJHomeCell_1.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@class GJHomeShopData;

@interface GJHomeCell_1 : GJBaseTableViewCell

@property (nonatomic, strong) GJHomeShopData *shopData;

@property (nonatomic, strong) void (^blockClickThreeBtn)(NSInteger idx);
@property (nonatomic, strong) void (^blockClickSegment)(NSInteger idx);
@end
