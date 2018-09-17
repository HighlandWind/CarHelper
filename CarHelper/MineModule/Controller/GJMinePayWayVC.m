//
//  GJMinePayWayVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMinePayWayVC.h"

@interface GJMinePayWayVC ()

@end

@implementation GJMinePayWayVC

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

#pragma mark - Iniitalization methods
- (void)initializationData {
    
}

- (void)initializationSubView {
    self.title = @"支付方式";
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
