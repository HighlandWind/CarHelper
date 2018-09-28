//
//  GJWashCarSearchVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarSearchVC.h"
#import "GJWashCarSearchTBVCell.h"
#import "GJNormalNaviView.h"
#import "GJWashCarSearchTBVHeader.h"

@interface GJWashCarSearchVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJNormalNaviView *naviView;
@property (nonatomic, strong) GJWashCarSearchTBVHeader *header;
@property (nonatomic, strong) UIButton *clearBtn;
@end

@implementation GJWashCarSearchVC

#pragma mark - View controller life circle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(_naviView.mas_bottom);
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
    _header = [[GJWashCarSearchTBVHeader alloc] init];
}

- (void)initializationSubView {
    self.title = @"洗车";
    [self.view addSubview:self.naviView];
    [self.view addSubview:self.tableView];
    [self blockHanddle];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods
- (void)blockHanddle {
    __weak typeof(self)weakself = self;
    _naviView.blockBackClick = ^{
        [weakself dismissViewControllerAnimated:YES completion:nil];
    };
}

#pragma mark - Public methods


#pragma mark - Event response
- (void)clearBtnClick {
    
}

#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJWashCarSearchTBVCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJWashCarSearchTBVCell reuseIndentifier]];
    if (!cell) {
        cell = [[GJWashCarSearchTBVCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[GJWashCarSearchTBVCell reuseIndentifier]];
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return _header;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.clearBtn;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return AdaptatSize(50);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return AdaptatSize(50);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return AdaptatSize(50);
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _tableView;
}

- (GJNormalNaviView *)naviView {
    if (!_naviView) {
        _naviView = [GJNormalNaviView installTitle:@"洗车"];
    }
    return _naviView;
}

- (UIButton *)clearBtn {
    if (!_clearBtn) {
        _clearBtn = [[UIButton alloc] init];
        _clearBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:12];
        [_clearBtn setTitle:@"清除历史记录" forState:UIControlStateNormal];
        [_clearBtn setTitleColor:APP_CONFIG.grayTextColor forState:UIControlStateNormal];
        [_clearBtn addTarget:self action:@selector(clearBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clearBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
