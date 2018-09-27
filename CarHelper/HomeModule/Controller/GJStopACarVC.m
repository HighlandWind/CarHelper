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
#import "GJStopCarMapPopView.h"
#import <CoreLocation/CLLocationManager.h>
#import "AlertManager.h"

@interface GJStopACarVC ()
@property (nonatomic, strong) GJStopCarNaviView *naviView;
@property (nonatomic, strong) GJStopCarMapView *mapView;
@property (nonatomic, strong) GJStopCarMapPopView *mapPopView;
@end

@implementation GJStopACarVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_naviView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.mas_equalTo(NavBar_H);
    }];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(self.view.height / 2);
    }];
    [_mapPopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.mas_equalTo(self.view.height / 2);
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
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
        NSString *title = [NSString stringWithFormat:@"打开“定位服务”来允许%@确定您的位置", appName];
        [AlertManager showAlertTitle:title content:@"以便获取附近的车辆服务" viecontroller:self cancel:@"设置" sure:@"取消" cancelHandle:^{
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url];
            }
        } sureHandle:nil];
    }
}

- (void)initializationSubView {
    self.title = @"停车";
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.naviView];
    [self.view addSubview:self.mapPopView];
    [self blockHanddle];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods
- (void)blockHanddle {
    __weak typeof(self)weakself = self;
    _naviView.blockBackClick = ^{
        [weakself dismissViewControllerAnimated:YES completion:nil];
    };
}

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
        _mapView = [GJStopCarMapView installContext:self];
    }
    return _mapView;
}

- (GJStopCarMapPopView *)mapPopView {
    if (!_mapPopView) {
        _mapPopView = [[GJStopCarMapPopView alloc] init];
    }
    return _mapPopView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
