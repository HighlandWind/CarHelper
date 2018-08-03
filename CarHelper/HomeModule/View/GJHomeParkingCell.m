//
//  GJHomeParkingCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeParkingCell.h"

@interface GJHomeParkingCell ()
@property (nonatomic, strong) UIView *backView;
@end

@implementation GJHomeParkingCell

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    _backView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, SCREEN_W-20, self.height-30)];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.cornerRadius = 5;
    _backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _backView.layer.shadowOpacity = 0.2;
    _backView.layer.shadowRadius = 4.f;
    _backView.layer.shadowOffset = CGSizeMake(0,0);
    [self.contentView addSubview:_backView];
    
}

- (CGFloat)height {
    return AdaptatSize(150);
}

@end
