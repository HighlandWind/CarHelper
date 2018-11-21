//
//  GJHomeParkingCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeParkingCell.h"

@interface GJHomeParkingCell ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *monthV;
@property (nonatomic, strong) UILabel *monthLB;
@property (nonatomic, strong) UILabel *dayLB;

@property (nonatomic, strong) UILabel *parkLocateLB;
@property (nonatomic, strong) NSTimer *timeNow;
@property (nonatomic, strong) UILabel *timeLB;
@property (nonatomic, strong) UILabel *timeDetailLB;
@property (nonatomic, strong) UILabel *statusLB;
@end

@implementation GJHomeParkingCell

- (void)commonInit {
    self.backgroundColor = [UIColor clearColor];
    _timeNow = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerFunc) userInfo:nil repeats:YES];
    
    _backView = [[UIView alloc] initWithFrame:CGRectMake(AdaptatSize(12), AdaptatSize(10), SCREEN_W - AdaptatSize(24), self.height - AdaptatSize(25))];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.cornerRadius = 5;
    _backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _backView.layer.shadowOpacity = 0.2;
    _backView.layer.shadowRadius = 4.f;
    _backView.layer.shadowOffset = CGSizeMake(0,0);
    
    _monthV = [[UIView alloc] init];
    _monthV.layer.cornerRadius = 5;
    _monthV.layer.borderColor = [UIColor colorWithRGB:240 g:240 b:240].CGColor;
    _monthV.layer.borderWidth = 1;
    _monthV.clipsToBounds = YES;
    _monthLB = [self createLabelFont:8 color:[UIColor whiteColor]];
    _monthLB.text = [self currentMonthToEnString];
    _monthLB.backgroundColor = [UIColor colorWithRGB:255 g:128 b:133];
    _dayLB = [self createLabelFont:15 color:[UIColor colorWithRGB:82 g:73 b:203]];
    _dayLB.text = [self getCurrentDay];
    
    _parkLocateLB = [self createLabelFont:14 color:[UIColor grayColor]];
    _parkLocateLB.numberOfLines = 0;
    _parkLocateLB.text = @"南明区中华中路00号\nXX大厦停车场\n负二层c1区2105";
    
    _timeLB = [self createLabelFont:17 color:[UIColor blackColor]];
    
    _timeDetailLB = [[UILabel alloc] init];
    _timeDetailLB.textColor = [UIColor grayColor];
    _timeDetailLB.font = [APP_CONFIG appAdaptFontOfSize:7];
    _timeDetailLB.text = @" 01:21开始  ";
    _timeDetailLB.layer.cornerRadius = 3;
    _timeDetailLB.layer.borderColor = [UIColor colorWithRGB:184 g:249 b:236].CGColor;
    _timeDetailLB.layer.borderWidth = 1;
    _timeDetailLB.clipsToBounds = YES;
    
    _statusLB = [self createLabelFont:12 color:[UIColor whiteColor]];
    _statusLB.backgroundColor = [UIColor colorWithRGB:0 g:223 b:158];
    _statusLB.layer.cornerRadius = AdaptatSize(20) / 2;
    _statusLB.clipsToBounds = YES;
    _statusLB.text = @"停车中";
    
    [self.contentView addSubview:_backView];
    [self.contentView addSubview:_monthV];
    [_monthV addSubview:_monthLB];
    [_monthV addSubview:_dayLB];
    [self addSubview:_parkLocateLB];
    [self addSubview:_timeLB];
    [self addSubview:_timeDetailLB];
    [self addSubview:_statusLB];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_monthV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_backView).with.offset(10);
        make.top.equalTo(_backView);
        make.width.mas_equalTo(AdaptatSize(30));
        make.height.mas_equalTo(AdaptatSize(35));
    }];
    [_monthLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(_monthV);
        make.height.mas_equalTo(AdaptatSize(13));
    }];
    [_dayLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_monthV);
        make.bottom.equalTo(_monthV).with.offset(-2);
    }];
    [_parkLocateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_backView);
        make.right.equalTo(_backView.mas_centerX);
    }];
    [_statusLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).with.offset(AdaptatSize(60));
        make.bottom.equalTo(_backView).with.offset(-15);
        make.height.mas_equalTo(AdaptatSize(22));
        make.width.mas_equalTo(AdaptatSize(60));
    }];
    [_timeDetailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_statusLB);
        make.bottom.equalTo(_statusLB.mas_top).with.offset(-AdaptatSize(15));
    }];
    [_timeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_statusLB);
        make.top.equalTo(_parkLocateLB);
    }];
}

- (CGFloat)height {
    return AdaptatSize(153);
}

- (void)timerFunc {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *timestamp = [formatter stringFromDate:[NSDate date]];
    if (![_timeLB.text isEqualToString:timestamp]) {
        [_timeLB setText:timestamp];
    }
}

- (NSString *)currentMonthToEnString {
    NSDate *date =[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    return [NSString stringWithFormat:@"%ld月", (long)currentMonth];
}

- (NSString *)getCurrentDay {
    NSDate *date =[NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    return [NSString stringWithFormat:@"%ld", (long)currentDay];
}

- (UILabel *)createLabelFont:(CGFloat)font color:(UIColor *)color {
    UILabel *label = [[UILabel alloc] init];
    label.font = [APP_CONFIG appAdaptBoldFontOfSize:font];
    label.textColor = color;
    [label sizeToFit];
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

@end
