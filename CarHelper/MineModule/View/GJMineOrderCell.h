//
//  GJMineOrderCell.h
//  CarHelper
//
//  Created by Arlenly on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@interface GJMineOrderCell : GJBaseTableViewCell

@property (nonatomic, copy) void (^blockEvaluateClick)(void);

@end
