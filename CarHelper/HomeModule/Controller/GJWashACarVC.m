//
//  GJWashACarVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/26.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashACarVC.h"
#import "GJWashCarBtmBtn.h"
#import "GJWashCarMidView.h"
#import "GJWashCarTopView.h"
#import "GJWashCarSearchVC.h"
#import "GJWashCarAllListVC.h"

@interface GJWashACarVC ()
@property (nonatomic, strong) GJWashCarBtmBtn *btmBtn;
@property (nonatomic, strong) GJWashCarMidView *midView;
@property (nonatomic, strong) GJWashCarTopView *topView;
@end

@implementation GJWashACarVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_btmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(AdaptatSize(15));
        make.right.equalTo(self.view).with.offset(-AdaptatSize(15));
        make.bottom.equalTo(self.view).with.offset(-AdaptatSize(35));
        make.height.mas_equalTo(AdaptatSize(50));
    }];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(AdaptatSize(78));
    }];
    [_midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.topView.mas_bottom).with.offset(AdaptatSize(10));
        make.bottom.equalTo(self.btmBtn.mas_top).with.offset(-AdaptatSize(15));
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setStatusBarLight:NO];
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
    self.title = @"洗车";
    self.view.backgroundColor = APP_CONFIG.appBackgroundColor;
    [self.view addSubview:self.topView];
    [self.view addSubview:self.midView];
    [self.view addSubview:self.btmBtn];
    [self blockHanddle];
}

- (void)initializationNetWorking {
    _topView.address = @"花果园";
    _midView.contents = @[@"服务1", @"服务2", @"服务3"];
}

#pragma mark - Request Handle


#pragma mark - Private methods
- (void)blockHanddle {
    __weak typeof(self)weakself = self;
    _topView.blockClickTopBtn = ^{
        GJWashCarSearchVC *vc = [[GJWashCarSearchVC alloc] init];
        [weakself presentViewController:vc animated:YES completion:nil];
    };
    _topView.blockClickYuYinBtn = ^{
        
    };
    _midView.blockClickBtmBtn = ^{
        GJWashCarAllListVC *vc = [[GJWashCarAllListVC alloc] init];
        [weakself.navigationController pushViewController:vc animated:YES];
    };
}

#pragma mark - Public methods


#pragma mark - Event response
- (void)btmBtnClick {
    
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJWashCarTopView *)topView {
    if (!_topView) {
        _topView = [[GJWashCarTopView alloc] init];
    }
    return _topView;
}

- (GJWashCarMidView *)midView {
    if (!_midView) {
        _midView = [[GJWashCarMidView alloc] init];
    }
    return _midView;
}

- (GJWashCarBtmBtn *)btmBtn {
    if (!_btmBtn) {
        _btmBtn = [[GJWashCarBtmBtn alloc] init];
        [_btmBtn addTarget:self action:@selector(btmBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btmBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
