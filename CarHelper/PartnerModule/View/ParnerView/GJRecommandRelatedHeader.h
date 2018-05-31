//
//  GJRecommandRelatedHeader.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@interface GJRecommandRelatedHeader : GJBaseView
@property (nonatomic, copy) void (^blockClickItems)(NSInteger idx);
- (void)setNumber:(NSString *)number atIndex:(NSInteger)idx;
@end
