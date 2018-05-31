//
//  GJGiftExamListCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJGiftExamListCell.h"
#import "GJGiftExamListData.h"

@interface GJGiftExamListCell ()
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UILabel *numLB;
@property (nonatomic, strong) UIImageView *iconImgV;
@end

@implementation GJGiftExamListCell

- (void)setModel:(GJGiftExamListData *)model {
    [_iconImgV sd_setImageWithURL:[NSURL URLWithString:model.thumb]];
    _titleLB.text = model.goods_name;
    _detailLB.text = [NSString stringWithFormat:@"所需积分：%@", model.total_credits];
    _numLB.text = [NSString stringWithFormat:@"x %@", model.num];
}

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = AdapFont([APP_CONFIG appFontOfSize:13]);
    _titleLB.textColor = [UIColor blackColor];
    _titleLB.numberOfLines = 2;
    [_titleLB sizeToFit];
    
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = AdapFont([APP_CONFIG appFontOfSize:12]);
    _detailLB.textColor = [UIColor grayColor];
    [_detailLB sizeToFit];
    
    _numLB = [[UILabel alloc] init];
    _numLB.font = AdapFont([APP_CONFIG appFontOfSize:12]);
    _numLB.textColor = [UIColor grayColor];
    [_numLB sizeToFit];
    
    _iconImgV= [[UIImageView alloc] init];
    _iconImgV.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_numLB];
    [self.contentView addSubview:_iconImgV];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrames];
}

- (void)updateFrames {
    [_iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.centerY.equalTo(self);
        make.height.width.mas_equalTo(self.height-30);
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconImgV.mas_right).with.offset(15);
        make.top.equalTo(_iconImgV);
        make.right.equalTo(self).with.offset(-15);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.bottom.equalTo(_iconImgV);
    }];
    [_numLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_iconImgV);
        make.right.equalTo(self).with.offset(-15);
    }];
}

@end
