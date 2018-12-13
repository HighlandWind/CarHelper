//
//  GJWashCarMidView.m
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarMidView.h"

@interface GJWashCarMidView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIButton *btmBtn;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@end

@implementation GJWashCarMidView

- (void)btmBtnClick {
    BLOCK_SAFE(_blockClickBtmBtn)();
}

- (void)pageAction:(UIPageControl *)page {
    [_scrollView setContentOffset:CGPointMake(page.currentPage * (SCREEN_W - 20), 0) animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = currentPage;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = APP_CONFIG.appBackgroundColor;
        _btmBtn = [[UIButton alloc] init];
        _btmBtn.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:13];
        [_btmBtn setTitle:@"    查看花果园附近的所有商家    " forState:UIControlStateNormal];
        [_btmBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _btmBtn.layer.cornerRadius = 15;
        _btmBtn.layer.borderWidth = 1;
        _btmBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _btmBtn.clipsToBounds = YES;
        [_btmBtn sizeToFit];
        [_btmBtn addTarget:self action:@selector(btmBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.cornerRadius = 8;
        _backView.layer.shadowColor = [UIColor grayColor].CGColor;
        _backView.layer.shadowOpacity = 0.2;
        _backView.layer.shadowRadius = 5.f;
        _backView.layer.shadowOffset = CGSizeMake(0,0);
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.layer.cornerRadius = 8;
        _scrollView.clipsToBounds = YES;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.currentPageIndicatorTintColor = APP_CONFIG.appMainColor;
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRGB:188 g:188 b:188];
        _pageControl.currentPage = 0;
        [_pageControl addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
        
        _pageControl.numberOfPages = 3;
        _scrollView.contentSize = CGSizeMake((SCREEN_W - AdaptatSize(40)) * 3, _scrollView.height);
        
        [self addSubview:_btmBtn];
        [self addSubview:_backView];
        [self addSubview:_scrollView];
        [self addSubview:_pageControl];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_btmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(self);
        make.height.mas_equalTo(30);
    }];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self).with.offset(5);
        make.right.equalTo(self).with.offset(-5);
        make.bottom.equalTo(self.btmBtn.mas_top).with.offset(-AdaptatSize(35));
    }];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.backView);
    }];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.scrollView);
        make.top.equalTo(self.scrollView.mas_bottom).with.offset(AdaptatSize(10));
        make.height.mas_equalTo(AdaptatSize(20));
    }];
}

@end
