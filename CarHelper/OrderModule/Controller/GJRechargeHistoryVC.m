//
//  GJRechargeHistoryVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/30.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRechargeHistoryVC.h"
#import "GJWithdrawCashDetailListCell.h"
#import "GJOrderManager.h"

@interface GJRechargeHistoryVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJOrderManager *orderManager;
@property (nonatomic, strong) NSArray <GJRechargeDetailListData *> *dataList;
@end

@implementation GJRechargeHistoryVC

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

#pragma mark - Iniitalization methods
- (void)initializationData {
    _orderManager = [[GJOrderManager alloc] init];
}

- (void)initializationSubView {
    self.title = @"充值明细";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    [self.view addSubview:self.tableView];
}

- (void)initializationNetWorking {
    [self.view.loadingView startAnimation];
    [_orderManager requestRechargeDetailSuccess:^(NSArray<GJRechargeDetailListData *> *datas) {
        [self.view.loadingView stopAnimation];
        _dataList = datas;
        if (datas.count == 0) {
            ShowWaringAlertHUD(@"没有数据", self.view);
        }
        [_tableView reloadData];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
        ShowWaringAlertHUD(error.localizedDescription, self.view);
    }];
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataList.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJWithdrawCashDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJWithdrawCashDetailListCell reuseIndentifier]];
    if (!cell) cell = [[GJWithdrawCashDetailListCell alloc] initWithStyle:[GJWithdrawCashDetailListCell expectingStyle] reuseIdentifier:[GJWithdrawCashDetailListCell reuseIndentifier]];
    cell.isFromShop = YES;
    cell.rechageData = _dataList[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(80);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
