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
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UILabel *arrowLB;
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
        _leftTopLine.backgroundColor = [UIColor whiteColor];
    }else {
        _leftTopLine.backgroundColor = [UIColor colorWithRGB:186 g:206 b:243];
    }
}

- (void)commonInit {
    self.contentView.backgroundColor = APP_CONFIG.appBackgroundColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _leftTopLine = [[UIView alloc] init];
    
    _leftBtmLine = [[UIView alloc] init];
    _leftBtmLine.backgroundColor = [UIColor colorWithRGB:186 g:206 b:243];
    
    _arrowLB = [[UILabel alloc] init];
    _arrowLB.font = [APP_CONFIG appAdaptFontOfSize:14];
    _arrowLB.text = @"^";
    _arrowLB.textColor = [UIColor whiteColor];
    _arrowLB.backgroundColor = [UIColor colorWithRGB:93 g:95 b:208];
    _arrowLB.textAlignment = NSTextAlignmentCenter;
    _arrowLB.layer.cornerRadius = AdaptatSize(22) / 2;
    _arrowLB.clipsToBounds = YES;
    
    _backView = [[UIView alloc] init];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.clipsToBounds = YES;
    _backView.layer.cornerRadius = 10;
    
    _dateLB = [[UILabel alloc] init];
    _dateLB.font = [APP_CONFIG appAdaptFontOfSize:8];
    _dateLB.text = @"2018年9月";
    _dateLB.textColor = [UIColor whiteColor];
    _dateLB.backgroundColor = [UIColor colorWithRGB:93 g:95 b:208];
    _dateLB.textAlignment = NSTextAlignmentCenter;
    
    _dayLB = [[UILabel alloc] init];
    _dayLB.font = [APP_CONFIG appAdaptFontOfSize:12];
    _dayLB.text = @"21";
    _dayLB.textColor = [UIColor colorWithRGB:93 g:95 b:208];
    _dayLB.backgroundColor = [UIColor whiteColor];
    _dayLB.textAlignment = NSTextAlignmentCenter;
    _dayLB.layer.cornerRadius = 5;
    _dayLB.clipsToBounds = YES;
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:15];
    _titleLB.text = @"洗车";
    _titleLB.textColor = [UIColor colorWithRGB:93 g:95 b:208];
    [_titleLB sizeToFit];
    
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = [APP_CONFIG appAdaptFontOfSize:13];
    _detailLB.text = @"贵阳XX洗车行";
    _detailLB.textColor = [UIColor colorWithRGB:93 g:95 b:208];
    [_detailLB sizeToFit];
    
    _addressLB = [[UILabel alloc] init];
    _addressLB.font = [APP_CONFIG appAdaptFontOfSize:13];
    _addressLB.text = @"XX大厦停车场";
    _addressLB.textColor = [UIColor colorWithRGB:93 g:95 b:208];
    [_addressLB sizeToFit];
    
    _rightTimeLB = [[UILabel alloc] init];
    _rightTimeLB.font = [APP_CONFIG appAdaptFontOfSize:12];
    _rightTimeLB.text = @"17:50";
    _rightTimeLB.textColor = [UIColor colorWithRGB:93 g:95 b:208];
    [_rightTimeLB sizeToFit];
    
    _rightBtmLB = [[UILabel alloc] init];
    _rightBtmLB.font = [APP_CONFIG appAdaptFontOfSize:13];
    _rightBtmLB.text = @"花费：¥30：00";
    _rightBtmLB.textColor = [UIColor colorWithRGB:93 g:95 b:208];
    [_rightBtmLB sizeToFit];
    
    [self.contentView addSubview:_leftTopLine];
    [self.contentView addSubview:_leftBtmLine];
    [self.contentView addSubview:_arrowLB];
    [self.contentView addSubview:_backView];
    [self.contentView addSubview:_dayLB];
    [self.contentView addSubview:_dateLB];
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_addressLB];
    [self.contentView addSubview:_rightTimeLB];
    [self.contentView addSubview:_rightBtmLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_leftTopLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(80));
        make.top.equalTo(self);
        make.bottom.equalTo(_arrowLB.mas_top);
        make.width.mas_equalTo(AdaptatSize(6));
    }];
    [_arrowLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_leftTopLine);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(AdaptatSize(22));
    }];
    [_leftBtmLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_leftTopLine);
        make.bottom.equalTo(self);
        make.top.equalTo(_arrowLB.mas_bottom);
        make.width.mas_equalTo(AdaptatSize(6));
    }];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_arrowLB.mas_right).with.offset(AdaptatSize(15));
        make.right.equalTo(self).with.offset(-AdaptatSize(25));
        make.top.equalTo(self).with.offset(AdaptatSize(10));
        make.bottom.equalTo(self).with.offset(-AdaptatSize(10));
    }];
    [_dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_arrowLB.mas_left).with.offset(-AdaptatSize(10));
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(AdaptatSize(45));
        make.bottom.equalTo(_arrowLB.mas_centerY).with.offset(-AdaptatSize(5));
    }];
    [_dayLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.width.equalTo(_dateLB);
        make.height.mas_equalTo(35);
        make.top.equalTo(_dateLB.mas_bottom).with.offset(-3);
    }];
    [_addressLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backView).with.offset(12);
        make.centerY.equalTo(_backView);
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backView).with.offset(12);
        make.bottom.equalTo(_addressLB.mas_top).with.offset(-5);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.top.equalTo(_addressLB.mas_bottom).with.offset(5);
    }];
    [_rightTimeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_titleLB);
        make.right.equalTo(_backView).with.offset(-12);
    }];
    [_rightBtmLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_detailLB);
        make.right.equalTo(_rightTimeLB);
    }];
}

@end
