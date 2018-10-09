//
//  GJNearbyCell.h
//  CarHelper
//
//  Created by hsrd on 2018/7/21.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@interface GJNearbyCell : GJBaseTableViewCell

@property (nonatomic, strong) NSArray *leftTBVDatas;
@property (nonatomic, copy) void (^blockClickScanMap)(void);

@end

