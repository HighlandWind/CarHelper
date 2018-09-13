//
//  GJMineVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/6/12.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineVC.h"
#import "GJAppSettingVC.h"

@interface GJMineVC ()

@end

@implementation GJMineVC

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
    self.title = @"我的";
    UIBarButtonItem * back = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"setup"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = back;
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)rightAction {
    GJAppSettingVC *vc = [[GJAppSettingVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
