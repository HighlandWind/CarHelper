//
//  GJHomeTopCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeTopCell.h"

@interface GJHomeTopCell ()
@property (nonatomic, strong) UIView *backView;
@end

@implementation GJHomeTopCell

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    _backView = [[UIView alloc] initWithFrame:CGRectMake(10, self.height-32, SCREEN_W-20, 32)];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.cornerRadius = 5;
    _backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _backView.layer.shadowOpacity = 0.2;
    _backView.layer.shadowRadius = 4.f;
    _backView.layer.shadowOffset = CGSizeMake(0,0);
    [self.contentView addSubview:_backView];
}

- (CGFloat)height {
    return AdaptatSize(192) + 15;
}

@end
