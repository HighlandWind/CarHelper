//
//  GJApplyUserFormVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyUserFormVC.h"
#import "GJLoginNaviBar.h"
#import "GJApplyFormTitleView.h"
#import "GJApplyUserFormCell.h"
#import "GJApplyUserFormBottomCell.h"
#import "GJQRCodeController.h"
#import "GJAdressPickerController.h"
#import "GJCashDeskController.h"
#import "GJPartnerManager.h"
#import "GJLoginApi.h"

@interface GJApplyUserFormVC () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) GJLoginNaviBar *naviBar;
@property (nonatomic, strong) GJApplyFormTitleView *titleView;
@property (nonatomic, strong) GJApplyUserFormCell *recommandCell;
@property (nonatomic, strong) GJApplyUserFormCell *identifyCell;
@property (nonatomic, strong) GJApplyUserFormCell *cityCell;
@property (nonatomic, strong) GJApplyUserFormCell *districtCell;
@property (nonatomic, strong) GJApplyUserFormCell *phoneCell;
@property (nonatomic, strong) GJApplyUserFormCell *codeCell;
@property (nonatomic, strong) GJApplyUserFormBottomCell *btmCell;
@property (nonatomic, strong) NSMutableArray <GJBaseTableViewCell *> *cells;
@property (nonatomic, strong) NSArray *partnerTypes;

@property (nonatomic, strong) GJPartnerManager *partnerManager;
@property (nonatomic, strong) GJLoginApi *loginApi;
@property (strong, nonatomic) NSString *tempTelePhoneNum;
@property (nonatomic, strong)  NSString *oldTelPhone;
@property (nonatomic, assign)  BOOL hadGetPhoneCode;

@property (nonatomic, strong) GJAdressPickerController *pickerVC;
@property (nonatomic, assign) RegionTypes currentType;
@property (nonatomic, strong) Province *currProvince;
@property (nonatomic, strong) City *currCity;
@property (nonatomic, strong) District *currDistrict;
@end

@implementation GJApplyUserFormVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(_titleView.mas_bottom);
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
    _btmCell = [[GJApplyUserFormBottomCell alloc] init];
    _recommandCell = [GJApplyUserFormCell installTitle1:@"推荐人" title2:@"请输入手机号码" rightImg:@"scanCode" index:1];
    if (_isFromUpgrade) {
        _identifyCell = [GJApplyUserFormCell installTitle1:@"合伙身份" title2:_currentPartnerType rightImg:@"dropdown2" index:2];
    }else {
        _identifyCell = [GJApplyUserFormCell installTitle1:@"合伙身份" title2:_currentPartnerType rightImg:nil index:2];
    }
    _cityCell = [GJApplyUserFormCell installTitle1:@"合伙城市" title2:@"请选择城市" rightImg:@"dropdown2" index:3];
    _districtCell = [GJApplyUserFormCell installTitle1:@"合伙区县" title2:@"请选择区县" rightImg:@"dropdown2" index:4];
    _phoneCell = [GJApplyUserFormCell installTitle1:@"手机号码" title2:@"请输入手机号码" rightImg:nil index:5];
    _codeCell = [GJApplyUserFormCell installTitle1:@"验证码" title2:@"请输入验证码" rightImg:nil  index:6];
    
    _partnerTypes = @[@"初级合伙", @"区县合伙", @"城市合伙", @"天使投资"];
    
    _recommandCell.centerTF.delegate = self;
    _phoneCell.centerTF.delegate = self;
    _codeCell.centerTF.delegate = self;
    
    _cells = @[_recommandCell, _identifyCell, _cityCell, _districtCell, _phoneCell, _codeCell, _btmCell].mutableCopy;
    if (!_isFromUpgrade) {
        if ([self getCurrentType] == 2 || [self getCurrentType] == 5) {
            [_cells removeObject:_cityCell];
            [_cells removeObject:_districtCell];
        }
        if ([self getCurrentType] == 4) {
            [_cells removeObject:_districtCell];
        }
    }
    
    _partnerManager = [[GJPartnerManager alloc] init];
    _loginApi  =[[GJLoginApi alloc] init];
    _pickerVC = [[GJAdressPickerController alloc] init];
}

- (void)initializationSubView {
    [self.view addSubview:self.naviBar];
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.tableView];
    [self blockHanddle];
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle
- (void)requestVerifyCode {
    _tempTelePhoneNum = _phoneCell.centerTF.text;
    if (!_tempTelePhoneNum) return ;
    [_phoneCell.centerTF resignFirstResponder];
    [_codeCell.codeBtn showActive:YES];
    [self.loginApi loginGetSmsCode:_tempTelePhoneNum success:^(NSURLResponse *urlResponse, id response) {
        self.oldTelPhone = _tempTelePhoneNum;
        [_codeCell.codeBtn showActive:NO];
        ShowSucceedAlertHUD(@"验证码发送成功", self.view);
        _hadGetPhoneCode = YES;
        [_codeCell.centerTF becomeFirstResponder];
        if (!_codeCell.codeBtn.enabled) {
            return;
        }
        [_codeCell.codeBtn startEndTime];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [_codeCell.codeBtn showActive:NO];
        ShowWaringAlertHUD(error.localizedDescription, nil);
    }];
}

- (NSUInteger)getCurrentType {
    //（2：合伙人，3：区县合伙人，4：城市合伙人，5：天使合伙人）
    NSUInteger idxType = [_partnerTypes indexOfObject:_currentPartnerType] + 2;
    return idxType;
}

- (void)requestNextStep {
//    [[GJCashDeskController new] pushPageWith:self];return;
    NSString *recommandPhone = _recommandCell.centerTF.text;
    if (![recommandPhone isValidMobileNumber]) {
        ShowWaringAlertHUD(@"推荐人手机号不正确", nil);
        return;
    }
    NSString *cityID, *districtID;
    NSUInteger idxType = [self getCurrentType];
    if (idxType == 3 && !_currDistrict) {
        ShowWaringAlertHUD(@"请选择区县", nil);
        return;
    }
    if (idxType == 4 && !_currCity) {
        ShowWaringAlertHUD(@"请选择城市", nil);
        return;
    }
    if (idxType == 2 || idxType == 5) {
        cityID = nil;
        districtID = nil;
    }else {
        if (_currCity) cityID = _currCity.city_id;
        if (_currDistrict) districtID = _currDistrict.district_id;
    }
    
    if (_phoneCell.centerTF.text.length == 0) {
        ShowWaringAlertHUD(@"请输入您的手机号码", nil);
        return;
    }
//    if (!_hadGetPhoneCode) {
//        ShowWaringAlertHUD(@"请获取验证码", nil);
//        return;
//    }
    if (_codeCell.centerTF.text.length == 0) {
        ShowWaringAlertHUD(@"请输入验证码", nil);
        return;
    }
//    if (![_phoneCell.centerTF.text isEqualToString:_oldTelPhone]) {
//        ShowWaringAlertHUD(@"手机号和验证码不匹配", nil);
//        return;
//    }
    
    [self.view.loadingView startAnimation];
    [_partnerManager requestApplyPartnerUserPhone:_phoneCell.centerTF.text tjrPhone:recommandPhone group_id:idxType city_id:cityID district_id:districtID code:_codeCell.centerTF.text success:^(GJApplyPartnerData *data) {
        [self.view.loadingView stopAnimation];
        GJCashDeskController *cash = [GJCashDeskController new];
        cash.applyData = data;
        cash.blockApplySuccessToLogin = ^{
            [self applySuccessToLogin];
        };
        [cash pushPageWith:self];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        ShowWaringAlertHUD(error.localizedDescription, nil);
        [self.view.loadingView stopAnimation];
    }];
}

#pragma mark - Private methods
- (void)applySuccessToLogin {
    UIViewController *vc = self;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
    BLOCK_SAFE(_blockApplySuccessShowHome)();
}

- (void)blockHanddle {
    __weak typeof(self)weakSelf = self;
    _recommandCell.blockBtnClick = ^{
        GJQRCodeController *vc = [GJQRCodeController new];
        [vc pushPageWith:weakSelf];
    };
    if (_isFromUpgrade) {
        _identifyCell.blockBtnClick = ^{
            weakSelf.pickerVC.regionType = _currentType = RegionApplyUser;
            [weakSelf.pickerVC presentSelf:weakSelf];
        };
    }
    _cityCell.blockBtnClick = ^{
        weakSelf.pickerVC.regionType = _currentType = RegionCity;
        [weakSelf.pickerVC presentSelf:weakSelf];
    };
    _districtCell.blockBtnClick = ^{
        if (!weakSelf.currCity) {
            ShowWaringAlertHUD(@"请选择城市", nil);
            return;
        }
        weakSelf.pickerVC.regionType = _currentType = RegionDistrict;
        [weakSelf.pickerVC presentSelf:weakSelf];
    };
    _codeCell.blockBtnClick = ^{
        [weakSelf requestVerifyCode];
    };
    _btmCell.blockBtmBtnClick = ^{
        [weakSelf requestNextStep];
    };
    _btmCell.blockProtocolBtnClick = ^{
        
    };
    
    _pickerVC.selectRow = ^(NSInteger row) {
        // 选择合伙身份
        if (weakSelf.isFromUpgrade && _currentType == RegionApplyUser) {
            weakSelf.currentPartnerType = weakSelf.partnerTypes[row];
            [weakSelf.identifyCell setSelectTitle:weakSelf.currentPartnerType];
        }
        
        if (_currentType == RegionCity) {
            if (!weakSelf.currProvince) {
                [APP_USER.regionData.data enumerateObjectsUsingBlock:^(Province * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    if ([obj.province_id isEqualToString:@"2"]) {
                        _currProvince = APP_USER.regionData.data[idx];
                    }
                }];
            }
            _currCity = _currProvince.city[row];
            [weakSelf.cityCell setSelectTitle:weakSelf.currCity.city_name];
            weakSelf.pickerVC.currCity = weakSelf.currCity;
        }
        if (_currentType == RegionDistrict) {
            _currDistrict = _currCity.district[row];
            [weakSelf.districtCell setSelectTitle:weakSelf.currDistrict.district_name];
        }
    };
}

#pragma mark - Public methods
- (void)presentSelfID:(NSString *)identifier context:(UIViewController *)context {
    self.currentPartnerType = identifier;
    [context presentViewController:self animated:YES completion:nil];
}

#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cells.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cells[indexPath.section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cells[indexPath.section].height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = [UIColor whiteColor];
    return v;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL ret = YES;
    NSString *textStr = [textField.text changeCharactersInRange:range replacementString:string];
    if (textStr.length > 11) {
        ret = NO;
        ShowWaringAlertHUD(@"长度超出范围", nil);
    }
    if (textField == _phoneCell.centerTF) {
        if ([textStr isValidMobileNumber]) {
            _codeCell.codeBtn.enabled = YES;
        }else {
            _codeCell.codeBtn.enabled = NO;
        }
    }
    return ret;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    if (textField == _phoneCell.centerTF) {
        _codeCell.codeBtn.enabled = NO;
    }
    return YES;
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (GJLoginNaviBar *)naviBar {
    if (!_naviBar) {
        _naviBar = [GJLoginNaviBar install];
        __weak typeof(self)weakSelf = self;
        _naviBar.backClickBlock = ^{
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        };
    }
    return _naviBar;
}

- (GJApplyFormTitleView *)titleView {
    if (!_titleView) {
        _titleView = [GJApplyFormTitleView installTitle:@"申请合伙人" detail:@"请确定您申请的合伙身份，注册属于您的账号"];
    }
    return _titleView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
