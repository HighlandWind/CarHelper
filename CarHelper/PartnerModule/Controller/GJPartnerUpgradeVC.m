//
//  GJPartnerUpgradeVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPartnerUpgradeVC.h"
#import "GJPartnerUpgradeCell.h"
#import "GJHomeBottomView.h"
#import "GJPartnerManager.h"
#import "GJApplyUserFormVC.h"

@interface GJPartnerUpgradeVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJHomeBottomView *bottomView;
@property (nonatomic, strong) GJPartnerManager *partnerManager;
@property (nonatomic, strong) NSArray<GJMyPartnerIdentifierData *> *datas;
@end

@implementation GJPartnerUpgradeVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (SCREEN_H >= kGJIphoneX) {
        _bottomView.frame = CGRectMake(0, self.view.height-AdaptatSize(90), self.view.width, AdaptatSize(90));
    }else {
        _bottomView.frame = CGRectMake(0, self.view.height-AdaptatSize(80), self.view.width, AdaptatSize(80));
    }
    _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height-_bottomView.height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setStatusBarLight:NO];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    _partnerManager = [[GJPartnerManager alloc] init];
}

- (void)initializationSubView {
    self.title = @"我的合伙人身份";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.tableView];
    [self blockHanddle];
}

- (void)initializationNetWorking {
    [self requestIdentifier];
}

#pragma mark - Request Handle
- (void)requestIdentifier {
    [self.view.loadingView startAnimation];
    [_partnerManager requestMyPartnerIdentifierSuccess:^(NSArray<GJMyPartnerIdentifierData *> *datas) {
        [self.view.loadingView stopAnimation];
        _datas = datas;
        [_tableView reloadData];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
    }];
}

#pragma mark - Private methods
- (void)blockHanddle {
    __weak typeof(self)weakSelf = self;
    _bottomView.bottomScanBtnBlock = ^{
        GJApplyUserFormVC *formVC = [GJApplyUserFormVC new];
        formVC.isFromUpgrade = YES;
        formVC.blockApplySuccessShowHome = ^{
            [weakSelf requestIdentifier];
        };
        [formVC presentSelfID:@"初级合伙" context:weakSelf];
    };
}

#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJPartnerUpgradeCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJPartnerUpgradeCell reuseIndentifier]];
    if (!cell) cell = [[GJPartnerUpgradeCell alloc] initWithStyle:[GJPartnerUpgradeCell expectingStyle] reuseIdentifier:[GJPartnerUpgradeCell reuseIndentifier]];
    cell.model = _datas[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GJPartnerUpgradeCell height];
}

#pragma mark - Getter/Setter
- (GJHomeBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [GJHomeBottomView installWithText:@"合伙升级" image:@"scan"];
    }
    return _bottomView;
}

- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped controller:self];
        _tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
