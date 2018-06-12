//
//  GJLoginController.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/29.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJLoginController.h"

@interface GJLoginController ()

@end

@implementation GJLoginController

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
    
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods
+ (BOOL)needLoginPresentWithVC:(UIViewController *)controller loginSucessBlcok:(LoginSuccessBlcok)success {
    return YES;
}

+ (void)logOutPresentLoginControllerByVC:(UIViewController *)controller loginSucessBlcok:(LogoutSuccessBlcok)success {
    
}

#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
