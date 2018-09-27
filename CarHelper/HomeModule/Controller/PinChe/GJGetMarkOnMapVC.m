//
//  GJGetMarkOnMapVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJGetMarkOnMapVC.h"
#import "GJStopCarMapView.h"
#import "GJGetCarMapTopView.h"

@interface GJGetMarkOnMapVC ()
@property (nonatomic, strong) GJStopCarMapView *mapView;
@property (nonatomic, strong) GJGetCarMapTopView *topView;
@property (nonatomic, strong) UIButton *btmButton;
@end

@implementation GJGetMarkOnMapVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(5);
        make.left.equalTo(self.view).with.offset(AdaptatSize(20));
        make.right.equalTo(self.view).with.offset(-AdaptatSize(20));
        make.height.mas_equalTo(AdaptatSize(45));
    }];
    [_btmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(AdaptatSize(60));
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showNaviSingleLine];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    
}

- (void)initializationSubView {
    [self allowBack];
    [self.view addSubview:self.mapView];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.btmButton];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)btmButtonClick {
    
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJStopCarMapView *)mapView {
    if (!_mapView) {
        _mapView = [GJStopCarMapView installContext:self];
    }
    return _mapView;
}

- (GJGetCarMapTopView *)topView {
    if (!_topView) {
        _topView = [[GJGetCarMapTopView alloc] init];
    }
    return _topView;
}

- (UIButton *)btmButton {
    if (!_btmButton) {
        _btmButton = [[UIButton alloc] init];
        _btmButton.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:17];
        [_btmButton setTitle:@"标注" forState:UIControlStateNormal];
        [_btmButton setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
        _btmButton.backgroundColor = APP_CONFIG.appMainColor;
        [_btmButton addTarget:self action:@selector(btmButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btmButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
