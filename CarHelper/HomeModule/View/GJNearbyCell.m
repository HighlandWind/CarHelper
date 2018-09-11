//
//  GJNearbyCell.m
//  CarHelper
//
//  Created by hsrd on 2018/7/21.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJNearbyCell.h"

@interface GJNearbyCell () <UIScrollViewDelegate>
@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UILabel *topLB;
@property (nonatomic, strong) UILabel *addressLB;
@property (nonatomic, strong) UIButton *addrRefreshBtn;
@property (nonatomic, strong) UIButton *scanMapBtn;
@property (nonatomic, strong) UIView *midLine;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UIView *rightView;
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
    [_addrRefreshBtn setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
    [_addrRefreshBtn addTarget:self action:@selector(addrRefreshBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _scanMapBtn = [[UIButton alloc] init];
    _scanMapBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:12];
    [_scanMapBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
    [_scanMapBtn setTitle:@"查看地图" forState:UIControlStateNormal];
    [_scanMapBtn addTarget:self action:@selector(addrRefreshBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _midLine = [[UIView alloc] init];
    _midLine.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.contentSize = CGSizeMake((SCREEN_W - 20) * 2, _scrollView.height);
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
    
    _leftView = [[UIView alloc] init];
    _leftView.backgroundColor = [UIColor greenColor];
    _rightView = [[UIView alloc] init];
    _rightView.backgroundColor = [UIColor purpleColor];
    
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
        make.left.equalTo(_addressLB.mas_right).with.offset(3);
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
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.bottom.equalTo(self);
        make.top.equalTo(_midLine.mas_bottom);
    }];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(_scrollView);
        make.height.mas_equalTo(AdaptatSize(20));
    }];
    
    _leftView.frame = CGRectMake(0, 0, _scrollView.width, _scrollView.height - AdaptatSize(20));
    _rightView.frame = CGRectMake(_scrollView.width, 0, _scrollView.width, _scrollView.height - AdaptatSize(20));
}

- (CGFloat)height {
    return AdaptatSize(220);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = currentPage;
}

@end
