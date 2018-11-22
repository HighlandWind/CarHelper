//
//  GJMineVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/6/12.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineVC.h"
#import "GJAppSettingVC.h"
#import "GJMineTopCell.h"
#import "GJMineTBVCell.h"
#import "GJNormalCellModel.h"
#import "GJMessageListVC.h"
#import "GJMineHistoryVC.h"
#import "GJMineOrderVC.h"
#import "GJMineCarListVC.h"
#import "GJMinePayWayVC.h"
#import "GJMineHelperVC.h"
#import "GJMineInfoVC.h"
#import "GJMineCouponVC.h"
#import "GJMineScoreVC.h"

@interface GJMineVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) NSArray <GJNormalCellModel *> *models;
@property (nonatomic, strong) GJMineTopCell *topCell;
@end

@implementation GJMineVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(-[UIApplication sharedApplication].statusBarFrame.size.height);
    }];
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
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    _topCell = [[GJMineTopCell alloc] init];
    
    GJNormalCellModel *model1 = [GJNormalCellModel cellModelTitle:@"轨迹" detail:@"" imageName:@"mine_list_history" acessoryType:UITableViewCellAccessoryDisclosureIndicator];
    GJNormalCellModel *model2 = [GJNormalCellModel cellModelTitle:@"订单" detail:@"" imageName:@"mine_list_order" acessoryType:UITableViewCellAccessoryDisclosureIndicator];
    GJNormalCellModel *model3 = [GJNormalCellModel cellModelTitle:@"我的车辆" detail:@"" imageName:@"mine_list_mycar" acessoryType:UITableViewCellAccessoryDisclosureIndicator];
    GJNormalCellModel *model4 = [GJNormalCellModel cellModelTitle:@"支付方式" detail:@"" imageName:@"mine_list_payway" acessoryType:UITableViewCellAccessoryDisclosureIndicator];
    GJNormalCellModel *model5 = [GJNormalCellModel cellModelTitle:@"帮助中心" detail:@"" imageName:@"mine_list_help" acessoryType:UITableViewCellAccessoryDisclosureIndicator];
    _models = @[model1, model2, model3, model4, model5];
    
    model1.didSelectBlock = ^(NSIndexPath *indexPath) {
        GJMineHistoryVC *vc = [[GJMineHistoryVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    };
    model2.didSelectBlock = ^(NSIndexPath *indexPath) {
        GJMineOrderVC *vc = [[GJMineOrderVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    };
    model3.didSelectBlock = ^(NSIndexPath *indexPath) {
        GJMineCarListVC *vc = [[GJMineCarListVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    };
    model4.didSelectBlock = ^(NSIndexPath *indexPath) {
        GJMinePayWayVC *vc = [[GJMinePayWayVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    };
    model5.didSelectBlock = ^(NSIndexPath *indexPath) {
//        GJMineHelperVC *vc = [[GJMineHelperVC alloc] init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
        [TKWebMedia commonWebViewJumpUrl:@"https://www.baidu.com/" title:@"帮助中心" controller:self];
    };
}

- (void)initializationSubView {
    self.title = @"我的";
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, AdaptatSize(60), 44)];
    UIButton *setupBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, AdaptatSize(30), 44)];
    [setupBtn setImage:[UIImage imageNamed:@"mine_setup"] forState:UIControlStateNormal];
    [setupBtn addTarget:self action:@selector(setupAction) forControlEvents:UIControlEventTouchUpInside];
    UIButton *msgBtn = [[UIButton alloc] initWithFrame:CGRectMake(AdaptatSize(30), 0, AdaptatSize(30), 44)];
    [msgBtn setImage:[UIImage imageNamed:@"mine_message"] forState:UIControlStateNormal];
    [msgBtn addTarget:self action:@selector(msgAction) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:setupBtn];
    [rightView addSubview:msgBtn];
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:rightView];
    self.navigationItem.rightBarButtonItem = right;
    
    [self.view addSubview:self.tableView];
    [self blockHanddle];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods
- (void)blockHanddle {
    __weak typeof(self)weakSelf = self;
    _topCell.blockClickInfo = ^{
        GJMineInfoVC *vc = [[GJMineInfoVC alloc] init];
//        vc.hidesBottomBarWhenPushed = YES;
//        [weakSelf.navigationController pushViewController:vc animated:YES];
        [weakSelf presentViewController:vc animated:YES completion:nil];
    };
    _topCell.blockClickScore = ^{
        GJMineScoreVC *vc = [[GJMineScoreVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    _topCell.blockClickCoupon = ^{
        GJMineCouponVC *vc = [[GJMineCouponVC alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
}

#pragma mark - Public methods


#pragma mark - Event response
- (void)setupAction {
    GJAppSettingVC *vc = [[GJAppSettingVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)msgAction {
    GJMessageListVC *vc = [[GJMessageListVC alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _models.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return _topCell;
    }else {
        GJMineTBVCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJMineTBVCell reuseIndentifier]];
        if (!cell) {
            cell = [[GJMineTBVCell alloc] initWithStyle:[GJMineTBVCell expectingStyle] reuseIdentifier:[GJMineTBVCell reuseIndentifier]];
            [cell settingShowSpeatLine:YES];
        }
        cell.textLabel.font = [APP_CONFIG appAdaptFontOfSize:15];
        cell.cellModel = _models[indexPath.row - 1];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return _topCell.height;
    }else {
        return AdaptatSize(54);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row != 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        BLOCK_SAFE(_models[indexPath.row - 1].didSelectBlock)(indexPath);
    }
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = APP_CONFIG.appBackgroundColor;
//        _tableView.bounces = NO;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
