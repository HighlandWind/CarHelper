//
//  GJHomeTopView.m
//  CarHelper
//
//  Created by hsrd on 2018/7/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeTopView.h"
#import "GJSearchBar.h"

@interface GJHomeTopView () <UISearchBarDelegate>
@property (nonatomic, strong) UIViewController *context;
@property (nonatomic, strong) GJSearchBar *searchBar;
@property (nonatomic, strong) UIButton *addressBtn;
@property (nonatomic, strong) UIButton *weatherBtn;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UIView *dateLine;
@property (nonatomic, strong) UILabel *topRightLabel;
@property (nonatomic, strong) UIButton *speechBtn;
@property (nonatomic, strong) UIButton *addBtn;
@end

@implementation GJHomeTopView

+ (GJHomeTopView *)install {
    GJHomeTopView *top = [[GJHomeTopView alloc] init];
    return top;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)speechBtnClick {
    BLOCK_SAFE(_blockSpeech)();
}

- (void)addBtnClick {
    BLOCK_SAFE(_blockAdd)();
}

- (void)addressBtnClick {
    BLOCK_SAFE(_blockAddress)();
}

- (void)setBgAlpha:(CGFloat)bgAlpha {
    self.backgroundColor = [APP_CONFIG.appMainColor colorWithAlphaComponent:bgAlpha];
}

- (void)setupSubviews {
    [self setBgAlpha:0];
    
    _searchBar = [[GJSearchBar alloc] init];
    _searchBar.keyboardType = UIKeyboardTypeDefault;
    _searchBar.delegate = self;
    _searchBar.layer.cornerRadius = 5;
    _searchBar.clipsToBounds = YES;
    _searchBar.placeholder = @" 附近商家";
    
    _addressBtn = [[UIButton alloc] init];
    _addressBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _addressBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:14];
    [_addressBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_addressBtn setImage:[UIImage imageNamed:@"home_location_white"] forState:UIControlStateNormal];
    [_addressBtn sizeToFit];
    [_addressBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -15)];
    [_addressBtn addTarget:self action:@selector(addressBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _weatherBtn = [[UIButton alloc] init];
    _weatherBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:14];
    [_weatherBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_weatherBtn setImage:[UIImage imageNamed:@"home_whether_yellow"] forState:UIControlStateNormal];
    [_weatherBtn sizeToFit];
    [_weatherBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, -15)];
    
    _dateLabel = [[UILabel alloc] init];
    _dateLabel.font = [APP_CONFIG appAdaptFontOfSize:14];
    _dateLabel.textColor = [UIColor whiteColor];
    [_dateLabel sizeToFit];
    _dateLine = [[UIView alloc] init];
    _dateLine.backgroundColor = APP_CONFIG.lightTextColor;
    _topRightLabel = [[UILabel alloc] init];
    _topRightLabel.font = [APP_CONFIG appAdaptFontOfSize:12];
    _topRightLabel.textColor = [UIColor whiteColor];
    [_topRightLabel sizeToFit];
    _topRightLabel.backgroundColor = [UIColor colorWithRGB:0 g:159 b:236];
    _topRightLabel.layer.cornerRadius = 3;
    _topRightLabel.clipsToBounds = YES;
    
    _speechBtn = [[UIButton alloc] init];
    _speechBtn.backgroundColor = [UIColor greenColor];
    [_speechBtn addTarget:self action:@selector(speechBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _addBtn = [[UIButton alloc] init];
    _addBtn.backgroundColor = [UIColor yellowColor];
    [_addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_searchBar];
    [self addSubview:_addressBtn];
    [self addSubview:_weatherBtn];
    [self addSubview:_dateLabel];
    [self addSubview:_dateLine];
    [self addSubview:_topRightLabel];
    [self addSubview:_speechBtn];
    [self addSubview:_addBtn];
    
    [self setContents];
}

- (void)setContents {
    [_addressBtn setTitle:@"贵阳市" forState:UIControlStateNormal];
    [_weatherBtn setTitle:@"晴 25 ˚C" forState:UIControlStateNormal];
    _dateLabel.text = [self stringFromDate];
    _topRightLabel.text = @"  限行  ";
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).with.offset(-10);
        make.left.equalTo(self).with.offset(15);
        make.right.equalTo(self).with.offset(-AdaptatSize(50));
        make.height.mas_equalTo(AdaptatSize(30));
    }];
    [_speechBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(_searchBar);
        make.width.mas_equalTo(AdaptatSize(40));
    }];
    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_searchBar.mas_right);
        make.top.bottom.equalTo(_searchBar);
        make.right.equalTo(self);
    }];
    [_addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_searchBar);
        make.bottom.equalTo(_searchBar.mas_top).with.offset(-AdaptatSize(8));
        make.width.mas_equalTo(AdaptatSize(80));
        make.height.mas_equalTo(AdaptatSize(18));
    }];
    [_weatherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_addressBtn);
        make.left.equalTo(_addressBtn.mas_right);
    }];
    [_topRightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_addressBtn);
        make.right.equalTo(self).with.offset(-10);
    }];
    [_dateLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_topRightLabel);
        make.right.equalTo(_topRightLabel.mas_left).with.offset(-5);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(AdaptatSize(12));
    }];
    [_dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_addressBtn);
        make.right.equalTo(_dateLine.mas_left);
    }];
}

- (CGFloat)searchHeight {
    return NavBar_H + AdaptatSize(40);
}

#pragma mark -UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    BLOCK_SAFE(_blockSearch)(searchBar.text);
}

#pragma mark - 获取年月日及星期
- (NSString *)stringFromDate {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierBuddhist];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MM月dd日"];
    comps = [calendar components:unitFlags fromDate:senddate];
    NSString *locationString=[dateformatter stringFromDate:senddate];
    NSString *date_weekStr = [NSString stringWithFormat:@"%@ %@  ", locationString, [self week:[comps weekday]]];
    return date_weekStr;
}

- (NSString *)week:(NSInteger)week {
    NSString *weekStr=nil;
    if(week==1)
    {
        weekStr=@"星期天";
    }else if(week==2){
        weekStr=@"星期一";
        
    }else if(week==3){
        weekStr=@"星期二";
        
    }else if(week==4){
        weekStr=@"星期三";
        
    }else if(week==5){
        weekStr=@"星期四";
        
    }else if(week==6){
        weekStr=@"星期五";
        
    }else if(week==7){
        weekStr=@"星期六";
        
    }
    return weekStr;
}

@end
