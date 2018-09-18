//
//  GJMineCarListCell.h
//  CarHelper
//
//  Created by hsrd on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@interface GJMineCarListCell : GJBaseTableViewCell

@property (nonatomic, copy) void (^blockClickClose)(void);
@property (nonatomic, copy) void (^blockClickApply)(void);
@property (nonatomic, copy) void (^blockClickEdit)(void);

@end
