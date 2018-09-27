//
//  GJDiscoverVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/6/12.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJDiscoverVC.h"

@interface GJDiscoverVC () <UIWebViewDelegate>

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
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-49)];
    web.backgroundColor = [UIColor whiteColor];
    web.delegate = self;
    NSURLRequest *request =  [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com/"]];
    [web loadRequest:request];
    [self.view addSubview:web];
    [self.view.loadingView startAnimation];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.view.loadingView stopAnimation];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    [self.view.loadingView stopAnimation];
}

#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
