//
//  GJPartnerBenifitCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPartnerBenifitCell.h"

@interface GJPartnerBenifitCell ()
@property (nonatomic, strong) UILabel *lTopLB;
@property (nonatomic, strong) UILabel *lCenter_1LB;
@property (nonatomic, strong) UILabel *lCenter_2LB;
@property (nonatomic, strong) UILabel *lBtm_1LB;
@property (nonatomic, strong) UILabel *lBtm_2LB;
@property (nonatomic, strong) UIView *lineV;
@property (nonatomic, strong) UILabel *rTopLB;
@property (nonatomic, strong) UILabel *rCenter_1LB;
@property (nonatomic, strong) UILabel *rCenter_2LB;
@property (nonatomic, strong) UILabel *rBtm_1LB;
@property (nonatomic, strong) UILabel *rBtm_2LB;
@end

@implementation GJPartnerBenifitCell

- (void)setModel:(GJPartnerBenifitDataList *)model {
    _model = model;
    _lTopLB.text = _model.time;
    _lCenter_1LB.text = [NSString stringWithFormat:@"直接店铺营业 ¥%@", _model.fzdp_zjdpyyr];
    _lCenter_2LB.text = [NSString stringWithFormat:@"间接店铺营业 ¥%@", _model.fzdp_jjdpyyr];
    _lBtm_1LB.text = [NSString stringWithFormat:@"推荐商家奖励 %@", _model.fzdp_num];
    _lBtm_2LB.text = [NSString stringWithFormat:@"推荐合伙奖励 %@", _model.fzhhr_num];
    
    _rTopLB.text = [NSString stringWithFormat:@"+%.2f", [_model.total_money doubleValue]];
    _rCenter_1LB.text = [NSString stringWithFormat:@"+%.2f", [_model.fzdp_zjfc doubleValue]];
    _rCenter_2LB.text = [NSString stringWithFormat:@"+%@", _model.fzdp_jjfc];
    _rBtm_1LB.text = [NSString stringWithFormat:@"+%@", _model.fzdp_money];
    _rBtm_2LB.text = [NSString stringWithFormat:@"+%@", _model.fzhhr_money];
    
    [self updateFrames];
}

- (void)setModelShop:(GJShopBenifitDataList *)modelShop {
    _modelShop = modelShop;
    _lTopLB.text = _modelShop.time;
    _lCenter_1LB.text = [NSString stringWithFormat:@"本店消费买单 ¥%@", _modelShop.bd_yyr];
    _lCenter_2LB.text = [NSString stringWithFormat:@"会员异店买单 ¥%@", _modelShop.yd_md];
    
    _rTopLB.text = [NSString stringWithFormat:@"+%.2f", [_modelShop.total_money doubleValue]];
    _rCenter_1LB.text = [NSString stringWithFormat:@"+%.2f", [_modelShop.bd_yyr_sr doubleValue]];
    _rCenter_2LB.text = [NSString stringWithFormat:@"+%@", _modelShop.yd_md_fc];
    
    [self updateFrames];
}

- (void)setIsFromShop:(BOOL)isFromShop {
    _isFromShop = isFromShop;
    if (isFromShop) {
        _rTopLB.textColor = APP_CONFIG.appMainColor;
    }else {
        _rTopLB.textColor = APP_CONFIG.partnerMainColor;
    }
}

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _lineV = [[UILabel alloc] init];
    _lineV.backgroundColor = APP_CONFIG.separatorLineColor;
    
    UIColor *grayColor = [UIColor lightGrayColor];
    CGFloat font = 12;
    
    _lTopLB = [self createLabel:16 color:[UIColor blackColor]];
    _rTopLB = [self createLabel:16 color:APP_CONFIG.partnerMainColor];
    _lCenter_1LB = [self createLabel:font color:grayColor];
    _lCenter_2LB = [self createLabel:font color:grayColor];
    _lBtm_1LB = [self createLabel:font color:grayColor];
    _lBtm_2LB = [self createLabel:font color:grayColor];
    _rCenter_1LB = [self createLabel:font color:grayColor];
    _rCenter_2LB = [self createLabel:font color:grayColor];
    _rBtm_1LB = [self createLabel:font color:grayColor];
    _rBtm_2LB = [self createLabel:font color:grayColor];
    
    [self.contentView addSubview:_lineV];
    [self.contentView addSubview:_lTopLB];
    [self.contentView addSubview:_lCenter_1LB];
    [self.contentView addSubview:_lCenter_2LB];
    [self.contentView addSubview:_lBtm_1LB];
    [self.contentView addSubview:_lBtm_2LB];
    [self.contentView addSubview:_rTopLB];
    [self.contentView addSubview:_rCenter_1LB];
    [self.contentView addSubview:_rCenter_2LB];
    [self.contentView addSubview:_rBtm_1LB];
    [self.contentView addSubview:_rBtm_2LB];
}

- (void)updateFrames {
    [_lCenter_2LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        if (_isFromShop) {
            make.bottom.equalTo(self).with.offset(-12);
        }else {
            make.bottom.equalTo(self.mas_centerY).with.offset(7);
        }
    }];
    [_lineV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lCenter_2LB);
        make.right.equalTo(self);
        if (_isFromShop) {
            make.bottom.equalTo(self);
        }else {
            make.top.equalTo(_lCenter_2LB.mas_bottom).with.offset(5);
        }
        make.height.mas_equalTo(1);
    }];
    [_lCenter_1LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineV);
        make.bottom.equalTo(_lCenter_2LB.mas_top);
    }];
    [_lTopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineV);
        make.bottom.equalTo(_lCenter_1LB.mas_top).with.offset(-5);
    }];
    [_lBtm_1LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_lineV).with.offset(6);
        make.left.equalTo(_lineV);
    }];
    [_lBtm_2LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lineV);
        make.top.equalTo(_lBtm_1LB.mas_bottom).with.offset(3);
    }];
    [_rTopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lTopLB);
        make.right.equalTo(self).with.offset(-12);
    }];
    [_rCenter_1LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lCenter_1LB);
        make.right.equalTo(_rTopLB);
    }];
    [_rCenter_2LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lCenter_2LB);
        make.right.equalTo(_rTopLB);
    }];
    [_rBtm_1LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lBtm_1LB);
        make.right.equalTo(_rTopLB);
    }];
    [_rBtm_2LB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_lBtm_2LB);
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
