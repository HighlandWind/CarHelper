//
//  GJMineOrderVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineOrderVC.h"
#import "GJMineOrderCell.h"
#import "GJMineEvaluateVC.h"

@interface GJMineOrderVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@end

@implementation GJMineOrderVC

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
    
}

- (void)initializationSubView {
    self.title = @"订单记录";
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJMineOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJMineOrderCell reuseIndentifier]];
    if (!cell) {
        cell = [[GJMineOrderCell alloc] initWithStyle:[GJMineOrderCell expectingStyle] reuseIdentifier:[GJMineOrderCell reuseIndentifier]];
    }
    cell.blockEvaluateClick = ^{
        GJMineEvaluateVC *vc = [[GJMineEvaluateVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(100);
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
