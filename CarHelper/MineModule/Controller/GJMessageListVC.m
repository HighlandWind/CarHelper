//
//  GJMessageListVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/16.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMessageListVC.h"
#import "GJMineMsgCell.h"
#import "GJNotificationMsgVC.h"
#import "GJMessageChatVC.h"

@interface GJMessageListVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, assign) BOOL isOpenNotification;
@property (nonatomic, strong) NSString *appName;
@end

@implementation GJMessageListVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
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
    _isOpenNotification = [self isMessageNotificationServiceOpen];
    _appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

- (void)initializationSubView {
    self.title = @"消息";
    [self.view addSubview:self.tableView];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods
- (BOOL)isMessageNotificationServiceOpen {
    BOOL isOpen = NO;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_8_0
    UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
    if (setting.types != UIUserNotificationTypeNone) {
        isOpen = YES;
    }
#else
    UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    if (type != UIRemoteNotificationTypeNone) {
        isOpen = YES;
    }
#endif
    return isOpen;
}

#pragma mark - Event response
- (void)closeBtnClick {
    _isOpenNotification = YES;
    [_tableView reloadData];
}

#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJMineMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJMineMsgCell reuseIndentifier]];
    if (!cell) {
        cell = [[GJMineMsgCell alloc] initWithStyle:[GJMineMsgCell expectingStyle] reuseIdentifier:[GJMineMsgCell reuseIndentifier]];
    }
    if (indexPath.row == 0) {
        cell.portraitImgV.image = [UIImage imageNamed:@"mine_msg_noti_portrait"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        GJNotificationMsgVC *vc = [[GJNotificationMsgVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        GJMessageChatVC *vc = [[GJMessageChatVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(115);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (_isOpenNotification) {
        return 0;
    }else {
        return AdaptatSize(30);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (_isOpenNotification) {
        return nil;
    }else {
        CGFloat btnW = AdaptatSize(20);
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = APP_CONFIG.appBackgroundColor;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_W-15-btnW, AdaptatSize(30))];
        label.font = [APP_CONFIG appAdaptFontOfSize:10];
        label.text = [NSString stringWithFormat:@"您现在无法接收到新消息通知，请到系统“设置”-“通知”-“%@”中开启", _appName];
        label.textColor = APP_CONFIG.darkTextColor;
        UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_W-btnW-10, AdaptatSize(5), btnW, btnW)];
        [closeBtn setImage:[UIImage imageNamed:@"mine_payway_gray_close"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:label];
        [view addSubview:closeBtn];
        return view;
    }
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
