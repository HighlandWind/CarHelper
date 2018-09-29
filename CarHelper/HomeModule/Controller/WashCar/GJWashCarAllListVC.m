//
//  GJWashCarAllListVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarAllListVC.h"
#import "GJWashCarListFilterView.h"
#import "GJWashCarAllListTBVCell.h"

@interface GJWashCarAllListVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJWashCarListFilterView *filterView;
@property (nonatomic, strong) GJBaseTableView *tableView;
@end

@implementation GJWashCarAllListVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_filterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(AdaptatSize(40));
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
    self.title = @"洗车";
    [self.view addSubview:self.filterView];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (BOOL)tableView:(UITableView *)tableView shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJWashCarAllListTBVCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJWashCarAllListTBVCell reuseIndentifier]];
    if (!cell) {
        cell = [[GJWashCarAllListTBVCell alloc] initWithStyle:[GJWashCarAllListTBVCell expectingStyle] reuseIdentifier:[GJWashCarAllListTBVCell reuseIndentifier]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(100);
}

#pragma mark - Getter/Setter
- (GJWashCarListFilterView *)filterView {
    if (!_filterView) {
        _filterView = [[GJWashCarListFilterView alloc] init];
    }
    return _filterView;
}

- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
