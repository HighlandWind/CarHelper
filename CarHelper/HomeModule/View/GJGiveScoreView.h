//
//  GJGiveScoreView.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@interface GJGiveScoreView : GJBaseView
@property (nonatomic, strong) void (^blockGiveBtnClick)(NSString *phone, NSString *money);
@end
