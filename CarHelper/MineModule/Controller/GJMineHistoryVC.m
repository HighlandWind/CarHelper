//
//  GJMineHistoryVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineHistoryVC.h"
#import "GJMineHistoryCell.h"

@interface GJMineHistoryVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) UIView *leftBtmLine;
@end

@implementation GJMineHistoryVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [_leftBtmLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(AdaptatSize(80));
        make.top.bottom.equalTo(self.view);
        make.width.mas_equalTo(AdaptatSize(6));
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
    _leftBtmLine = [[UIView alloc] init];
    _leftBtmLine.backgroundColor = [UIColor colorWithRGB:186 g:206 b:243];
}

- (void)initializationSubView {
    self.title = @"轨迹";
    [self.view addSubview:self.leftBtmLine];
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
    GJMineHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJMineHistoryCell reuseIndentifier]];
    if (!cell) {
        cell = [[GJMineHistoryCell alloc] initWithStyle:[GJMineHistoryCell expectingStyle] reuseIdentifier:[GJMineHistoryCell reuseIndentifier]];
    }
    cell.indexPath = indexPath;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(130);
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.bounces = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        self.view.backgroundColor = APP_CONFIG.appBackgroundColor;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
