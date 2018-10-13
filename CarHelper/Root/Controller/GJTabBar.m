//
//  GJTabBar.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJTabBar.h"

@interface GJTabBar ()

@end

@implementation GJTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

// Rewrite hitTest:withEvent: method.
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    return [super hitTest:point withEvent:event];
}

@end
