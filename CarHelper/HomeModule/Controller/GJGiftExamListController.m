//
//  GJGiftExamListController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJGiftExamListController.h"
#import "GJGiftExamListHeader.h"
#import "GJGiftExamListCell.h"

@interface GJGiftExamListController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJGiftExamListHeader *tbvHeader;
@end

@implementation GJGiftExamListController

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
- (void)initializationData {}

- (void)initializationSubView {
    self.title = @"核验完成";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    [self.view addSubview:self.tableView];
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJGiftExamListCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJGiftExamListCell reuseIndentifier]];
    if (!cell) {
        cell = [[GJGiftExamListCell alloc] initWithStyle:[GJGiftExamListCell expectingStyle] reuseIdentifier:[GJGiftExamListCell reuseIndentifier]];
    }
    cell.model = _datas[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(100);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    [self.tbvHeader setUseScore:_datas.count phone:_phone];
    return self.tbvHeader;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AdaptatSize(70);
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped controller:self];
        _tableView.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    }
    return _tableView;
}

- (GJGiftExamListHeader *)tbvHeader {
    if (!_tbvHeader) {
        _tbvHeader = [[GJGiftExamListHeader alloc] init];;
    }
    return _tbvHeader;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
