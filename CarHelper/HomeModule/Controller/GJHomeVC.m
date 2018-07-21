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
#import "GJNearbyCell.h"
#import "GJScheduleCell.h"

@interface GJHomeVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJHomeTopView *topView;
@property (nonatomic, strong) UIImageView *topBgImg;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) NSArray <GJBaseTableViewCell *> *cells;
@property (nonatomic, strong) GJHomeTopCell *topCell;
@end

@implementation GJHomeVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _topView.frame = CGRectMake(0, 0, self.view.width, AdaptatSize(100));
    _topBgImg.frame = CGRectMake(0, 0, self.view.width, _topCell.height - 15);
    _backView.frame = CGRectMake(0, _topBgImg.height, self.view.width, self.view.height-_topBgImg.height);
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
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    _backView = [[UIView alloc] init];
    _backView.backgroundColor = APP_CONFIG.appBackgroundColor;
    _topCell = [[GJHomeTopCell alloc] init];
    GJHomeParkingCell *parkingCell = [[GJHomeParkingCell alloc] init];
    GJNearbyCell *nearbyCell = [[GJNearbyCell alloc] init];
    GJScheduleCell *scheduleCell = [[GJScheduleCell alloc] init];
    _cells = @[_topCell, parkingCell, nearbyCell, scheduleCell];
}

- (void)initializationSubView {
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.backView];
    [self.view addSubview:self.topBgImg];
    [self.view addSubview:self.tableView];
//    [self.view addSubview:self.topView];
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
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (UIImageView *)topBgImg {
    if (!_topBgImg) {
        _topBgImg = [[UIImageView alloc] init];
        _topBgImg.backgroundColor = APP_CONFIG.appMainColor;
    }
    return _topBgImg;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
