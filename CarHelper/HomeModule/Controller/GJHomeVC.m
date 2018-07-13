//
//  GJHomeVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/6/12.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeVC.h"
#import "GJHomeTopView.h"
#import "GJHomeTopCell.h"
#import "GJHomeParkingCell.h"

@interface GJHomeVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJHomeTopView *topView;
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) NSArray <GJBaseTableViewCell *> *cells;
@end

@implementation GJHomeVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _topView.frame = CGRectMake(0, 0, self.view.width, AdaptatSize(200));
    _tableView.frame = CGRectMake(0, _topView.height, self.view.width, self.view.height-_topView.height);
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
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    GJHomeTopCell *topCell = [[GJHomeTopCell alloc] init];
    GJHomeParkingCell *parkingCell = [[GJHomeParkingCell alloc] init];
    _cells = @[topCell, parkingCell];
}

- (void)initializationSubView {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.topView];
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
    return _cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cells[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cells[indexPath.row].height;
}

#pragma mark - Getter/Setter
- (GJHomeTopView *)topView {
    if (!_topView) {
        _topView = [GJHomeTopView install];
    }
    return _topView;
}

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
