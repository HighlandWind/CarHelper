//
//  GJMyRecommandCodeView.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJMyRecommandCodeView.h"
#import "GJMyPartnerIdentifierData.h"

@interface GJMyRecommandCodeView ()
@property (nonatomic, strong) UIImageView *portraitImgV;
@property (nonatomic, strong) UIImageView *qrCodeImgV;
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UILabel *bottomLB;
@end

@implementation GJMyRecommandCodeView

- (void)setData:(GJMyQRCodeData *)data {
    [_qrCodeImgV sd_setImageWithURL:[NSURL URLWithString:data.imgurl]];
    _titleLB.text = data.phone;
    
    NSString *count = JudgeContainerCountIsNull(data.sf_num)?@"":data.sf_num;
    _detailLB.text = [NSString stringWithFormat:@"拥有 %@ 重合伙人身份", count];
    
    _bottomLB.text = @"很荣幸成为您的推荐人，扫码加入全智易联";
    [_portraitImgV  sd_setImageWithURL:[NSURL URLWithString:data.avatar] placeholderImage:[UIImage imageNamed:@"head2"]];
}

- (void)commonInit {
    self.backgroundColor = [UIColor whiteColor];
    
    _titleLB = [self createLabel:15 color:[UIColor blackColor]];
    _detailLB = [self createLabel:15 color:[UIColor grayColor]];
    _bottomLB = [self createLabel:15 color:[UIColor grayColor]];
    
    _qrCodeImgV = [[UIImageView alloc] init];
    _qrCodeImgV.contentMode = UIViewContentModeScaleAspectFit;
    
    _portraitImgV = [[UIImageView alloc] init];
    _portraitImgV.contentMode = UIViewContentModeScaleAspectFit;
    _portraitImgV.layer.cornerRadius = 5;
    _portraitImgV.clipsToBounds = YES;
    
    [self addSubview:_qrCodeImgV];
    [self addSubview:_titleLB];
    [self addSubview:_detailLB];
    [self addSubview:_bottomLB];
    [self addSubview:_portraitImgV];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrames];
}

- (void)updateFrames {
    [_qrCodeImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).with.offset(10);
        make.width.height.mas_equalTo(self.width-80);
    }];
    [_portraitImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_qrCodeImgV.mas_top).with.offset(-12);
        make.left.equalTo(self).with.offset(15);
        make.width.height.mas_equalTo(50);
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_portraitImgV.mas_centerY);
        make.left.equalTo(_portraitImgV.mas_right).with.offset(8);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.top.equalTo(_portraitImgV.mas_centerY);
    }];
    [_bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_qrCodeImgV.mas_bottom).with.offset(30);
        make.centerX.equalTo(self);
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
