//
//  GJMineTopCell.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@interface GJMineTopCell : GJBaseTableViewCell

@property (nonatomic, strong) void(^blockBindingPayClick)(void);

- (void)updatePortrait;
- (void)setMineAccountStatus:(BOOL)isBinding;

@end
