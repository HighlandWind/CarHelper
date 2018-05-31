//
//  GJWithdrawCashDetailVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJWithdrawCashDetailVC.h"
#import "GJPartnerManager.h"
#import "GJWithdrawCashDetailListCell.h"

@interface GJWithdrawCashDetailVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJPartnerManager *partnerManager;
@property (nonatomic, strong) NSArray <GJWithdrawCashDetailList *> *lists;
@end

@implementation GJWithdrawCashDetailVC

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
    _partnerManager = [[GJPartnerManager alloc] init];
}

- (void)initializationSubView {
    self.title = @"提现明细";
    [self allowBack];
    [self.view addSubview:self.tableView];
}

- (void)initializationNetWorking {
    [self.view.loadingView startAnimation];
    
    NSInteger type;
    if (_isFromShop) {
        type = 1;
    }else {
        type = 0;
    }
    
    [_partnerManager requestWithdrawCashDetailListType:type success:^(NSArray<GJWithdrawCashDetailList *> *list) {
        [self.view.loadingView stopAnimation];
        _lists = list;
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
    return _lists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJWithdrawCashDetailListCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJWithdrawCashDetailListCell reuseIndentifier]];
    if (!cell) cell = [[GJWithdrawCashDetailListCell alloc] initWithStyle:[GJWithdrawCashDetailListCell expectingStyle] reuseIdentifier:[GJWithdrawCashDetailListCell reuseIndentifier]];
    cell.isFromShop = _isFromShop;
    cell.model = _lists[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(80);
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.backgroundColor = [UIColor colorWithRGB:246 g:246 b:251];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
