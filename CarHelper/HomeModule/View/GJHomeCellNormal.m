//
//  GJHomeCellNormal.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJHomeCellNormal.h"
#import "GJHomeShopData.h"
#import "GJPartnerHomeData.h"

@interface GJHomeCellNormal ()
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *centerTopLB;
@property (nonatomic, strong) UILabel *centerBtmLB;
@property (nonatomic, strong) UILabel *bottomLB;
@property (nonatomic, strong) UILabel *centRightLB;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIImageView *rightArrowImg;
@end

@implementation GJHomeCellNormal

- (void)rightBtnClick {
    
}

- (void)setPartnerModel:(GJPartnerHomeDataList *)partnerModel {
    _titleLB.text = partnerModel.group_name;
    _centerTopLB.text = partnerModel.date_sy_name;
    _centerBtmLB.text = [NSString stringWithFormat:@"%.2f", [partnerModel.date_sy doubleValue]];
    _bottomLB.text = [NSString stringWithFormat:@"店铺量 %@ | 营业额（元）%.2f", partnerModel.fzdp_num, [partnerModel.fzdp_yyr doubleValue]];
    [_rightBtn setTitle:[NSString stringWithFormat:@"%@ 数据详情", partnerModel.date_sjxq] forState:UIControlStateNormal];
}

- (void)setShopData:(GJHomeShopData *)shopData index:(NSInteger)idx {
    switch (idx) {
        case 1:
            _titleLB.text = @"本店营收分析";
            _centerTopLB.text = @"营业额（元）";
            _centerBtmLB.text = [NSString stringWithFormat:@"%.2f", [shopData.dp_yyr doubleValue]];
            _bottomLB.text = [NSString stringWithFormat:@"买单笔数 %@ | 每笔单价（元）%.2f", shopData.dp_md_num, [shopData.dp_md_avg doubleValue]];
            [_rightBtn setTitle:[NSString stringWithFormat:@"%@ 数据详情", shopData.date_sjxq] forState:UIControlStateNormal];
            break;
            
        case 2:
            _titleLB.text = @"本店会员数据";
            _centerTopLB.text = @"回头率/忠诚度";
            _centerBtmLB.text = [NSString stringWithFormat:@"%@", shopData.dp_htl];
            _bottomLB.text = [NSString stringWithFormat:@"本店单数 %@ | 平台单数 %@", shopData.dp_md_num, shopData.bd_user_md_num];
            [_rightBtn setTitle:@"会员管理" forState:UIControlStateNormal];
            break;
            
        case 3:
            _titleLB.text = @"异店分润数据";
            _centerTopLB.text = @"分润金额（元）";
            _centerBtmLB.text = [NSString stringWithFormat:@"%.2f", [shopData.fr_money doubleValue]];
            _bottomLB.text = [NSString stringWithFormat:@"异店单数 %@ | 总额（元）%.2f", shopData.yd_md_num, [shopData.yd_md_money doubleValue]];
            [_rightBtn setTitle:[NSString stringWithFormat:@"%@ 数据详情", shopData.date_sjxq] forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
    _centRightLB.text = @" 较昨日+18% ";
}

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _titleLB = [self createLabelFont:16 color:[UIColor darkGrayColor]];
    _titleLB.font = AdapFont([APP_CONFIG appBoldFontOfSize:16]);
    _centerTopLB = [self createLabelFont:14 color:[UIColor grayColor]];
    _centerBtmLB = [self createLabelFont:14 color:[UIColor blackColor]];
    _centerBtmLB.font = AdapFont([APP_CONFIG appBahnschriftSemiBoldFontOfSize:18]);
    _bottomLB = [self createLabelFont:12 color:[UIColor grayColor]];
    _centRightLB = [self createLabelFont:13 color:APP_CONFIG.appMainColor];
    _centRightLB.backgroundColor = [UIColor colorWithRGB:255 g:240 b:233];
    
    _rightBtn = [[UIButton alloc] init];
    _rightBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:12]);
    _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_rightBtn sizeToFit];
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _rightArrowImg = [[UIImageView alloc] init];
    _rightArrowImg.contentMode = UIViewContentModeScaleAspectFit;
    _rightArrowImg.image = [UIImage imageNamed:@"nextstepGray"];
    
    [self.contentView addSubview:_rightBtn];
    [self.contentView addSubview:_rightArrowImg];
    
    [self updateFrames];
}

- (void)updateFrames {
    [_rightArrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(15);
        make.right.equalTo(self).with.offset(-8);
        make.width.height.mas_equalTo(AdaptatSize(15));
    }];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_rightArrowImg);
        make.right.equalTo(_rightArrowImg.mas_left);
        make.width.mas_equalTo(AdaptatSize(100));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_rightArrowImg);
        make.left.equalTo(self).with.offset(12);
        make.right.equalTo(_rightBtn.mas_left).with.offset(-10);
    }];
    [_centerTopLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.bottom.equalTo(self.mas_centerY);
    }];
    [_centerBtmLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.top.equalTo(_centerTopLB.mas_bottom).with.offset(10);
    }];
    [_bottomLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.top.equalTo(_centerBtmLB.mas_bottom).with.offset(15);
    }];
    [_centRightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_centerTopLB);
        make.right.equalTo(self).with.offset(-15);
    }];
}

- (UILabel *)createLabelFont:(CGFloat)font color:(UIColor *)color  {
    UILabel *lb = [[UILabel alloc] init];
    lb.textColor = color;
    lb.font = AdapFont([APP_CONFIG appFontOfSize:font]);
    [lb sizeToFit];
    [self.contentView addSubview:lb];
    return lb;
}

@end
