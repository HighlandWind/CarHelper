//
//  GJMineCenterController.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJMineCenterController.h"
#import "GJMineManager.h"
#import "GJAppSettingsController.h"
#import "GJApplyUserController.h"
#import "GJNormalCellModel.h"
#import "GJMineTBVCell.h"
#import "GJMineTopCell.h"
#import "GJInfoSettingsController.h"
#import "GJAboutUSController.h"
#import "GJInviteHasGiftVC.h"
#import "GJBindingPayController.h"

@interface GJMineCenterController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJMineManager *mineManager;
@property (nonatomic, strong) GJApplyUserController *applyVC;
@property (nonatomic, strong) NSArray <GJNormalCellModel *> *models;
@property (nonatomic, strong) GJMineTopCell *topCell;
@end

@implementation GJMineCenterController

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setStatusBarLight:NO];
    [self showShadorOnNaviBar:NO];
    [_topCell updatePortrait];
    if ([APP_USER.userInfo.isQQ boolValue] && [APP_USER.userInfo.isWX boolValue]) {
        [_topCell setMineAccountStatus:YES];
    }else {
        [_topCell setMineAccountStatus:NO];
    }
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    GJNormalCellModel *model1 = [GJNormalCellModel cellModelTitle:@"个人信息" detail:nil imageName:@"user1" acessoryType:1];
    GJNormalCellModel *model2 = [GJNormalCellModel cellModelTitle:@"新手指南" detail:nil imageName:@"user2" acessoryType:1];
    GJNormalCellModel *model3 = [GJNormalCellModel cellModelTitle:@"推荐有礼" detail:nil imageName:@"user3" acessoryType:1];
    GJNormalCellModel *model4 = [GJNormalCellModel cellModelTitle:@"关于我们" detail:nil imageName:@"user4" acessoryType:1];
    model1.didSelectBlock = ^(NSIndexPath *indexPath) {
        GJInfoSettingsController *vc = [GJInfoSettingsController new];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    };
    model2.didSelectBlock = ^(NSIndexPath *indexPath) {
        [TKWebMedia commonWebViewJumpUrl:@"http://www.qzylcn.com/7/2" title:nil controller:self];
    };
    _models = @[model1, model2, model3, model4];
    _topCell = [[GJMineTopCell alloc] init];
}

- (void)initializationSubView {
    [self allowBackWithImage:@"setup"];
    [self.view addSubview:self.tableView];
    [self blockHanddle];
}

- (void)initializationNetWorking {
    _mineManager = [[GJMineManager alloc] init];
}

#pragma mark - Request Handle

#pragma mark - Private methods
- (void)blockHanddle {
    __weak typeof(self)weakSelf = self;
    _topCell.blockBindingPayClick = ^{
        GJBindingPayController *vc = [GJBindingPayController new];
        vc.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
}

#pragma mark - Public methods


#pragma mark - Event response
- (void)backAction {
    __weak typeof(self)weakSelf = self;
    GJAppSettingsController *vc = [GJAppSettingsController new];
    vc.hidesBottomBarWhenPushed = YES;
    vc.logouting = ^{
        weakSelf.applyVC = [GJApplyUserController new];
        weakSelf.applyVC.blockShowHome = ^(NSUInteger idx) {
            UIViewController *vc = weakSelf;
            while (vc.presentingViewController) {
                vc = vc.presentingViewController;
            }
            [vc dismissViewControllerAnimated:YES completion:nil];
        };
        [self presentViewController:weakSelf.applyVC animated:YES completion:nil];
    };
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else {
        return 1;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {GJMineTBVCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJMineTBVCell reuseIndentifier]];
    if (!cell) cell = [[GJMineTBVCell alloc] initWithStyle:[GJMineTBVCell expectingStyle] reuseIdentifier:[GJMineTBVCell reuseIndentifier]];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return _topCell;
        }else {
            cell.cellModel = _models[indexPath.row-1];
        }
        if (indexPath.row == 1) [cell showBottomLine];
    }else {
        cell.cellModel = _models[indexPath.section+1];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section== 0 && indexPath.row == 0) {
        return AdaptatSize(290);
    }else {
        return AdaptatSize(56);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = _tableView.backgroundColor;
    return v;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row > 0) {
        BLOCK_SAFE(_models[indexPath.row-1].didSelectBlock)(indexPath);
    }else {
        if (indexPath.section == 2) {
            GJAboutUSController *Vc = [GJAboutUSController new];
            Vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:Vc animated:YES];
        }
        if (indexPath.section == 1) {
            GJInviteHasGiftVC *Vc = [GJInviteHasGiftVC new];
            Vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:Vc animated:YES];
        }
    }
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithRGB:246 g:246 b:251];
        _tableView.bounces = NO;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
