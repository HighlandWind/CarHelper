//
//  GJApplyUserTopView.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/14.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@interface GJApplyUserTopView : GJBaseView

@property (nonatomic, strong) void (^blockClick_1)(void);
@property (nonatomic, strong) void (^blockClick_2)(void);
@property (nonatomic, strong) void (^blockClick_3)(void);
@property (nonatomic, strong) void (^blockClick_4)(void);

+ (UIButton *)createButtonTitle:(NSString *)title font:(CGFloat)font norImg:(NSString *)norImg color:(UIColor *)color t:(NSInteger)type;

@end
