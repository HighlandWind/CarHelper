//
//  GJBindingInputVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBindingInputVC.h"
#import "GJMineManager.h"

#define Tag_InputField  2345

@interface GJBindingInputVC () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong) UITableView *tableview;
@property (nonatomic, strong) GJMineManager *mineManager;
@end

@implementation GJBindingInputVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableview.frame = CGRectMake(0, 0, self.view.width, self.view.height-49);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showShadorOnNaviBar:YES];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    
}

- (void)initializationSubView {
    [self allowBack];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarBtnClick)];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14], NSFontAttributeName, APP_CONFIG.appMainColor,NSForegroundColorAttributeName, nil];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState:UIControlStateHighlighted];
    
    [self.view addSubview:self.tableview];
}

- (void)initializationNetWorking {
    _mineManager = [[GJMineManager alloc] init];
}

#pragma mark - Request Handle
- (void)requestModify:(NSString *)name {
    NSString *alipay, *wechat;
    if (_type) {
        wechat = name;
    }else {
        alipay = name;
    }
    [self.view.loadingView startAnimation];
    [_mineManager requestBindingPayAccount:alipay wxzh:wechat success:^{
        [self.view.loadingView stopAnimation];
        ShowSucceedAlertHUD(@"修改成功", nil);
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
        ShowWaringAlertHUD(error.localizedDescription, nil);
    }];
}

#pragma mark - Private methods


#pragma mark - Event response
- (void)rightBarBtnClick {
    @try {
        UITextField *tf = (UITextField *)[self.view viewWithTag:Tag_InputField];
        [tf resignFirstResponder];
        if (tf.text.length == 0) {
            ShowWaringAlertHUD(@"请输入账号", nil);
        }else {
            [self requestModify:tf.text];
        }
    } @catch (NSException *exception) {}
}

#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"tableview";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        UITextField *nickNameTF = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, SCREEN_W-30, 44)];
        nickNameTF.delegate = self;
        nickNameTF.backgroundColor = APP_CONFIG.whiteGrayColor;
        nickNameTF.font = AdapFont([APP_CONFIG appFontOfSize:14]);
        nickNameTF.placeholder = @"未填写";
        nickNameTF.tag = Tag_InputField;
        nickNameTF.text= _placeHolder;
        nickNameTF.tintColor= [UIColor blueColor];
        nickNameTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        nickNameTF.returnKeyType = UIReturnKeyDone;
        nickNameTF.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
        [nickNameTF becomeFirstResponder];
        [nickNameTF setValue:[APP_CONFIG appFontOfSize:14] forKeyPath:@"_placeholderLabel.font"];
        [nickNameTF setValue:[UIColor colorWithHexRGB:@"#aaaaaa"] forKeyPath:@"_placeholderLabel.textColor"];
        [cell.contentView addSubview:nickNameTF];
    }
    return cell;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    NSString *textStr = [textField.text changeCharactersInRange:range replacementString:string];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (UITableView *)tableview {
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.scrollEnabled = NO;
        _tableview.backgroundColor = APP_CONFIG.appBackgroundColor;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.sectionHeaderHeight = 0.1f;
        _tableview.sectionFooterHeight = 0.1f;
        _tableview.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    }
    return _tableview;
}

@end
