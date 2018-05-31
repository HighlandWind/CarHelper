//
//  GJGiveScoreController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/30.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJGiveScoreController.h"
#import "GJShopScoreController.h"
#import "GJGiveScoreView.h"
#import "GJHomeManager.h"

@interface GJGiveScoreController ()
@property (nonatomic, strong) GJGiveScoreView *giveScoreView;
@property (nonatomic, strong) GJHomeManager *homeManager;
@end

@implementation GJGiveScoreController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _giveScoreView.frame  =CGRectMake(20, 20, self.view.width-40, AdaptatSize(380));
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
    _homeManager = [[GJHomeManager alloc] init];
}

- (void)initializationSubView {
    self.title = @"赠送积分";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    self.view.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    [self.view addSubview:self.giveScoreView];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"店铺积分" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName, APP_CONFIG.darkTextColor,NSForegroundColorAttributeName, nil];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateHighlighted];
}

- (void)initializationNetWorking {
    __weak __typeof(self)weakSelf = self;
    _giveScoreView.blockGiveBtnClick = ^(NSString *phone, NSString *money) {
        [weakSelf.view.loadingView startAnimation];
        [weakSelf.homeManager requestGiveScore:phone score:money success:^(NSString *msg) {
            [weakSelf.view.loadingView stopAnimation];
            ShowSucceedAlertHUD(msg, nil);
            [weakSelf.navigationController popViewControllerAnimated:YES];
        } failure:^(NSURLResponse *urlResponse, NSError *error) {
            [weakSelf.view.loadingView stopAnimation];
            ShowWaringAlertHUD(error.localizedDescription, weakSelf.view);
        }];
    };
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)rightClick {
    GJShopScoreController *vc = [GJShopScoreController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJGiveScoreView *)giveScoreView {
    if (!_giveScoreView) {
        _giveScoreView = [[GJGiveScoreView alloc] init];
    }
    return _giveScoreView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
