
//
//  GJMineCarListCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineCarListCell.h"

@interface GJMineCarListCell ()
@property (nonatomic, strong) UIView *backView;
@end

@implementation GJMineCarListCell

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _backView = [[UIView alloc] init];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.cornerRadius = 10;
    _backView.layer.shadowColor = [UIColor grayColor].CGColor;
    _backView.layer.shadowOpacity = 0.2;
    _backView.layer.shadowRadius = 4.f;
    _backView.layer.shadowOffset = CGSizeMake(0,0);
    [self.contentView addSubview:_backView];
    
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

@end
