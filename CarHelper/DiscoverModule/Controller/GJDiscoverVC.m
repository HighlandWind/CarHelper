//
//  GJDiscoverVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/6/12.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJDiscoverVC.h"

@interface GJDiscoverVC ()

@end

@implementation GJDiscoverVC

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
- (void)initializationData {
    
}

- (void)initializationSubView {
    self.title = @"发现";
}

- (void)initializationNetWorking {
    
}

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
