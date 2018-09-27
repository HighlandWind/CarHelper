//
//  GJStopCarMapView.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/26.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJStopCarMapView.h"
#import <MAMapKit/MAMapKit.h>
#import "MAAnnotationView+GJAMapCustomLocationIcon.h"
#import "GJMapStatusView.h"

static NSInteger const defaultMapZoomLevel = 14;
static NSString * const locateIdentifier = @"userView";

@interface GJStopCarMapView () <MAMapViewDelegate>
@property (nonatomic, strong) UIViewController *context;
@property (nonatomic, strong) MAMapView *mapView;
@property (nonatomic, strong) GJMapStatusView *statusView;
@property (nonatomic, assign) CLLocationCoordinate2D currentLocation;
@end

@implementation GJStopCarMapView

+ (GJStopCarMapView *)installContext:(UIViewController *)context {
    GJStopCarMapView *v = [[GJStopCarMapView alloc] init];
    v.context = context;
    return v;
}

- (void)tapClick {
    [_context.view endEditing:YES];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = APP_CONFIG.appBackgroundColor;
        
        [AMapServices sharedServices].enableHTTPS = YES;
        // simulator test code
        if (TARGET_IPHONE_SIMULATOR) {
            _currentLocation.latitude = 26.569151;
            _currentLocation.longitude = 106.691741;
        }else {
            self.mapView.showsUserLocation = YES;
            self.mapView.userTrackingMode = MAUserTrackingModeFollow;
        }
        [self addSubview:self.mapView];
        [self addSubview:self.statusView];
        self.mapView.centerCoordinate = _currentLocation;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [_statusView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(AdaptatSize(35));
        make.height.mas_equalTo(AdaptatSize(80));
        make.right.equalTo(self).with.offset(-AdaptatSize(10));
        make.top.equalTo(self).with.offset(NavBar_H + AdaptatSize(20));
    }];
}

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation {
    CLHeading *heading = userLocation.heading;
    MAAnnotationView *userView = [mapView viewForAnnotation:userLocation];
    // rotate location icon
    [userView rotateWithHeading:heading];
    if (updatingLocation) {
        _currentLocation = userLocation.location.coordinate;
        self.mapView.centerCoordinate = _currentLocation;
    }
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
    MAAnnotationView *userView = [mapView dequeueReusableAnnotationViewWithIdentifier:locateIdentifier];
    if (!userView) userView = [[MAAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:locateIdentifier];
    // 定位 icon
    if ([annotation isKindOfClass:[MAUserLocation class]]) {
        userView.image = [UIImage imageNamed:@"common_map_my_location"];
    }
    return userView;
}

#pragma mark - Getter/Setter
- (MAMapView *)mapView {
    if (!_mapView) {
        _mapView = [[MAMapView alloc] init];
        // delete amap logo
        [_mapView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[UIImageView class]]) [obj removeFromSuperview];
        }];
        _mapView.delegate = self;
        _mapView.mapType = MAMapTypeStandard;
        _mapView.showsScale = NO;
        _mapView.desiredAccuracy = kCLLocationAccuracyBest;
        _mapView.zoomEnabled = YES;
        _mapView.showsCompass = NO;
        _mapView.rotateEnabled = NO;
        _mapView.rotateCameraEnabled = NO;
        _mapView.zoomLevel = defaultMapZoomLevel;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
        tap.numberOfTapsRequired = 1;
        [_mapView addGestureRecognizer:tap];
    }
    return _mapView;
}

- (GJMapStatusView *)statusView {
    if (!_statusView) {
        _statusView = [[GJMapStatusView alloc] init];
    }
    return _statusView;
}

@end
