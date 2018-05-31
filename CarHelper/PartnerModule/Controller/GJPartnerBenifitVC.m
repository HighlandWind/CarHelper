//
//  GJPartnerBenifitVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPartnerBenifitVC.h"
#import "GJPartnerBenifitCell.h"
#import "GJPartnerBenifitHeader.h"
#import "GJWithdrawCashVC.h"
#import "GJPartnerManager.h"
#import "GJWithdrawCashDetailVC.h"

@interface GJPartnerBenifitVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) GJPartnerBenifitHeader *headerView;
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJPartnerManager *partnerManager;
@property (nonatomic, strong) GJPartnerBenifitData *models;
@property (nonatomic, strong) GJShopBenifitData *modelShop;
@end

@implementation GJPartnerBenifitVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _bottomBtn.frame = CGRectMake(0, self.view.height-49, self.view.width, 49);
    _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height-_bottomBtn.height);
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
    if (_isFromShop) {
        self.title = @"店铺收益";
    }else {
        self.title = @"合伙收益";
    }
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomBtn];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"提现明细" style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnClick)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName, APP_CONFIG.darkTextColor,NSForegroundColorAttributeName, nil];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateHighlighted];
}

- (void)initializationNetWorking {
    [_headerView setLeft:@"0" center:@"0" right:@"0"];
    if (_isFromShop) {
        [self requestShopBenifit];
    }else {
        [self requestParterBenifit];
    }
}

#pragma mark - Request Handle
- (void)requestParterBenifit {
    [self.view.loadingView startAnimation];
    [_partnerManager requestPartnerBenifitWithPage:1 success:^(GJPartnerBenifitData *data) {
        [self.view.loadingView stopAnimation];
        _models = data;
        [_headerView setLeft:data.dpsy center:data.balance right:data.tjsy];
        [_tableView reloadData];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
    }];
}

- (void)requestShopBenifit {
    [self.view.loadingView startAnimation];
    [_partnerManager requestShopBenifitWithPage:1 success:^(GJShopBenifitData *data) {
        [self.view.loadingView stopAnimation];
        _modelShop = data;
        [_headerView setLeft:data.ysrz center:data.balance right:data.ydfr];
        [_tableView reloadData];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
    }];
}

#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)bottomBtnClick {
    GJWithdrawCashVC *vc = [GJWithdrawCashVC new];
    vc.isFromShop = _isFromShop;
    if (_isFromShop) {
        vc.yueMoney = _modelShop.balance;
    }else {
        vc.yueMoney = _models.balance;
    }
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)rightBtnClick {
    GJWithdrawCashDetailVC *vc = [GJWithdrawCashDetailVC new];
    vc.isFromShop = _isFromShop;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJPartnerBenifitCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJPartnerBenifitCell reuseIndentifier]];
    if (!cell) cell = [[GJPartnerBenifitCell alloc] initWithStyle:[GJPartnerBenifitCell expectingStyle] reuseIdentifier:[GJPartnerBenifitCell reuseIndentifier]];
    cell.isFromShop = _isFromShop;
    if (_isFromShop) {
        cell.modelShop = _modelShop.data[indexPath.row];
    }else {
        cell.model = _models.data[indexPath.row];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isFromShop) {
        return _modelShop.data.count;
    }else {
        return _models.data.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_isFromShop) {
        return AdaptatSize(80);
    }else {
        return AdaptatSize(130);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.headerView.height;
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped controller:self];
        _tableView.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
        if (_isFromShop) {
            _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        }
    }
    return _tableView;
}

- (GJPartnerBenifitHeader *)headerView {
    if (!_headerView) {
        _headerView = [[GJPartnerBenifitHeader alloc] init];
        _headerView.isFromShop = _isFromShop;
    }
    return _headerView;
}

- (UIButton *)bottomBtn {
    if (!_bottomBtn) {
        _bottomBtn = [[UIButton alloc] init];
        _bottomBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:16]);
        if (_isFromShop) {
            _bottomBtn.backgroundColor = APP_CONFIG.appMainColor;
        }else {
            _bottomBtn.backgroundColor = APP_CONFIG.partnerMainColor;
        }
        [_bottomBtn setTitle:@"提现" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
