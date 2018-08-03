//
//  GJHomeTopCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeTopCell.h"

@interface GJHomeTopCell ()
@property (nonatomic, strong) UIView *broadcastBG;
@end

@implementation GJHomeTopCell

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    _broadcastBG = [[UIView alloc] initWithFrame:CGRectMake(10, self.height-32, SCREEN_W-20, 32)];
    _broadcastBG.backgroundColor = [UIColor whiteColor];
    _broadcastBG.layer.cornerRadius = 5;
    _broadcastBG.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _broadcastBG.layer.shadowOpacity = 0.2;
    _broadcastBG.layer.shadowRadius = 4.f;
    _broadcastBG.layer.shadowOffset = CGSizeMake(0,0);
    
    [self.contentView addSubview:_broadcastBG];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (CGFloat)height {
    return AdaptatSize(190) + 15;
}

@end
