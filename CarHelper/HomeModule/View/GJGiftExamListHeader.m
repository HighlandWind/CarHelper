//
//  GJGiftExamListHeader.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJGiftExamListHeader.h"

@interface GJGiftExamListHeader ()
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UILabel *scoreLB;
@property (nonatomic, strong) UILabel *score;
@end

@implementation GJGiftExamListHeader

- (void)setUseScore:(NSInteger)useScore phone:(NSString *)phone {
    _score.text = [NSString stringWithFormat:@"%ld", (long)useScore];
    _detailLB.text = [NSString stringWithFormat:@"%@ 有效手机号", phone];
}

- (void)commonInit {
    self.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = AdapFont([APP_CONFIG appBoldFontOfSize:19]);
    _titleLB.textColor = [UIColor blackColor];
    [_titleLB sizeToFit];
    _titleLB.text = @"核验成功";
    
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = AdapFont([APP_CONFIG appFontOfSize:12]);
    _detailLB.textColor = [UIColor colorWithRGB:81 g:186 b:249];
    [_detailLB sizeToFit];
    
    _scoreLB = [[UILabel alloc] init];
    _scoreLB.font = AdapFont([APP_CONFIG appFontOfSize:12]);
    _scoreLB.textColor = [UIColor blackColor];
    [_scoreLB sizeToFit];
    _scoreLB.text = @"本店可兑换好礼";
    
    _score = [[UILabel alloc] init];
    _score.font = AdapFont([APP_CONFIG appBahnschriftSemiFontOfSize:21]);
    _score.textColor = APP_CONFIG.appMainColor;
    [_score sizeToFit];
    
    [self addSubview:_titleLB];
    [self addSubview:_detailLB];
    [self addSubview:_scoreLB];
    [self addSubview:_score];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateFrames];
}

- (void)updateFrames {
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(25);
        make.top.equalTo(self).with.offset(12);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.top.equalTo(_titleLB.mas_bottom).with.offset(3);
    }];
    [_score mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_titleLB);
        make.right.equalTo(self).with.offset(-15);
    }];
    [_scoreLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_score);
        make.right.equalTo(_score.mas_left).with.offset(-5);
    }];
}

@end
