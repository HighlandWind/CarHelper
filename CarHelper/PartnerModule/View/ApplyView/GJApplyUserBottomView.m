//
//  GJApplyUserBottomView.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/14.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyUserBottomView.h"
#import "GJApplyUserTopView.h"

@interface GJApplyUserBottomView ()
@property (nonatomic, strong) UIButton *becomeBtn;
@property (nonatomic, strong) UIButton *vipBenifitBtn;
@property (nonatomic, strong) UILabel *remindLB;
@property (nonatomic, strong) UIView *centerLine;
@end

@implementation GJApplyUserBottomView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)becomeBtnCLick {
    BLOCK_SAFE(_blockClickBecomeStore)();
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    [self showTopLine];
    
    _becomeBtn = [[UIButton alloc] init];
    _becomeBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:15]);
    _becomeBtn.layer.borderWidth = 0.8;
    _becomeBtn.layer.borderColor = APP_CONFIG.appMainColor.CGColor;
    _becomeBtn.clipsToBounds = YES;
    _becomeBtn.layer.cornerRadius = 3;
    [_becomeBtn setTitle:@"入驻店铺" forState:UIControlStateNormal];
    [_becomeBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
    [_becomeBtn addTarget:self action:@selector(becomeBtnCLick) forControlEvents:UIControlEventTouchUpInside];
    
    _vipBenifitBtn  =[GJApplyUserTopView createButtonTitle:@"会员异店消费享收益" font:13 norImg:@"item5" color:[UIColor lightGrayColor] t:2];
    
    _centerLine = [[UIView alloc] init];
    _centerLine.backgroundColor = APP_CONFIG.separatorLineColor;
    
    _remindLB = [[UILabel alloc] init];
    _remindLB.font = AdapFont([APP_CONFIG appFontOfSize:13]);
    _remindLB.textColor = [UIColor colorWithRGB:210 g:170 b:125];
    NSString *text = @"全智易联仅支持 实体门店 商铺入驻";
    NSMutableAttributedString *muStr = [[NSMutableAttributedString alloc] initWithString:text];
    [muStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:[text rangeOfString:@"全智易联仅支持"]];
    [muStr addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:[text rangeOfString:@"商铺入驻"]];
    _remindLB.attributedText = muStr;
    
    [self addSubview:_becomeBtn];
    [self addSubview:_vipBenifitBtn];
    [self addSubview:_centerLine];
    [self addSubview:_remindLB];
    
    [self createTopLB];
    
    [self updateFrames];
}

- (void)updateFrames {
    [_vipBenifitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-AdaptatSize(15));
        make.centerX.equalTo(self);
    }];
    [_centerLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_vipBenifitBtn.mas_top).with.offset(-AdaptatSize(15));
        make.centerX.equalTo(self);
        make.size.mas_equalTo((CGSize){SCREEN_W-30, 1});
    }];
    [_remindLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_becomeBtn.mas_bottom).with.offset(10);
    }];
}

- (void)createTopLB {
    NSArray *titleArr = @[@"注册账号", @"完善资质", @"完成支付", @"开通业务"];
    CGFloat w = AdaptatSize(26);
    CGFloat lineW = AdaptatSize(65);
    __block UILabel *tmpLB;
    __block UIView *outCicleV = [UIView new];
    outCicleV.backgroundColor = [UIColor colorWithRGB:255 g:158 b:142];
    outCicleV.layer.cornerRadius = (w+10)/2;
    outCicleV.clipsToBounds = YES;
    [titleArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *centerLB = [[UILabel alloc] init];
        centerLB.layer.cornerRadius = w/2;
        centerLB.clipsToBounds = YES;
        centerLB.text = [NSString stringWithFormat:@"%lu",
                         (unsigned long)idx+1];
        centerLB.textAlignment = NSTextAlignmentCenter;
        centerLB.textColor = [UIColor whiteColor];
        UIView *lineV = [UIView new];
        if (idx == 0) {
            centerLB.backgroundColor = APP_CONFIG.appMainRedColor;
            [self addSubview:outCicleV];
        }else {
            centerLB.backgroundColor = [UIColor colorWithRGB:231 g:231 b:231];
        }
        if (idx != 3) {
            lineV.backgroundColor = [UIColor colorWithRGB:231 g:231 b:231];
            [self insertSubview:lineV atIndex:0];
        }
        [self addSubview:centerLB];
        [centerLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(AdaptatSize(35));
            make.size.mas_offset((CGSize){w, w});
            if (idx == 0) {
                make.left.equalTo(self).with.offset(AdaptatSize(37));
                [outCicleV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.center.equalTo(centerLB);
                    make.size.mas_equalTo((CGSize){w+10, w+10});
                }];
            }else {
                make.left.equalTo(tmpLB.mas_right).with.offset(lineW);
            }
            if (idx != 3) {
                [lineV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(centerLB.mas_right);
                    make.centerY.equalTo(centerLB);
                    make.size.mas_equalTo((CGSize){lineW, 3});
                }];
            }
            tmpLB = centerLB;
        }];
        
        UILabel *textLB = [[UILabel alloc] init];
        textLB.text = [NSString stringWithFormat:@"%@", titleArr[idx]];
        if (idx == 0) {
            textLB.textColor = centerLB.backgroundColor;
        }else {
            textLB.textColor = [UIColor lightGrayColor];
        }
        textLB.font = AdapFont([APP_CONFIG appFontOfSize:14]);
        [textLB sizeToFit];
        [self addSubview:textLB];
        [textLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(centerLB.mas_bottom).with.offset(8);
            make.centerX.equalTo(centerLB);
        }];
        
        if (idx == 3) {
            [_becomeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(textLB.mas_bottom).with.offset(AdaptatSize(20));
                make.centerX.equalTo(self);
                make.size.mas_equalTo((CGSize){AdaptatSize(85), 36});
            }];
        }
    }];
}

- (void)showTopLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.height.mas_equalTo(10);
    }];
}

@end
