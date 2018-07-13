//
//  GJHomeTopView.m
//  CarHelper
//
//  Created by hsrd on 2018/7/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeTopView.h"
#import "FZHPopView.h"

@interface GJHomeTopView () <UISearchBarDelegate, FZHPopViewDelegate>
@property (nonatomic, strong) UIViewController *context;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) FZHPopView *popView;
@property (nonatomic, strong) NSMutableArray *titleArray;
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
        self.titleArray = [NSMutableArray arrayWithObjects:@"friend",@"article",@"number", nil];
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.searchBar = [[UISearchBar alloc]init];
    self.searchBar.frame = CGRectMake(0, NavBar_H, SCREEN_W, NavBar_H);
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"搜索";
    
    self.popView = [[FZHPopView alloc]init];
    self.popView.frame = CGRectMake(0, SCREEN_H, SCREEN_W, SCREEN_H - NavBar_H);
    self.popView.fzhPopViewDelegate = self;
    
    [self addSubview:self.searchBar];
    [self addSubview:self.popView];
}

#pragma mark -UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    [self.popView showThePopViewWithArray:self.titleArray];
    [UIView animateWithDuration:0.5 animations:^{
        //1.
//        _context.navigationController.navigationBar.transform = CGAffineTransformMakeTranslation(0, -NavBar_H);
        self.searchBar.transform = CGAffineTransformMakeTranslation(0, -44);
        
        //2.
        self.searchBar.showsCancelButton = YES;
        [self setupCancelButton];
    }];
}

#pragma mark -FZHPopViewDelegate
-(void)getTheButtonTitleWithButton:(UIButton *)button{
    self.searchBar.placeholder = button.titleLabel.text;
    [self.searchBar setImage:[UIImage imageNamed:@"common"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [self.popView dismissThePopView];
}

- (void)setupCancelButton{
    UIButton *cancelButton = [self.searchBar valueForKey:@"_cancelButton"];
    [cancelButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [cancelButton addTarget:self action:@selector(cancelButtonClickEvent) forControlEvents:UIControlEventTouchUpInside];
}

- (void)cancelButtonClickEvent{
    [self.popView dismissThePopView];
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        //1.
//        _context.navigationController.navigationBar.transform = CGAffineTransformIdentity;
        self.searchBar.transform = CGAffineTransformIdentity;
        //2.
        self.searchBar.showsCancelButton = NO;
        [self.searchBar endEditing:YES];
        //3.
    }];
    
    self.searchBar.placeholder = @"搜索";
    [self.searchBar setImage:[UIImage imageNamed:@"search"] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
}

@end
