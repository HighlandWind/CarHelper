//
//  GJMessageCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJMessageCell.h"

@interface GJMessageCell ()
@property (nonatomic, strong) UIView *backV;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UILabel *timeLB;
@property (nonatomic, strong) UIImageView *iconImageV;
@property (nonatomic, strong) UIImageView *arrowImgV;
@end

@implementation GJMessageCell

- (void)setContent {
    _titleLB.text = @"新用户体验：买一送一！";
    _detailLB.text = @"全智易联";
    _timeLB.text = @"2018/05/20";
    [_iconImageV sd_setImageWithURL:[NSURL URLWithString:@"http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png"]];
}

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    _backV = [[UIView alloc] init];
    _backV.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_backV];
    
    _iconImageV = [[UIImageView alloc] init];
    _iconImageV.contentMode = UIViewContentModeScaleToFill;
    _arrowImgV = [[UIImageView alloc] init];
    _arrowImgV.contentMode = UIViewContentModeScaleAspectFit;
    _arrowImgV.image = [UIImage imageNamed:@"next4"];
    
    _titleLB = [self createLabel:17 color:[UIColor blackColor]];
    _detailLB = [self createLabel:15 color:[UIColor grayColor]];
    _timeLB = [self createLabel:15 color:[UIColor grayColor]];
    
    [self.contentView addSubview:_iconImageV];
    [self.contentView addSubview:_arrowImgV];
    
    [self setContent];
    [self updateFrames];
}

- (void)updateFrames {
    [_backV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.left.top.equalTo(self).with.offset(15);
        make.right.equalTo(self).with.offset(-15);
    }];
    [_iconImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(_backV);
        make.bottom.equalTo(_backV.mas_centerY);
    }];
    [_arrowImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(_backV).with.offset(-15);
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backV).with.offset(12);
        make.top.equalTo(_iconImageV.mas_bottom).with.offset(12);
        make.right.equalTo(_backV).with.offset(-15);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLB.mas_bottom).with.offset(12);
        make.left.equalTo(_titleLB);
        make.right.equalTo(_backV).with.offset(-15);
    }];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_arrowImgV);
        make.left.equalTo(_titleLB);
    }];
    [self showBottomLine];
}

- (UILabel *)createLabel:(CGFloat)font color:(UIColor *)color {
    UILabel *lb = [[UILabel alloc] init];
    lb.font = AdapFont([APP_CONFIG appBoldFontOfSize:font]);
    lb.textColor = color;
    [lb sizeToFit];
    [self.contentView addSubview:lb];
    return lb;
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_backV);
        make.bottom.equalTo(_backV).with.offset(-AdaptatSize(45));
        make.height.mas_equalTo(1);
    }];
}

@end
