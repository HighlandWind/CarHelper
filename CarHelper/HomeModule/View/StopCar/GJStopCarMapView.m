//
//  GJStopCarMapView.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/26.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJStopCarMapView.h"
#import <MAMapKit/MAMapKit.h>

static const NSInteger defaultMapZoomLevel = 14;

@interface GJStopCarMapView () <MAMapViewDelegate>
@property (nonatomic, strong) MAMapView *mapView;
@end

@implementation GJStopCarMapView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = APP_CONFIG.appBackgroundColor;
        
        [AMapServices sharedServices].enableHTTPS = YES;
        [self addSubview:self.mapView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
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
    }
    return _mapView;
}
@end
