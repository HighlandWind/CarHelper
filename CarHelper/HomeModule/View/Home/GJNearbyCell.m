//
//  GJNearbyCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/21.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJNearbyCell.h"

@interface GJNearbyCellRightView : GJBaseTableViewCell
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UIButton *locateBtn;
@property (nonatomic, strong) UIButton *yuyueBtn;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@end

@interface GJNearbyCell () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UILabel *topLB;
@property (nonatomic, strong) UILabel *addressLB;
@property (nonatomic, strong) UIButton *addrRefreshBtn;
@property (nonatomic, strong) UIButton *scanMapBtn;
@property (nonatomic, strong) UIView *midLine;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) GJBaseTableView *leftView;
@property (nonatomic, strong) GJNearbyCellRightView *rightView;
@end

@interface GJNearbyCellLeftCell : GJBaseTableViewCell
@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UILabel *detailLB;
@property (nonatomic, strong) UIButton *locateBtn;
@end

@implementation GJNearbyCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)addrRefreshBtnClick {
    
}

- (void)scanMapBtnClick {
    BLOCK_SAFE(_blockClickScanMap)();
}

- (void)pageAction:(UIPageControl *)page {
    [_scrollView setContentOffset:CGPointMake(page.currentPage * (SCREEN_W - 20), 0) animated:YES];
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor whiteColor];
    
    _topLine = [[UIView alloc] init];
    _topLine.backgroundColor = APP_CONFIG.appMainColor;
    
    _topLB = [[UILabel alloc] init];
    _topLB.font = [APP_CONFIG appAdaptBoldFontOfSize:14];
    _topLB.textColor = APP_CONFIG.darkTextColor;
    _topLB.text = @"附近的停车场";
    [_topLB sizeToFit];
    
    _addressLB = [[UILabel alloc] init];
    _addressLB.font = [APP_CONFIG appAdaptBoldFontOfSize:12];
    _addressLB.textColor = APP_CONFIG.grayTextColor;
    _addressLB.text = @"贵州省贵阳市南明区中山路32号";
    [_addressLB sizeToFit];
    
    _addrRefreshBtn = [[UIButton alloc] init];
    [_addrRefreshBtn setImage:[UIImage imageNamed:@"home_nearby_refresh"] forState:UIControlStateNormal];
    [_addrRefreshBtn addTarget:self action:@selector(addrRefreshBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _scanMapBtn = [[UIButton alloc] init];
    _scanMapBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:10];
    [_scanMapBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
    [_scanMapBtn setTitle:@"查看地图" forState:UIControlStateNormal];
    [_scanMapBtn addTarget:self action:@selector(scanMapBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _midLine = [[UIView alloc] init];
    _midLine.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.contentSize = CGSizeMake(SCREEN_W * 2, _scrollView.height);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.delegate = self;
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.numberOfPages = 2;
    _pageControl.currentPageIndicatorTintColor = APP_CONFIG.appMainColor;
    _pageControl.pageIndicatorTintColor = [UIColor colorWithRGB:188 g:188 b:188];
    _pageControl.currentPage = 0;
    [_pageControl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    
    _leftView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain view:self];
    _leftView.scrollEnabled = NO;
    _leftView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _rightView = [[GJNearbyCellRightView alloc] init];
    
    [self.contentView addSubview:_topLine];
    [self.contentView addSubview:_topLB];
    [self.contentView addSubview:_addressLB];
    [self.contentView addSubview:_addrRefreshBtn];
    [self.contentView addSubview:_scanMapBtn];
    [self.contentView addSubview:_midLine];
    [self.contentView addSubview:_scrollView];
    [self.contentView addSubview:_pageControl];
    [_scrollView addSubview:_leftView];
    [_scrollView addSubview:_rightView];
}

- (void)layoutSubviews {
    [_topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.top.equalTo(self).with.offset(10);
        make.height.mas_equalTo(AdaptatSize(16));
        make.width.mas_equalTo(3);
    }];
    [_topLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLine.mas_right).with.offset(7);
        make.centerY.equalTo(_topLine);
    }];
    [_addressLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLB);
        make.top.equalTo(_topLB.mas_bottom).with.offset(5);
    }];
    [_addrRefreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_addressLB);
        make.left.equalTo(_addressLB.mas_right);
        make.width.height.mas_equalTo(AdaptatSize(30));
    }];
    [_scanMapBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_topLB);
        make.right.equalTo(self);
        make.width.mas_equalTo(AdaptatSize(70));
        make.height.mas_equalTo(AdaptatSize(30));
    }];
    [_midLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_topLine);
        make.right.equalTo(self);
        make.top.equalTo(_addrRefreshBtn.mas_bottom);
        make.height.mas_equalTo(1);
    }];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self);
        make.top.equalTo(_midLine.mas_bottom);
    }];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(_scrollView);
        make.height.mas_equalTo(AdaptatSize(20));
    }];
    
    _leftView.frame = CGRectMake(10, 0, _scrollView.width-20, _scrollView.height - AdaptatSize(20));
    _rightView.frame = CGRectMake(_scrollView.width+10, 0, _scrollView.width-20, _scrollView.height - AdaptatSize(20));
}

- (CGFloat)height {
    return AdaptatSize(220);
}

- (void)setLeftTBVDatas:(NSArray *)leftTBVDatas {
    _leftTBVDatas = leftTBVDatas;
    [_leftView reloadData];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = currentPage;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _leftTBVDatas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJNearbyCellLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJNearbyCellLeftCell reuseIndentifier]];
    if (!cell) {
        cell = [[GJNearbyCellLeftCell alloc] initWithStyle:[GJNearbyCellLeftCell expectingStyle] reuseIdentifier:[GJNearbyCellLeftCell reuseIndentifier]];
    }
    cell.titleLB.text = _leftTBVDatas[indexPath.row];
    cell.detailLB.text = @"324车位-4元/小时";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _leftView.height / _leftTBVDatas.count;
}

@end

@implementation GJNearbyCellLeftCell

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self showBottomLine];
    
    _titleLB = [[UILabel alloc] init];
    _titleLB.font = [APP_CONFIG appAdaptFontOfSize:13];
    _titleLB.textColor = APP_CONFIG.darkTextColor;
    [_titleLB sizeToFit];
    
    _detailLB = [[UILabel alloc] init];
    _detailLB.font = [APP_CONFIG appAdaptFontOfSize:10];
    _detailLB.textColor = APP_CONFIG.grayTextColor;
    [_detailLB sizeToFit];
    
    _locateBtn = [[UIButton alloc] init];
    _locateBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:10];
    [_locateBtn setTitle:@"  300m" forState:UIControlStateNormal];
    [_locateBtn setTitleColor:APP_CONFIG.darkTextColor forState:UIControlStateNormal];
    [_locateBtn setImage:[UIImage imageNamed:@"home_nearby_distance"] forState:UIControlStateNormal];
    
    [self.contentView addSubview:_titleLB];
    [self.contentView addSubview:_detailLB];
    [self.contentView addSubview:_locateBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(5));
        make.centerY.equalTo(self);
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.mas_centerX).with.offset(AdaptatSize(45));
    }];
    [_locateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self);
    }];
}

- (void)showBottomLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.appBackgroundColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.left.equalTo(self).with.offset(AdaptatSize(10));
        make.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

@end

@implementation GJNearbyCellRightView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [APP_CONFIG appAdaptFontOfSize:13];
        _titleLB.textColor = APP_CONFIG.blackTextColor;
        [_titleLB sizeToFit];
        _titleLB.text = @"XX洗车美容中心";
        
        _detailLB = [[UILabel alloc] init];
        _detailLB.font = [APP_CONFIG appAdaptFontOfSize:12];
        _detailLB.textColor = APP_CONFIG.darkTextColor;
        [_detailLB sizeToFit];
        _detailLB.text = @"就回本看咯解不开";
        
        _locateBtn = [[UIButton alloc] init];
        _locateBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:10];
        [_locateBtn setTitle:@" 300m" forState:UIControlStateNormal];
        [_locateBtn setTitleColor:APP_CONFIG.darkTextColor forState:UIControlStateNormal];
        [_locateBtn setImage:[UIImage imageNamed:@"home_nearby_distance"] forState:UIControlStateNormal];
        
        _yuyueBtn = [[UIButton alloc] init];
        _yuyueBtn.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:15];
        [_yuyueBtn setTitle:@"预约" forState:UIControlStateNormal];
        [_yuyueBtn setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
        _yuyueBtn.backgroundColor = APP_CONFIG.appMainColor;
        _yuyueBtn.layer.cornerRadius = 6;
        _yuyueBtn.clipsToBounds = YES;
        
        _leftBtn = [[UIButton alloc] init];
        _leftBtn.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:12];
        [_leftBtn setTitle:@"普通洗车：¥30.00" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
        _leftBtn.layer.borderColor = APP_CONFIG.appMainColor.CGColor;
        _leftBtn.layer.borderWidth = 1;
        _leftBtn.layer.cornerRadius = 4;
        _leftBtn.clipsToBounds = YES;
        [_leftBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        _rightBtn = [[UIButton alloc] init];
        _rightBtn.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:12];
        [_rightBtn setTitle:@"精致洗车：¥50.00" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:APP_CONFIG.grayTextColor forState:UIControlStateNormal];
        _rightBtn.layer.borderColor = APP_CONFIG.grayTextColor.CGColor;
        _rightBtn.layer.borderWidth = 1;
        _rightBtn.layer.cornerRadius = 4;
        _rightBtn.clipsToBounds = YES;
        [_rightBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:_titleLB];
        [self.contentView addSubview:_detailLB];
        [self.contentView addSubview:_locateBtn];
        [self.contentView addSubview:_yuyueBtn];
        [self.contentView addSubview:_leftBtn];
        [self.contentView addSubview:_rightBtn];
    }
    return self;
}

- (void)buttonClick:(UIButton *)btn {
    if (btn == _leftBtn) {
        [_leftBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
        _leftBtn.layer.borderColor = APP_CONFIG.appMainColor.CGColor;
        [_rightBtn setTitleColor:APP_CONFIG.grayTextColor forState:UIControlStateNormal];
        _rightBtn.layer.borderColor = APP_CONFIG.grayTextColor.CGColor;
    }else {
        [_leftBtn setTitleColor:APP_CONFIG.grayTextColor forState:UIControlStateNormal];
        _leftBtn.layer.borderColor = APP_CONFIG.grayTextColor.CGColor;
        [_rightBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
        _rightBtn.layer.borderColor = APP_CONFIG.appMainColor.CGColor;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(5));
        make.top.equalTo(self).with.offset(AdaptatSize(12));
    }];
    [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLB.mas_bottom).with.offset(5);
        make.left.equalTo(_titleLB);
    }];
    [_locateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_detailLB);
        make.left.equalTo(_detailLB.mas_right).with.offset(10);
    }];
    [_yuyueBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AdaptatSize(30));
        make.width.mas_equalTo(SCREEN_W - AdaptatSize(80));
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).with.offset(-AdaptatSize(10));
    }];
    [_leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.height.equalTo(_yuyueBtn);
        make.bottom.equalTo(_yuyueBtn.mas_top).with.offset(-AdaptatSize(15));
        make.right.equalTo(self.mas_centerX).with.offset(-AdaptatSize(18));
    }];
    [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.height.equalTo(_yuyueBtn);
        make.centerY.equalTo(_leftBtn);
        make.left.equalTo(self.mas_centerX).with.offset(AdaptatSize(18));
    }];
}

@end

