//
//  GJMyRecomandVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJMyRecomandVC.h"
#import "GJMyRecommandCodeView.h"
#import "GJPartnerManager.h"

@interface GJMyRecomandVC ()
@property (nonatomic, strong) GJMyRecommandCodeView *recommandView;
@property (nonatomic, strong) GJPartnerManager *partnerManager;
@end

@implementation GJMyRecomandVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _recommandView.frame = CGRectMake(20, NavBar_H, SCREEN_W-40, self.view.height-NavBar_H*2);
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
    _partnerManager = [[GJPartnerManager alloc] init];
}

- (void)initializationSubView {
    self.title = @"我的推荐码";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    self.view.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    [self.view addSubview:self.recommandView];
}

- (void)initializationNetWorking {
    [self.view.loadingView startAnimation];
    [_partnerManager requestMyQRCodeSuccess:^(GJMyQRCodeData *datas) {
        [self.view.loadingView stopAnimation];
        _recommandView.data = datas;
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
    }];
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJMyRecommandCodeView *)recommandView {
    if (!_recommandView) {
        _recommandView = [[GJMyRecommandCodeView alloc] init];
    }
    return _recommandView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
