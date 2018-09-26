//
//  GJStopACarVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/26.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJStopACarVC.h"
#import "GJStopCarNaviView.h"
#import "GJStopCarMapView.h"

@interface GJStopACarVC ()
@property (nonatomic, strong) GJStopCarNaviView *naviView;
@property (nonatomic, strong) GJStopCarMapView *mapView;
@end

@implementation GJStopACarVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [_naviView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(NavBar_H);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setStatusBarLight:NO];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
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
    self.title = @"停车";
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.naviView];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJStopCarNaviView *)naviView {
    if (!_naviView) {
        _naviView = [[GJStopCarNaviView alloc] init];
    }
    return _naviView;
}

- (GJStopCarMapView *)mapView {
    if (!_mapView) {
        _mapView = [[GJStopCarMapView alloc] init];
    }
    return _mapView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
