//
//  GJShopAlbumController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/30.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJShopAlbumController.h"

@interface GJShopAlbumController ()

@end

@implementation GJShopAlbumController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setStatusBarLight:NO];
}

#pragma mark - Iniitalization methods
- (void)initializationData {}

- (void)initializationSubView {
    self.title = @"店铺相册";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
