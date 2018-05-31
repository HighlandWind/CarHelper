//
//  GJApplyUserController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/14.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyUserController.h"
#import "GJApplyUserBottomView.h"
#import "GJApplyUserTopView.h"
#import "GJApplyUserBtmBtn.h"
#import "GJApplyUserFormVC.h"
#import "GJRegisterController.h"
#import "GJHomeManager.h"

@interface GJApplyUserController ()
@property (nonatomic, strong) GJApplyUserTopView *topView;
@property (nonatomic, strong) GJApplyUserBottomView *bottomView;
@property (nonatomic, strong) GJApplyUserBtmBtn *bottomButton;
@end

@implementation GJApplyUserController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (SCREEN_H >= kGJIphoneX) {
        _topView.frame = CGRectMake(0, 0, self.view.width, AdaptatSize(350));
    }else {
        _topView.frame = CGRectMake(0, 0, self.view.width, AdaptatSize(310));
    }
    _bottomView.frame = CGRectMake(0, _topView.height, self.view.width, self.view.height-_topView.height-_bottomButton.height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setStatusBarLight:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self setStatusBarLight:NO];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[GJHomeManager new] requestRegionData];
}

#pragma mark - Iniitalization methods
- (void)initializationData {}

- (void)initializationSubView {
    [self.view addSubview:self.topView];
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.bottomButton];
    [self blockHandle];
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)blockHandle {
    __weak typeof(self)weakSelf = self;
    _topView.blockClick_1 = ^{
        GJApplyUserFormVC *formVC = [GJApplyUserFormVC new];
        formVC.blockApplySuccessShowHome = ^{
            BLOCK_SAFE(weakSelf.blockShowHome)(1);
        };
        [formVC presentSelfID:@"初级合伙" context:weakSelf];
    };
    _topView.blockClick_2 = ^{
        GJApplyUserFormVC *formVC = [GJApplyUserFormVC new];
        formVC.blockApplySuccessShowHome = ^{
            BLOCK_SAFE(weakSelf.blockShowHome)(1);
        };
        [formVC presentSelfID:@"区县合伙" context:weakSelf];
    };
    _topView.blockClick_3 = ^{
        GJApplyUserFormVC *formVC = [GJApplyUserFormVC new];
        formVC.blockApplySuccessShowHome = ^{
            BLOCK_SAFE(weakSelf.blockShowHome)(1);
        };
        [formVC presentSelfID:@"城市合伙" context:weakSelf];
    };
    _topView.blockClick_4 = ^{
        GJApplyUserFormVC *formVC = [GJApplyUserFormVC new];
        formVC.blockApplySuccessShowHome = ^{
            BLOCK_SAFE(weakSelf.blockShowHome)(1);
        };
        [formVC presentSelfID:@"天使投资" context:weakSelf];
    };
    _bottomView.blockClickBecomeStore = ^{
        GJRegisterController *reg = [[GJRegisterController alloc] init];
        reg.blockApplySuccessShowHome = ^{
            BLOCK_SAFE(weakSelf.blockShowHome)(0);
        };
        [weakSelf presentViewController:reg animated:YES completion:nil];
    };
    _bottomButton.bottomScanBtnBlock = ^{
        [GJLoginController needLoginPresentWithVC:weakSelf loginSucessBlcok:^{
            BLOCK_SAFE(weakSelf.blockShowHome)(0);
        }];
    };
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJApplyUserTopView *)topView {
    if (!_topView) {
        _topView = [[GJApplyUserTopView alloc] init];
    }
    return _topView;
}

- (GJApplyUserBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[GJApplyUserBottomView alloc] init];
    }
    return _bottomView;
}

- (GJApplyUserBtmBtn *)bottomButton {
    if (!_bottomButton) {
        _bottomButton = [GJApplyUserBtmBtn install];
    }
    return _bottomButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
