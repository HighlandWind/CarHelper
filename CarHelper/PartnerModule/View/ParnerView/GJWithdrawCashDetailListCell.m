//
//  GJWithdrawCashDetailListCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJWithdrawCashDetailListCell.h"
#import "GJShopScoreListData.h"
#import "GJRechargeDetailListData.h"

@interface GJWithdrawCashDetailListCell ()
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UILabel *rightLB;
@end

@implementation GJWithdrawCashDetailListCell

- (void)setModel:(GJWithdrawCashDetailList *)model {
    _model = model;
    _titleLB.text = model.time;
    _detailLB.text = model.status;
    _rightLB.text = [NSString stringWithFormat:@"-%.2f", [model.money doubleValue]];
}

- (void)setListData:(GJShopScoreListDataList *)listData {
    _detailLB.text = listData.created_at;
    _rightLB.text = listData.credits;
    if (listData.log_type == 6) {
        _titleLB.text = [self phoneFormat:listData.beizhu];
    }else {
        _titleLB.text = listData.beizhu;
    }
}

- (void)setRechageData:(GJRechargeDetailListData *)rechageData {
    _titleLB.text = rechageData.beizhu;
    _detailLB.text = rechageData.created_at;
    _rightLB.text = [NSString stringWithFormat:@"+%.2f", [rechageData.money doubleValue]];
}

- (NSString *)phoneFormat:(NSString *)phone {
    @try {
        if (phone.length > 0) {
            NSMutableString *str = [[NSMutableString alloc] initWithString:phone];
            [str replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
            return str;
        }else {
            return @"00000000000";
        }
    } @catch (NSException *exception) {
        return @"00000000000";
    }
}

- (void)setIsFromShop:(BOOL)isFromShop {
    if (isFromShop) {
        _rightLB.textColor = APP_CONFIG.appMainColor;
    }else {
        _rightLB.textColor = APP_CONFIG.partnerMainColor;
    }
}

- (void)commonInit {
    self.selectionStyle  =UITableViewCellSelectionStyleNone;
    
    _titleLB = [self createLabelColor:[UIColor blackColor]];
    _detailLB = [self createLabelColor:[UIColor grayColor]];
    
    _rightLB = [self createLabelColor:APP_CONFIG.partnerMainColor];
    
    _titleLB.font = AdapFont([APP_CONFIG appBahnschriftSemiFontOfSize:20]);
    _detailLB.font = AdapFont([APP_CONFIG appFontOfSize:13]);
    _rightLB.font = AdapFont([APP_CONFIG appBahnschriftSemiFontOfSize:20]);
    
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_rightLB];
    
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_centerY);
        make.left.equalTo(self).with.offset(15);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleLB);
        make.top.equalTo(self.mas_centerY).with.offset(5);
    }];
    [_rightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).with.offset(-15);
    }];
}

- (UILabel *)createLabelColor:(UIColor *)color {
    UILabel *lb = [[UILabel alloc] init];
    lb.textColor = color;
    [lb sizeToFit];
    return lb;
}

@end
