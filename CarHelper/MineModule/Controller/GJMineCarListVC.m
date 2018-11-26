//
//  GJMineCarListVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineCarListVC.h"
#import "GJMineCarListCell.h"
#import "GJMineCarListTopCell.h"

@interface GJMineCarListVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, assign) BOOL hasCar;
@end

@implementation GJMineCarListVC

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

- (instancetype)init
{
    self = [super init];
    if (self) {
        _hasCar = YES;
    }
    return self;
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    
}

- (void)initializationSubView {
    self.title = @"我的车辆";
    [self.view addSubview:self.tableView];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_hasCar) {
        return 1;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_hasCar) {
        GJMineCarListCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJMineCarListCell reuseIndentifier]];
        if (!cell) {
            cell = [[GJMineCarListCell alloc] initWithStyle:[GJMineCarListCell expectingStyle] reuseIdentifier:[GJMineCarListCell reuseIndentifier]];
        }
        cell.blockClickEdit = ^{
            GJMineCarListVC *vc = [[GJMineCarListVC alloc] init];
            vc.hasCar = NO;
            [self.navigationController pushViewController:vc animated:YES];
        };
        return cell;
    }
    GJMineCarListTopCell *topCell = [[GJMineCarListTopCell alloc] init];
    return topCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_hasCar) {
        return AdaptatSize(180);
    }
    return self.view.height / 2;
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = APP_CONFIG.appBackgroundColor;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
