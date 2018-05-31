//
//  GJApplyUserFormBottomCell.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@interface GJApplyUserFormBottomCell : GJBaseTableViewCell
@property (nonatomic, strong) void (^blockBtmBtnClick)(void);
@property (nonatomic, strong) void (^blockProtocolBtnClick)(void);
@end
