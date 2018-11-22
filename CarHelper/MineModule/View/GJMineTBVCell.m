//
//  GJMineTBVCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/11/21.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineTBVCell.h"

@interface GJMineTBVCell ()
@property (nonatomic, strong) UIImageView *imageV;
@end

@implementation GJMineTBVCell

- (void)commonInit {
    [super commonInit];
    self.textLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:16];
    
    _imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_list_right_arrow"]];
    _imageV.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.contentView addSubview:_imageV];
}

- (void)setCellModel:(GJNormalCellModel *)cellModel {
    [super setCellModel:cellModel];
    self.accessoryType = 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-AdaptatSize(15));
    }];
}

@end
