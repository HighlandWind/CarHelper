//
//  GJBindingPayController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBindingPayController.h"
#import "GJBindingInputVC.h"
#import "GJNormalCellModel.h"
#import "GJBindingListCell.h"

@interface GJBindingPayController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJNormalCellModel *model1;
@property (nonatomic, strong) GJNormalCellModel *model2;
@property (nonatomic, strong) NSString *alipayAccount;
@property (nonatomic, strong) NSString *wechatAccount;
@property (nonatomic, strong) NSArray <GJNormalCellModel *> *models;
@end

@implementation GJBindingPayController

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableView.frame = CGRectMake(0, 0, SCREEN_W, SCREEN_H-NavBar_H);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _alipayAccount = JudgeContainerCountIsNull(APP_USER.userInfo.zfbzh)?@"未绑定":APP_USER.userInfo.zfbzh;
    _wechatAccount = JudgeContainerCountIsNull(APP_USER.userInfo.wxzh)?@"未绑定":APP_USER.userInfo.wxzh;
    _model1.detail = _alipayAccount;
    _model2.detail = _wechatAccount;
    [_tableView reloadData];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    
    _model1 = [GJNormalCellModel cellModelTitle:@"支付宝" detail:_alipayAccount imageName:nil acessoryType:0];
    _model2 = [GJNormalCellModel cellModelTitle:@"微信" detail:_wechatAccount imageName:nil acessoryType:0];
    _models = @[_model1, _model2];
    __weak typeof(self)weakSelf = self;
    _model1.didSelectBlock = ^(NSIndexPath *indexPath) {
        GJBindingInputVC *vc = [GJBindingInputVC new];
        vc.title = @"支付宝绑定";
        vc.placeHolder = APP_USER.userInfo.zfbzh;
        vc.type = 0;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    _model2.didSelectBlock = ^(NSIndexPath *indexPath) {
        GJBindingInputVC *vc = [GJBindingInputVC new];
        vc.title = @"微信绑定";
        vc.placeHolder = APP_USER.userInfo.wxzh;
        vc.type = 1;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
}

- (void)initializationSubView {
    self.title = @"支付宝&微信";
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
    return _models.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJBindingListCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJBindingListCell reuseIndentifier]];
    if (!cell) cell = [[GJBindingListCell alloc] initWithStyle:[GJBindingListCell expectingStyle] reuseIdentifier:[GJBindingListCell reuseIndentifier]];
    cell.cellModel = _models[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(45);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BLOCK_SAFE(_models[indexPath.row].didSelectBlock)(indexPath);
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    GJBindingListFooter *foot = [[GJBindingListFooter alloc] init];
    return foot;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return AdaptatSize(45);
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        [_tableView setContentInset:UIEdgeInsetsMake(15, 0, 0, 0)];
        _tableView.backgroundColor = [UIColor colorWithRGB:246 g:246 b:251];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
