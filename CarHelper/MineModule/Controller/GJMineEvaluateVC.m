//
//  GJMineEvaluateVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineEvaluateVC.h"
#import "GJMineEvaluateTopCell.h"
#import "GJMineEvaluateMidCell.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@interface GJMineEvaluateVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton *sendBtn;
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) NSArray <GJBaseTableViewCell *> *cells;
@end

@implementation GJMineEvaluateVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat btmOffset = 0;
    if (SCREEN_H >= kGJIphoneX) btmOffset = AdaptatSize(40);
    else btmOffset = AdaptatSize(20);
    [_sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(AdaptatSize(50));
        make.bottom.equalTo(self.view).with.offset(-btmOffset);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.bottom.equalTo(_sendBtn.mas_top);
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
    GJMineEvaluateTopCell *topCell = [[GJMineEvaluateTopCell alloc] init];
    GJMineEvaluateMidCell *midCell = [[GJMineEvaluateMidCell alloc] init];
    _cells = @[topCell, midCell];
}

- (void)initializationSubView {
    self.title = @"评价";
    [self.view addSubview:self.sendBtn];
    [self.view addSubview:self.tableView];
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    [self.view addGestureRecognizer:singleTap];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer {
    [self.view endEditing:YES];
}

- (void)sendBtnClick {
    
}

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
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = APP_CONFIG.appBackgroundColor;
    }
    return _tableView;
}

- (UIButton *)sendBtn {
    if (!_sendBtn) {
        _sendBtn = [[UIButton alloc] init];
        _sendBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:16];
        [_sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _sendBtn.backgroundColor = APP_CONFIG.appMainColor;
        _sendBtn.layer.cornerRadius = 5;
        _sendBtn.clipsToBounds = YES;
        [_sendBtn setTitle:@"发布" forState:UIControlStateNormal];
        [_sendBtn addTarget:self action:@selector(sendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
