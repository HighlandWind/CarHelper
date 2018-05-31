//
//  GJShopStatusController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/28.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJShopStatusController.h"
#import "GJHomeBottomView.h"

@interface GJShopStatusController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJHomeBottomView *bottomView;
@end

@implementation GJShopStatusController

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
- (void)initializationData {}

- (void)initializationSubView {
    self.title = @"营业状态";
    [self allowBack];
    [self showShadorOnNaviBar:YES];
    [self.view addSubview:self.bottomView];
    [self.view addSubview:self.tableView];
    [self blockHanddle];
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle


#pragma mark - Private methods
- (void)blockHanddle {
    _bottomView.bottomScanBtnBlock = ^{
        
    };
}

#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(56);
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        _tableView.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    }
    return _tableView;
}

- (GJHomeBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [GJHomeBottomView installWithText:@"提交" image:nil];
    }
    return _bottomView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
