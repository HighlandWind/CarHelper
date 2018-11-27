//
//  GJMineHistoryCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineHistoryCell.h"

@interface GJMineHistoryCell ()
@property (nonatomic, strong) UIView *leftTopLine;
@property (nonatomic, strong) UIView *leftBtmLine;
@property (nonatomic, strong) UIImageView *backView;
@property (nonatomic, strong) UIImageView *arrowImg;
@property (nonatomic, strong) UILabel *dateLB;
@property (nonatomic, strong) UILabel *dayLB;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UILabel *addressLB;
@property (nonatomic, strong) UILabel *rightTimeLB;
@property (nonatomic, strong) UILabel *rightBtmLB;
@end

@implementation GJMineHistoryCell

- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    if (indexPath.row == 0) {
        _arrowImg.image = [UIImage imageNamed:@"mine_history_right_arrow"];
        _leftTopLine.backgroundColor = [UIColor whiteColor];
    }else {
        _arrowImg.image = [UIImage imageNamed:@"mine_history_up_arrow"];
        _leftTopLine.backgroundColor = [UIColor colorWithRGB:186 g:206 b:243];
    }
}

- (void)commonInit {
    self.contentView.backgroundColor = APP_CONFIG.appBackgroundColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _leftTopLine = [[UIView alloc] init];
    _leftBtmLine = [[UIView alloc] init];
    _leftBtmLine.backgroundColor = [UIColor colorWithRGB:186 g:206 b:243];
    
    _backView = [[UIImageView alloc] init];
    _backView.image = [UIImage imageNamed:@"mine_history_cell_bg"];
    [self.contentView addSubview:_backView];
    
    _arrowImg = [[UIImageView alloc] init];
    _arrowImg.contentMode = UIViewContentModeScaleAspectFit;
    
    _dateLB = [[UILabel alloc] init];
    _dateLB.font = [APP_CONFIG appAdaptFontOfSize:8];
    _dateLB.textColor = [UIColor whiteColor];
    _dateLB.backgroundColor = [UIColor colorWithRGB:93 g:95 b:208];
    _dateLB.textAlignment = NSTextAlignmentCenter;
    
    _dayLB = [[UILabel alloc] init];
    _dayLB.font = [APP_CONFIG appAdaptBoldFontOfSize:14];
    _dayLB.textColor = [UIColor colorWithRGB:93 g:95 b:208];
    _dayLB.backgroundColor = [UIColor whiteColor];
    _dayLB.textAlignment = NSTextAlignmentCenter;
    _dayLB.layer.cornerRadius = 5;
    _dayLB.clipsToBounds = YES;
    
    _titleLB = [self createLabelFont:16 color:[UIColor colorWithRGB:93 g:95 b:208]];
    _detailLB = [self createLabelFont:14 color:[UIColor colorWithRGB:93 g:95 b:208]];
    _addressLB = [self createLabelFont:14 color:[UIColor colorWithRGB:93 g:95 b:208]];
    _rightTimeLB = [self createLabelFont:13 color:[UIColor colorWithRGB:93 g:95 b:208]];
    _rightBtmLB = [self createLabelFont:14 color:[UIColor colorWithRGB:93 g:95 b:208]];
    
    _dateLB.text = @"2018年9月";
    _dayLB.text = @"21";
    _titleLB.text = @"洗车";
    _detailLB.text = @"贵阳XX洗车行";
    _addressLB.text = @"XX大厦停车场";
    _rightTimeLB.text = @"17:50";
    _rightBtmLB.text = @"花费：¥30：00";
    
    [self.contentView addSubview:_leftTopLine];
    [self.contentView addSubview:_leftBtmLine];
    [self.contentView addSubview:_arrowImg];
    [self.contentView addSubview:_dayLB];
    [self.contentView addSubview:_dateLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_leftTopLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(70));
        make.top.equalTo(self);
        make.bottom.equalTo(self.arrowImg.mas_top);
        make.width.mas_equalTo(AdaptatSize(6));
    }];
    [_arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.leftTopLine);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(AdaptatSize(20));
    }];
    [_leftBtmLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.leftTopLine);
        make.bottom.equalTo(self);
        make.top.equalTo(self.arrowImg.mas_bottom);
        make.width.mas_equalTo(AdaptatSize(6));
    }];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.arrowImg.mas_right).with.offset(AdaptatSize(10));
        make.right.equalTo(self).with.offset(-AdaptatSize(20));
        make.top.equalTo(self).with.offset(AdaptatSize(10));
        make.bottom.equalTo(self);
    }];
    [_dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrowImg.mas_left).with.offset(-AdaptatSize(15));
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(AdaptatSize(40));
        make.bottom.equalTo(self.arrowImg.mas_centerY).with.offset(-AdaptatSize(5));
    }];
    [_dayLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.width.equalTo(self.dateLB);
        make.height.mas_equalTo(AdaptatSize(30));
        make.top.equalTo(self.dateLB.mas_bottom).with.offset(-3);
    }];
    [_addressLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).with.offset(AdaptatSize(15));
        make.centerY.equalTo(self.backView).with.offset(AdaptatSize(4));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressLB);
        make.top.equalTo(self.backView).with.offset(AdaptatSize(20));
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLB);
        make.bottom.equalTo(self).with.offset(-AdaptatSize(15));
    }];
    [_rightTimeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLB);
        make.right.equalTo(self.backView).with.offset(-AdaptatSize(15));
    }];
    [_rightBtmLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.detailLB);
        make.right.equalTo(self.rightTimeLB);
    }];
}

- (UILabel *)createLabelFont:(CGFloat)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.font = [APP_CONFIG appAdaptBoldFontOfSize:font];
    label.textColor = color;
    [label sizeToFit];
    [self.contentView addSubview:label];
    return label;
}

@end
