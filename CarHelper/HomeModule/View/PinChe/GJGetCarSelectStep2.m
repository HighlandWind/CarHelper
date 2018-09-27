//
//  GJGetCarSelectStep2.m
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJGetCarSelectStep2.h"

@interface GJGetCarSelectStep2 ()
@property (nonatomic, strong) UIViewController *context;
@end

@implementation GJGetCarSelectStep2

+ (GJGetCarSelectStep2 *)installContext:(UIViewController *)context {
    GJGetCarSelectStep2 *v = [[GJGetCarSelectStep2 alloc] initWithFrame:CGRectMake(0, 0, AdaptatSize(200), AdaptatSize(175))];
    v.center = context.view.center;
    v.context = context;
    return v;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
    }
    return self;
}

@end
