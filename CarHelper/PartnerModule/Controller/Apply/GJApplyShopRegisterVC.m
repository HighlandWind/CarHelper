//
//  GJApplyShopRegisterVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyShopRegisterVC.h"
#import "GJLoginNaviBar.h"
#import "GJApplyFormTitleView.h"
#import "GJApplyShopFormCell.h"
#import "GJApplyShopFormBtmCell.h"
#import "GJCashDeskController.h"
#import "AlertManager.h"
#import "SGImagePickerController.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "GJPickerController.h"
#import "GJApplyShopRegisterData.h"
#import "GJPartnerManager.h"

@interface GJApplyShopRegisterVC () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, GJPickerViewDelegate>
@property (nonatomic, strong) GJLoginNaviBar *naviBar;
@property (nonatomic, strong) GJApplyFormTitleView *titleView;
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) UIButton *bottomBtn;
@property (nonatomic, strong) GJPartnerManager *partnerManager;
@property (nonatomic, strong) UIImagePickerController *pickerCamera;
@property (nonatomic, strong) NSMutableArray *readyToUploadImagesThumbnails;
@property (nonatomic, strong) NSMutableArray *readyToUploadImages;
@property (nonatomic, strong) GJPickerController *pickerVC;
@property (nonatomic, strong) GJPickerController *pickerVC2;
@property (nonatomic, assign) NSInteger currentPicker; // 1地址，2类型

@property (nonatomic, strong) Province *currProvince;
@property (nonatomic, strong) City *currCity;
@property (nonatomic, strong) District *currDistrict;
@property (nonatomic, strong) GJApplyShopRegisterDataType *typeLeft;
@property (nonatomic, strong) GJApplyShopRegisterDataTypeList *typeRight;

@property (nonatomic, strong) GJApplyShopFormCell *nameCell;
@property (nonatomic, strong) GJApplyShopFormCell *addressCell;
@property (nonatomic, strong) GJApplyShopFormCell *detailCell;
@property (nonatomic, strong) GJApplyShopFormCell *typeCell;
@property (nonatomic, strong) GJApplyShopFormCell *timeCell;
@property (nonatomic, strong) GJApplyShopFormCell *identifyCell;
@property (nonatomic, strong) GJApplyShopFormCell *phonCell;
@property (nonatomic, strong) GJApplyShopFormBtmCell *btmCell;
@property (nonatomic, strong) NSArray <GJBaseTableViewCell *> *cells;
@end

@implementation GJApplyShopRegisterVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(AdaptatSize(49));
        make.left.equalTo(self.view).with.offset(10);
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_naviBar.mas_bottom);
        make.bottom.equalTo(_bottomBtn.mas_top).with.offset(-10);
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
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    _nameCell = [GJApplyShopFormCell installTitle1:@"店铺名称" title2:@"请输入店铺名称" rightImg:nil index:1];
    _nameCell.centerTF.keyboardType = UIKeyboardTypeDefault;
    _addressCell = [GJApplyShopFormCell installTitle1:@"店铺地址" title2:@"请选择店铺地址" rightImg:@"nextstep1" index:2];
    _detailCell = [GJApplyShopFormCell installTitle1:@"详细地址" title2:@"请填写店铺详细地址" rightImg:nil index:3];
    _detailCell.centerTF.keyboardType = UIKeyboardTypeDefault;
    _typeCell = [GJApplyShopFormCell installTitle1:@"行业类型" title2:@"请选择行业类型" rightImg:@"nextstep1" index:4];
    _timeCell = [GJApplyShopFormCell installTitle1:@"营业时间" title2:@"请填写营业时间" rightImg:nil index:5];
    _timeCell.centerTF.keyboardType = UIKeyboardTypeDefault;
    _identifyCell = [GJApplyShopFormCell installTitle1:@"营业执照" title2:@"营业执照编号或组织机构代码证号" rightImg:nil index:6];
    _identifyCell.centerTF.keyboardType = UIKeyboardTypeDefault;
    _phonCell = [GJApplyShopFormCell installTitle1:@"联系电话" title2:@"请填写店铺联系人电话号码" rightImg:nil index:7];
    _btmCell = [[GJApplyShopFormBtmCell alloc] init];
    
    _nameCell.centerTF.delegate = self;
    _identifyCell.centerTF.delegate = self;
    _phonCell.centerTF.delegate = self;
    
    _cells = @[_nameCell, _addressCell, _detailCell, _typeCell, _timeCell, _identifyCell, _phonCell, _btmCell];
    _readyToUploadImages = @[].mutableCopy;
    _readyToUploadImagesThumbnails = @[].mutableCopy;
    _partnerManager = [[GJPartnerManager alloc] init];
}

- (void)initializationSubView {
    [self.view addSubview:self.naviBar];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomBtn];
    [self performSelectorInBackground:@selector(initImagePicker) withObject:nil];
    [self blockHanddle];
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle

#pragma mark - Private methods
- (void)blockReloadCol2:(NSInteger)row {
    if (_currentPicker == 1) {
        NSArray *adress_2 = [APP_USER getCityInProvince:APP_USER.regionData.data[row]];
        _pickerVC.pickerView.datas_col2 = adress_2;
        _pickerVC.pickerView.datas_col3 = [APP_USER getDistrictInCity:APP_USER.regionData.data[row].city[0]];
    }
    if (_currentPicker == 2) {
        NSMutableArray *type_2 = @[].mutableCopy;
        [_data.dp_type[row].dp_ejlb enumerateObjectsUsingBlock:^(GJApplyShopRegisterDataTypeList * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [type_2 addObject:obj.dp_ejlb_name];
        }];
        _pickerVC2.pickerView.datas_col2 = type_2;
    }
}

- (void)blockReloadCol3:(NSInteger)row {
    NSArray *adress_3 = [APP_USER getDistrictInCity:APP_USER.regionData.data[_pickerVC.pickerView.selectRowAtCol1].city[row]];
    _pickerVC.pickerView.datas_col3 = adress_3;
}

- (void)blockHanddle {
    __weak typeof(self)weakSelf = self;
    _pickerVC = [[GJPickerController alloc] init];
    _pickerVC.pickerView.myDelegate = self;
    _pickerVC2 = [[GJPickerController alloc] init];
    _pickerVC2.pickerView.myDelegate = self;
    
    //////// 地址 cell
    NSArray *adress_1 = [APP_USER getProvinces];
    NSArray *adress_2 = [APP_USER getCityInProvince:APP_USER.regionData.data[0]];
    NSArray *adress_3 = [APP_USER getDistrictInCity:APP_USER.regionData.data[0].city[0]];
    _addressCell.blockBtnClick = ^{
        _currentPicker = 1;
        [weakSelf.pickerVC presentSelf:weakSelf columns:3];
        weakSelf.pickerVC.pickerView.datas_col1 = adress_1;
        weakSelf.pickerVC.pickerView.datas_col2 = adress_2;
        weakSelf.pickerVC.pickerView.datas_col3 = adress_3;
    };
    _pickerVC.selectRowAt = ^(NSInteger col1, NSInteger col2, NSInteger col3) {
        _currProvince = APP_USER.regionData.data[col1];
        _currCity = APP_USER.regionData.data[col1].city[col2];
        _currDistrict = APP_USER.regionData.data[col1].city[col2].district[col3];
        [weakSelf.addressCell setSelectTitle:[NSString stringWithFormat:@"%@ %@ %@", weakSelf.currProvince.province_name, weakSelf.currCity.city_name, weakSelf.currDistrict.district_name]];
    };
    
    //////// 类型 cell
    NSMutableArray *type_1 = @[].mutableCopy;
    [_data.dp_type enumerateObjectsUsingBlock:^(GJApplyShopRegisterDataType * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [type_1 addObject:obj.cat_name];
    }];
    NSMutableArray *type_2 = @[].mutableCopy;
    [_data.dp_type[_pickerVC.pickerView.selectRowAtCol1].dp_ejlb enumerateObjectsUsingBlock:^(GJApplyShopRegisterDataTypeList * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [type_2 addObject:obj.dp_ejlb_name];
    }];
    _typeCell.blockBtnClick = ^{
        _currentPicker = 2;
        [weakSelf.pickerVC2 presentSelf:weakSelf columns:2];
        weakSelf.pickerVC2.pickerView.datas_col1 = type_1;
        weakSelf.pickerVC2.pickerView.datas_col2 = type_2;
    };
    _pickerVC2.selectRowAt = ^(NSInteger col1, NSInteger col2, NSInteger col3) {
        if (type_1.count == 0) return ;
        NSMutableString *left = [[NSMutableString alloc] initWithString:type_1[col1]];
        NSString *right = weakSelf.data.dp_type[col1].dp_ejlb[col2].dp_ejlb_name;
        [left appendString:JudgeContainerCountIsNull(right)?@"":[NSString stringWithFormat:@" · %@", right]];
        [weakSelf.typeCell setSelectTitle:left];
        _typeLeft = _data.dp_type[col1];
        _typeRight = weakSelf.data.dp_type[col1].dp_ejlb[col2];
    };
    
    //////// 底部 cell
    _btmCell.context = self;
    _btmCell.blockCamera = ^{
        [weakSelf takeAPhotoFromCamera];
    };
    _btmCell.blockAlbum = ^{
        [weakSelf takeAPhotoFromAlbum];
    };
    _btmCell.blockDeleteBtnClick = ^(NSUInteger index) {
        [weakSelf.readyToUploadImagesThumbnails removeObjectAtIndex:index];
        [weakSelf.readyToUploadImages removeObjectAtIndex:index];
        [weakSelf judgeUploadLimitAndRefresh];
    };
    _btmCell.blockImageViewTap = ^(NSUInteger index, UIImageView *view) {
//        [weakself scanReadyUploadImages:index];
    };
}

- (void)judgeUploadLimitAndRefresh {
    if (_readyToUploadImagesThumbnails.count > MAX_UPLOAD_IMAGES) {
        _readyToUploadImagesThumbnails = [_readyToUploadImagesThumbnails subarrayWithRange:NSMakeRange(0, MAX_UPLOAD_IMAGES)].mutableCopy;
        ShowWaringAlertHUD([NSString stringWithFormat:@"最多上传%d张图片", MAX_UPLOAD_IMAGES], nil);
    }
    _btmCell.imagesArr = _readyToUploadImagesThumbnails;
    [self scrollViewToBottom:NO];
}

- (void)initImagePicker {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.pickerCamera = [[UIImagePickerController alloc] init];
        self.pickerCamera.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.pickerCamera.delegate = self;
        self.pickerCamera.allowsEditing = NO;
    }
}

- (void)scrollViewToBottom:(BOOL)animated {
    if (self.tableView.contentSize.height > self.tableView.frame.size.height) {
        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
        [self.tableView setContentOffset:offset animated:animated];
    }
}

#pragma mark - Public methods
- (void)applySuccessToLogin {
    UIViewController *vc = self;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
    BLOCK_SAFE(_blockApplySuccessShowHome)();
}

- (void)takeAPhotoFromCamera {
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus == ALAuthorizationStatusDenied||authStatus == ALAuthorizationStatusRestricted) {
            [AlertManager showAlertTitle:@"提示" content:@"请前往设置->隐私->相机授权应用拍照权限" viecontroller:self cancel:@"取消" sure:@"确定" cancelHandle:nil sureHandle:^{
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }];
        }else {
            if (self.pickerCamera){
                [self presentViewController:self.pickerCamera animated:YES completion:nil];
            }
        }
    }
}

- (void)takeAPhotoFromAlbum {
    __weak typeof(self)weakself = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
        if (author == ALAuthorizationStatusRestricted || author ==ALAuthorizationStatusDenied){
            [AlertManager showAlertTitle:@"提示" content:@"请前往设置->隐私->照片授权应用相册权限" viecontroller:self cancel:@"取消" sure:@"确定" cancelHandle:nil sureHandle:^{
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
            }];
        }else {
            SGImagePickerController *pickerAlbum = [[SGImagePickerController alloc] init];
            pickerAlbum.maxCount = MAX_UPLOAD_IMAGES;
            // Thumbnails
            [pickerAlbum setDidFinishSelectThumbnails:^(NSArray *thumbnails) {
                [weakself.readyToUploadImagesThumbnails addObjectsFromArray:thumbnails];
                [weakself judgeUploadLimitAndRefresh];
            }];
            // Original images
            [pickerAlbum setDidFinishSelectImages:^(NSArray *images) {
                [weakself.readyToUploadImages addObjectsFromArray:images];
                if (_readyToUploadImages.count > MAX_UPLOAD_IMAGES) {
                    _readyToUploadImages = [_readyToUploadImages subarrayWithRange:NSMakeRange(0, MAX_UPLOAD_IMAGES)].mutableCopy;
                }
            }];
            [self presentViewController:pickerAlbum animated:YES completion:nil];
        }
    }
}

#pragma mark - Event response
- (void)bottomBtnClick {
    NSString *store = _nameCell.centerTF.text;
    NSString *detail = _detailCell.centerTF.text;
    NSString *time = _timeCell.centerTF.text;
    NSString *indentifier = _identifyCell.centerTF.text;
    NSString *phone = _phonCell.centerTF.text;
    if (JudgeContainerCountIsNull(store)) {
        ShowWaringAlertHUD(@"请输入店铺名称", nil);
        return;
    }
    if (!_currProvince) {
        ShowWaringAlertHUD(@"请选择地址", nil);
        return;
    }
    if (JudgeContainerCountIsNull(detail)) {
        ShowWaringAlertHUD(@"请输入详细地址", nil);
        return;
    }
    if (!_typeLeft) {
        ShowWaringAlertHUD(@"请选择行业类型", nil);
        return;
    }
    if (JudgeContainerCountIsNull(time)) {
        ShowWaringAlertHUD(@"请输入营业时间", nil);
        return;
    }
    if (JudgeContainerCountIsNull(indentifier)) {
        ShowWaringAlertHUD(@"请输入营业执照", nil);
        return;
    }
    if (JudgeContainerCountIsNull(phone)) {
        ShowWaringAlertHUD(@"请输入联系电话", nil);
        return;
    }
    if (![phone isValidMobileNumber]) {
        ShowWaringAlertHUD(@"请输入正确的电话号码", nil);
        return;
    }
    
    NSString *categoryID;
    if (_typeLeft) {
        categoryID = _typeLeft.catid;
    }else if (_typeRight) {
        categoryID = _typeRight.dp_ejlb_id;
    }else {
        categoryID = @" ";
    }
    [self.view.loadingView startAnimation];
    [_partnerManager requestApplyShopWithImages:self.readyToUploadImages tjrPhone:_data.tjr_phone phone:_data.phone uid:_data.uid supplier_name:store province:_currProvince.province_id city:_currCity.city_id district:_currDistrict.district_id streetID:nil address:detail catid:categoryID shop_hours:time zhizhao:indentifier tel:phone success:^(GJApplyPartnerData *applyShopData) {
        [self.view.loadingView stopAnimation];
        GJCashDeskController *cash = [GJCashDeskController new];
        cash.type = 1;
        cash.applyData = applyShopData;
        cash.blockApplySuccessToLogin = ^{
            [self applySuccessToLogin];
        };
        [cash pushPageWith:self];
    } failure:^(NSURLResponse *urlResponse, NSError *error) {
        [self.view.loadingView stopAnimation];
        ShowWaringAlertHUD(error.localizedDescription, self.view);
    }];
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
    if (section == 0) {
        return self.titleView.height;
    }
    return 10.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return self.titleView;
    }
    UIView *v = [[UIView alloc] init];
    v.backgroundColor = [UIColor whiteColor];
    return v;
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL ret = YES;
    NSString *textStr = [textField.text changeCharactersInRange:range replacementString:string];
    if (textField == _phonCell.centerTF && textStr.length > 11) {
        ret = NO;
        ShowWaringAlertHUD(@"长度超出范围", nil);
    }
    return ret;
}

#pragma mark - Getter/Setter
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
        _titleView = [GJApplyFormTitleView installTitle:@"完善资质" detail:@"基本信息"];
        _titleView.backgroundColor = [UIColor whiteColor];
    }
    return _titleView;
}

- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped controller:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (UIButton *)bottomBtn {
    if (!_bottomBtn) {
        _bottomBtn = [[UIButton alloc] init];
        _bottomBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:15]);
        [_bottomBtn setTitle: @"下一步" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_bottomBtn setBackgroundColor:APP_CONFIG.appMainColor];
        [_bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}

@end
