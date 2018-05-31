//
//  GJRecomandRelatedVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRecomandRelatedVC.h"
#import "GJRecommandRelatedHeader.h"

#import "GJRecommandVC1.h"
#import "GJRecommandVC2.h"
#import "GJRecommandVC3.h"
#import "GJRecommandVC4.h"
#import "GJRecommandVC5.h"
#import "GJRecommandSearchVC.h"

@interface GJRecomandRelatedVC ()
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) GJRecommandRelatedHeader *headerView;
@property (nonatomic, strong) NSArray <GJBaseViewController *> *childVCList;
@property (nonatomic, strong) GJBaseViewController *currentVC;
@end

@implementation GJRecomandRelatedVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _bottomBtn.frame = CGRectMake(0, self.view.height-49, self.view.width, 49);
    _headerView.frame = CGRectMake(0, 0, self.view.width, _headerView.height);
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
- (void)initializationData {}

- (void)initializationSubView {
    self.title = @"推荐关系";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    [self.view addSubview:self.bottomBtn];
    [self.view addSubview:self.headerView];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"seach"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClick)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    for (UIViewController *vc in self.childVCList) {
        [self addChildViewController:vc];
    }
    // default show
    [self fitFrameForChildViewController:_childVCList[0]];
    [self.view addSubview:_childVCList[0].view];
    _currentVC = _childVCList[0];
    
    [self blockHanddle];
}

- (void)initializationNetWorking {
    [_headerView setNumber:@"5" atIndex:0];
    [_headerView setNumber:@"3" atIndex:1];
    [_headerView setNumber:@"2" atIndex:2];
    [_headerView setNumber:@"4" atIndex:3];
    [_headerView setNumber:@"1" atIndex:4];
}

#pragma mark - Request Handle
- (void)refreshData {
    // _currentVC refresh
    
}

#pragma mark - Private methods
// adjust child controller's frame to adapt self view
- (void)fitFrameForChildViewController:(GJBaseViewController *)chileViewController{
    chileViewController.view.frame = CGRectMake(0, _headerView.height, self.view.width, self.view.height-49-_headerView.height);
}

// switch child controller
- (void)transitionFromOldViewController:(GJBaseViewController *)oldViewController toNewViewController:(GJBaseViewController *)newViewController{
    [self transitionFromViewController:oldViewController toViewController:newViewController duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newViewController didMoveToParentViewController:self];
            _currentVC = newViewController;
        }else{
            _currentVC = oldViewController;
        }
        [self refreshData];
    }];
}

#pragma mark - Public methods


#pragma mark - Event response
- (void)blockHanddle {
    __weak typeof(self)weakSelf = self;
    _headerView.blockClickItems = ^(NSInteger idx) {
        [weakSelf fitFrameForChildViewController:weakSelf.childVCList[idx]];
        [weakSelf transitionFromOldViewController:weakSelf.currentVC toNewViewController:weakSelf.childVCList[idx]];
    };
}

- (void)rightBarBtnClick {
    GJRecommandSearchVC *vc = [GJRecommandSearchVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJRecommandRelatedHeader *)headerView {
    if (!_headerView) {
        _headerView = [[GJRecommandRelatedHeader alloc] init];
    }
    return _headerView;
}

- (UIButton *)bottomBtn {
    if (!_bottomBtn) {
        _bottomBtn = [[UIButton alloc] init];
        _bottomBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:16]);
        _bottomBtn.backgroundColor = APP_CONFIG.partnerMainColor;
        [_bottomBtn setTitle:@"奖金合计：6800.00" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _bottomBtn;
}

- (NSArray<GJBaseViewController *> *)childVCList {
    if (!_childVCList) {
        GJRecommandVC1 *vc1 = [GJRecommandVC1 new];
        GJRecommandVC2 *vc2 = [GJRecommandVC2 new];
        GJRecommandVC3 *vc3 = [GJRecommandVC3 new];
        GJRecommandVC4 *vc4 = [GJRecommandVC4 new];
        GJRecommandVC5 *vc5 = [GJRecommandVC5 new];
        _childVCList = @[vc1, vc2, vc3, vc4, vc5];
    }
    return _childVCList;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
