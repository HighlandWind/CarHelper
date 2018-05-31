//
//  GJPartnerTopCell.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@interface GJPartnerTopCell : GJBaseTableViewCell

- (void)setLeft:(NSString *)left center:(NSString *)center right:(NSString *)right;

@property (nonatomic, strong) void (^blockClickFourBtn)(NSInteger idx);

@property (nonatomic, strong) void (^blockClickSegment)(NSInteger idx);

@end
