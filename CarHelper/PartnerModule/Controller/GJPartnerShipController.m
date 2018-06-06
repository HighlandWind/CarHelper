//
//  GJPartnerShipController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/14.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPartnerShipController.h"
#import "GJPartnerTopView.h"
#import "GJPartnerTopCell.h"
#import "GJHomeCellNormal.h"
#import "GJPartnerUpgradeVC.h"
#import "GJPartnerBenifitVC.h"
#import "GJRecomandRelatedVC.h"
#import "GJMyRecomandVC.h"
#import "GJPartnerManager.h"
#import "GJPartnerHomeData.h"

@interface GJPartnerShipController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJPartnerTopCell *top_Cell;
@property (nonatomic, strong) GJPartnerTopView *topView;
@property (nonatomic, strong) GJPartnerManager *partnerManager;
@property (nonatomic, strong) GJPartnerUpgradeVC *upgradeVC;
@property (nonatomic, strong) GJPartnerHomeData *dataSource;
@end

@implementation GJPartnerShipController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H-49);
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
    [self requestPartnerHomeDataWithDate:1];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    _partnerManager = [[GJPartnerManager alloc] init];
    _upgradeVC = [[GJPartnerUpgradeVC alloc] init];
}

- (void)initializationSubView {
    [self showShadorOnNaviBar:NO];
    [self.view addSubview:self.tableView];
    [self.tableView addSubview:self.topView];
    _top_Cell = [[GJPartnerTopCell alloc] init];
    [self blockHanddle];
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle
- (void)requestPartnerHomeDataWithDate:(NSInteger)date {
    
}

#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)blockHanddle {
    __weak typeof(self)weakSelf = self;
    _top_Cell.blockClickFourBtn = ^(NSInteger idx) {
        if (idx == 1) {
            weakSelf.upgradeVC.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:weakSelf.upgradeVC animated:YES];
        }
        if (idx == 2) {
            GJMyRecomandVC *vc = [GJMyRecomandVC new];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        if (idx == 3) {
            GJRecomandRelatedVC *vc = [GJRecomandRelatedVC new];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        if (idx == 4) {
            GJPartnerBenifitVC *vc = [GJPartnerBenifitVC new];
            vc.hidesBottomBarWhenPushed = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    };
    _top_Cell.blockClickSegment = ^(NSInteger idx) {
        [weakSelf requestPartnerHomeDataWithDate:idx + 1];
    };
}

#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.data.count + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return _top_Cell;
    }else {
        GJHomeCellNormal *cell = [tableView dequeueReusableCellWithIdentifier:[GJHomeCellNormal reuseIndentifier]];
        if (!cell) {
            cell = [[GJHomeCellNormal alloc] initWithStyle:[GJHomeCellNormal expectingStyle] reuseIdentifier:[GJHomeCellNormal reuseIndentifier]];
        }
        cell.partnerModel = _dataSource.data[indexPath.section - 1];
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
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    if (offset >= AdaptatSize(140)+44) {
//        [[UIApplication sharedApplication] setStatusBarHidden:YES];
    }else {
//        [[UIApplication sharedApplication] setStatusBarHidden:NO];
    }
}

#pragma mark - Getter/Setter
- (GJPartnerTopView *)topView {
    if (!_topView) {
        _topView = [GJPartnerTopView install];
    }
    return _topView;
}

- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.contentInset = UIEdgeInsetsMake(-[UIApplication sharedApplication].statusBarFrame.size.height, 0, -10, 0);
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
