//
//  GJHomeViewController.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJHomeViewController.h"
#import "GJHomeNaviView.h"
#import "GJQRCodeController.h"
#import "GJHomeManager.h"
#import "GJHomeCellNormal.h"
#import "GJHomeCell_1.h"
#import "GJPartnerBenifitVC.h"
#import "GJShopStatusController.h"
#import "GJVIPManageVC.h"
#import "GJGiftExamController.h"
#import "GJShopAlbumController.h"
#import "GJShopRechargeVC.h"
#import "GJGiveScoreController.h"

@interface GJHomeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJHomeNaviView *naviItemBar;
@property (nonatomic, strong) GJQRCodeController *qrCode;
@property (nonatomic, strong) GJHomeManager *homeManager;
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJHomeCell_1 *top_Cell;
@property (nonatomic, strong) GJHomeShopData *shopData;
@end

@implementation GJHomeViewController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableView.frame = CGRectMake(0, NavBar_H-1, SCREEN_W, SCREEN_H-NavBar_H-48);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self setStatusBarLight:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self requestDataWithDateIdx:1];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    _homeManager = [[GJHomeManager alloc] init];
    _qrCode = [[GJQRCodeController alloc] init];
}

- (void)initializationSubView {
    [self showShadorOnNaviBar:NO];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.naviItemBar];
    self.automaticallyAdjustsScrollViewInsets = false;
    _top_Cell  =[[GJHomeCell_1 alloc] init];
    [self blockHandle];
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle
- (void)requestDataWithDateIdx:(NSInteger)dateIdx {
    
}

#pragma mark - Public methods


#pragma mark - Event response
- (void)blockHandle {
    __weak typeof(self)weakSelf = self;
    _top_Cell.blockClickThreeBtn = ^(NSInteger idx) {
        if (idx == 1) {
            GJGiftExamController *vc = [GJGiftExamController new];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        if (idx == 2) {
            GJGiveScoreController *vc = [GJGiveScoreController new];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        if (idx == 3) {
            GJPartnerBenifitVC *vc = [GJPartnerBenifitVC new];
            vc.isFromShop = YES;
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        if (idx == 4) {
            GJShopAlbumController *vc = [GJShopAlbumController new];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        if (idx == 5) {
            GJShopRechargeVC *vc = [GJShopRechargeVC new];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        if (idx == 6) {
            GJVIPManageVC *vc = [GJVIPManageVC new];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    };
    _top_Cell.blockClickSegment = ^(NSInteger idx) {
        [weakSelf requestDataWithDateIdx:idx + 1];
    };
    _naviItemBar.blockShopStatusClick = ^{
        GJShopStatusController *vc = [GJShopStatusController new];
        vc.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
}

#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_shopData) {
        return 3+1;
    }
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        _top_Cell.shopData = _shopData;
        return _top_Cell;
    }else {
        GJHomeCellNormal *cell = [tableView dequeueReusableCellWithIdentifier:[GJHomeCellNormal reuseIndentifier]];
        if (!cell) {
            cell = [[GJHomeCellNormal alloc] initWithStyle:[GJHomeCellNormal expectingStyle] reuseIdentifier:[GJHomeCellNormal reuseIndentifier]];
        }
        [cell setShopData:_shopData index:indexPath.section];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return _top_Cell.height;
    }else {
        return AdaptatSize(168);
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *v = [UIView new];
    v.backgroundColor = [UIColor colorWithRGB:242 g:242 b:242];
    return v;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

#pragma mark - Getter/Setter
- (GJHomeNaviView *)naviItemBar {
    if (!_naviItemBar) _naviItemBar = [GJHomeNaviView install];
    return _naviItemBar;
}

- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.bounces = NO;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
