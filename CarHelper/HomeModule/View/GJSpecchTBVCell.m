//
//  GJSpecchTBVCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/25.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJSpecchTBVCell.h"

@interface GJSpecchTBVCell ()
@property (nonatomic, strong) UIView *backView;
@end

@implementation GJSpecchTBVCell

- (void)setCellType:(BOOL)cellType {
    _cellType = cellType;
    if (_cellType) {
        _backView.backgroundColor = [UIColor colorWithRGB:242 g:243 b:247];
    }else {
        _backView.backgroundColor = APP_CONFIG.appMainColor;
    }
}

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _backView = [[UIView alloc] init];
    _backView.layer.cornerRadius = 10;
    _backView.clipsToBounds = YES;
    
    [self.contentView addSubview:_backView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.mas_equalTo(self.height-AdaptatSize(20));
        make.width.mas_equalTo(self.width / 2);
        if (self.cellType) {
            make.left.equalTo(self).with.offset(AdaptatSize(15));
        }else {
            make.right.equalTo(self).with.offset(-AdaptatSize(15));
        }
    }];
}

@end
