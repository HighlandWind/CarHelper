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

- (void)setupSubviews {
    self.backgroundColor = [UIColor clearColor];
    
    _searchBar = [[GJSearchBar alloc] init];
    _searchBar.keyboardType = UIKeyboardTypeDefault;
    _searchBar.delegate = self;
    _searchBar.layer.cornerRadius = 5;
    _searchBar.clipsToBounds = YES;
    _searchBar.placeholder = @" 附近商家";
    
    [self addSubview:_searchBar];
}

#pragma mark -UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    BLOCK_SAFE(_blockSearch)(searchBar.text);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self);
        make.left.equalTo(self).with.offset(15);
        make.right.equalTo(self).with.offset(-AdaptatSize(50));
        make.height.mas_equalTo(self.searchHeight);
    }];
}

- (CGFloat)searchHeight {
    return AdaptatSize(30);
}

@end
