//
//  GJHomeCarShopVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/12/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeCarShopVC.h"

@interface GJHomeCarShopVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@end

@implementation GJHomeCarShopVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
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
    self.title = @"汽车用品";
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
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(50);
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
