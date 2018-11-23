//
//  GJMineTopCell.h
//  CarHelper
//
//  Created by Arlenly on 2018/9/14.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@interface GJMineTopCell : GJBaseTableViewCell

@property (nonatomic, copy) void (^blockClickScore)(void);
@property (nonatomic, copy) void (^blockClickCoupon)(void);
@property (nonatomic, copy) void (^blockClickInfo)(void);
@property (nonatomic, copy) void (^blockClickMessage)(void);
@property (nonatomic, copy) void (^blockClickSetup)(void);

@end
