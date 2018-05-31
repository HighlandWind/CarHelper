//
//  GJShopScoreController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJShopScoreController.h"
#import "GJShopScoreHeader.h"
#import "GJWithdrawCashDetailListCell.h"
#import "GJHomeManager.h"
#import "GJShopScoreListData.h"

@interface GJShopScoreController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJShopScoreHeader *tbvHeader;
@property (nonatomic, strong) GJHomeManager *homeManager;
@property (nonatomic, strong) GJShopScoreListData *listModel;
@end

@implementation GJShopScoreController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
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
    self.title = @"店铺积分";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    [self.view addSubview:self.tableView];
}

- (void)initializationNetWorking {
    [self.view.loadingView startAnimation];
    [_homeManager requestShopScoreListSuccess:^(GJShopScoreListData *data) {
        [self.view.loadingView stopAnimation];
        _listModel = data;
        [_tableView reloadData];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        ShowWaringAlertHUD(error.localizedDescription, self.view);
        [self.view.loadingView stopAnimation];
    }];
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _listModel.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJWithdrawCashDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJWithdrawCashDetailListCell reuseIndentifier]];
    if (!cell) cell = [[GJWithdrawCashDetailListCell alloc] initWithStyle:[GJWithdrawCashDetailListCell expectingStyle] reuseIdentifier:[GJWithdrawCashDetailListCell reuseIndentifier]];
    cell.isFromShop = YES;
    cell.listData = _listModel.data[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(68);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AdaptatSize(100);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    self.tbvHeader.score = _listModel.total_credits;
    return self.tbvHeader;
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    }
    return _tableView;
}

- (GJShopScoreHeader *)tbvHeader {
    if (!_tbvHeader) {
        _tbvHeader = [[GJShopScoreHeader alloc] init];
    }
    return _tbvHeader;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
