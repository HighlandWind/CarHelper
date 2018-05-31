//
//  GJPartnerUpgradeCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPartnerUpgradeCell.h"

@interface GJPartnerUpgradeCell ()
@property (nonatomic, strong) UIImageView *identifierImgV;
@property (nonatomic, strong) UILabel *leftTitleLB;
@property (nonatomic, strong) UILabel *rightTopLB;
@property (nonatomic, strong) UILabel *rightBtmLB;
@end

@implementation GJPartnerUpgradeCell

- (void)setModel:(GJMyPartnerIdentifierData *)model {
    _model = model;
    _leftTitleLB.text = model.group_name;
    _rightTopLB.text = [NSString stringWithFormat:@"%@ 推荐", model.tjr_phone];
    _rightBtmLB.text = [NSString stringWithFormat:@"%@ 加入", model.updated_at];
}

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _leftTitleLB = [self createLabel:15 color:APP_CONFIG.partnerMainColor];
    _rightTopLB = [self createLabel:14 color:[UIColor grayColor]];
    _rightBtmLB = [self createLabel:14 color:[UIColor grayColor]];
    
    _identifierImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Partner11"]];
    _identifierImgV.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.contentView addSubview:_leftTitleLB];
    [self.contentView addSubview:_rightTopLB];
    [self.contentView addSubview:_rightBtmLB];
    [self.contentView addSubview:_identifierImgV];
    
    [self updateFrames];
}

- (void)updateFrames {
    [_leftTitleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).with.offset(15);
    }];
    [_identifierImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.bottom.equalTo(self);
    }];
    [_rightTopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_leftTitleLB);
        make.right.equalTo(self).with.offset(-15);
    }];
    [_rightBtmLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_identifierImgV);
        make.right.equalTo(_rightTopLB);
    }];
}

+ (CGFloat)height {
    return AdaptatSize(85);
}

- (UILabel *)createLabel:(CGFloat)font color:(UIColor *)color {
    UILabel *lb = [[UILabel alloc] init];
    lb.font = AdapFont([APP_CONFIG appBoldFontOfSize:font]);
    lb.textColor = color;
    [lb sizeToFit];
    return lb;
}

@end
