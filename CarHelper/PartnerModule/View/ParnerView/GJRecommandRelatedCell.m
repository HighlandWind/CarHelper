//
//  GJRecommandRelatedCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRecommandRelatedCell.h"

@interface GJRecommandRelatedCell ()
@property (nonatomic, strong) UILabel *lTopLB;
@property (nonatomic, strong) UILabel *lBtm_1LB;
@property (nonatomic, strong) UILabel *rTopLB;
@property (nonatomic, strong) UILabel *rBtm_1LB;
@end

@implementation GJRecommandRelatedCell

- (void)setData:(NSString *)data {
    _data = data;
    
    _lTopLB.text = data;
}

- (void)setContent {
    _lTopLB.text = @"111 贵阳市间接发展2家";
    _rTopLB.text = @"奖励金 80";
    _lBtm_1LB.text = @"2018/02/12 12:00:00";
    _rBtm_1LB.text = @"¥ 29000.00";
}

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _lTopLB = [self createLabel:16 color:[UIColor darkGrayColor]];
    _lBtm_1LB = [self createLabel:13 color:[UIColor lightGrayColor]];
    _rTopLB = [self createLabel:13 color:[UIColor lightGrayColor]];
    _rBtm_1LB = [self createLabel:16 color:APP_CONFIG.partnerMainColor];
    
    [self.contentView addSubview:_lTopLB];
    [self.contentView addSubview:_rTopLB];
    [self.contentView addSubview:_lBtm_1LB];
    [self.contentView addSubview:_rBtm_1LB];
    
    [self setContent];
    [self updateFrames];
}

- (void)updateFrames {
    [_lTopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self).with.offset(15);
    }];
    [_lBtm_1LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lTopLB);
        make.top.equalTo(self.mas_centerY).with.offset(7);
    }];
    [_rTopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-15);
        make.centerY.equalTo(_lTopLB);
    }];
    [_rBtm_1LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lBtm_1LB);
        make.right.equalTo(_rTopLB);
    }];
}

- (UILabel *)createLabel:(CGFloat)font color:(UIColor *)color {
    UILabel *lb = [[UILabel alloc] init];
    lb.font = AdapFont([APP_CONFIG appBoldFontOfSize:font]);
    lb.textColor = color;
    [lb sizeToFit];
    return lb;
}

@end
