//
//  GJMinePayWayVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMinePayWayVC.h"
#import "GJPayWayZFBCell.h"
#import "GJPayWayUnionCell.h"
#import "GJPayWayWeChatCell.h"
#import "GJMinePayWayFooter.h"
#import "JXMovableCellTableView.h"

@interface GJMinePayWayVC () <JXMovableCellTableViewDataSource, JXMovableCellTableViewDelegate>
@property (nonatomic, strong) JXMovableCellTableView *tableView;
@property (nonatomic, strong) NSMutableArray <GJBaseTableViewCell *> *cells;
@property (nonatomic, strong) GJMinePayWayFooter *footerView;
@end

@implementation GJMinePayWayVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    GJPayWayZFBCell *zfbCell = [[GJPayWayZFBCell alloc] init];
    GJPayWayUnionCell *unionCell = [[GJPayWayUnionCell alloc] init];
    GJPayWayWeChatCell *wxCell = [[GJPayWayWeChatCell alloc] init];
    _cells = @[zfbCell, unionCell, wxCell].mutableCopy;
}

- (void)initializationSubView {
    self.title = @"支付方式";
    [self.view addSubview:self.tableView];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - JXMovableCellTableViewDataSource, JXMovableCellTableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return _cells[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cells[indexPath.row].height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return self.footerView.height;
}

- (NSMutableArray *)dataSourceArrayInTableView:(JXMovableCellTableView *)tableView {
    return _cells;
}

- (void)tableView:(JXMovableCellTableView *)tableView didMoveCellFromIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
}

#pragma mark - Getter/Setter
- (JXMovableCellTableView *)tableView {
    if (!_tableView) {
        _tableView = [[JXMovableCellTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.longPressGesture.minimumPressDuration = 0.2;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = APP_CONFIG.appBackgroundColor;
        [_tableView setContentInset:UIEdgeInsetsMake(-AdaptatSize(30), 0, 0, 0)];
    }
    return _tableView;
}

- (GJMinePayWayFooter *)footerView {
    if (!_footerView) {
        _footerView = [[GJMinePayWayFooter alloc] init];
    }
    return _footerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
