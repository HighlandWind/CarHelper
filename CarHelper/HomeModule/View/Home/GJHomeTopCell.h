//
//  GJHomeTopCell.h
//  CarHelper
//
//  Created by hsrd on 2018/7/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@interface GJHomeTopCell : GJBaseTableViewCell

@property (nonatomic, copy) void (^blockClickFiveBtns)(NSInteger tag);

@end
