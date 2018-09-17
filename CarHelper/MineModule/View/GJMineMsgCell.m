//
//  GJMineMsgCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineMsgCell.h"

@interface GJMineMsgCell ()
@property (nonatomic, strong) UIImageView *portraitImgV;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *timeLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UIButton *scanDetailBtn;
@end

@implementation GJMineMsgCell

- (void)scanDetailBtnClick {
    
}

- (void)commonInit {
    [self showBottomLine];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _portraitImgV = [[UIImageView alloc] init];
    _portraitImgV.contentMode = UIViewContentModeScaleAspectFit;
    _portraitImgV.layer.cornerRadius = AdaptatSize(46) / 2;
    _portraitImgV.clipsToBounds = YES;
    _portraitImgV.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:15];
    _titleLB.text = @"通知信息";
    _titleLB.textColor = APP_CONFIG.blackTextColor;
    [_titleLB sizeToFit];
    
    _timeLB = [[UILabel alloc] init];
    _timeLB.font = [APP_CONFIG appAdaptFontOfSize:13];
    _timeLB.text = @"2018-09-17";
    _timeLB.textColor = APP_CONFIG.blackTextColor;
    [_timeLB sizeToFit];
    
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = [APP_CONFIG appAdaptFontOfSize:12];
    _detailLB.text = @"哈哈哈哈或或或或或或或或或后悔就能看胸口不喝酒带伞不发给我";
    _detailLB.textColor = APP_CONFIG.blackTextColor;
    _detailLB.numberOfLines = 2;
    [_detailLB sizeToFit];
    
    _scanDetailBtn = [[UIButton alloc] init];
    [_scanDetailBtn addTarget:self action:@selector(scanDetailBtnClick) forControlEvents:UIControlEventTouchUpInside];
    _scanDetailBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:13];
    [_scanDetailBtn setTitle:@"查看详情  >" forState:UIControlStateNormal];
    [_scanDetailBtn setTitleColor:[UIColor colorWithRGB:38 g:205 b:246] forState:UIControlStateNormal];
    
    [self.contentView addSubview:_portraitImgV];
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_timeLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_scanDetailBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_portraitImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(AdaptatSize(10));
        make.width.height.mas_equalTo(AdaptatSize(46));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_portraitImgV);
        make.left.equalTo(_portraitImgV.mas_right).with.offset(10);
    }];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-10);
        make.centerY.equalTo(_titleLB);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLB.mas_bottom).with.offset(5);
        make.left.equalTo(_titleLB);
        make.right.equalTo(self).with.offset(-AdaptatSize(30));
    }];
    [_scanDetailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-AdaptatSize(10));
        make.bottom.equalTo(self).with.offset(-AdaptatSize(10));
        make.width.mas_equalTo(AdaptatSize(70));
        make.height.mas_equalTo(AdaptatSize(30));
    }];
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self);
        make.height.mas_equalTo(AdaptatSize(8));
    }];
    UIView *lineC = [[UIView alloc] init];
    lineC.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:lineC];
    [lineC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self);
        make.centerY.equalTo(self).with.offset(AdaptatSize(15));
        make.height.mas_equalTo(AdaptatSize(1.2));
    }];
}

@end
