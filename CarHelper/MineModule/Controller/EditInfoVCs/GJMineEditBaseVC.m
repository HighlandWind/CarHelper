//
//  GJMineEditBaseVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/11/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineEditBaseVC.h"
#import "AlertManager.h"

@interface GJMineEditBaseVC ()
@property (nonatomic, strong) UIView *btmLine;
@property (nonatomic, strong) UIButton *bottomBtn;
@end

@implementation GJMineEditBaseVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_nextStepBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view).with.offset(AdaptatSize(15));
        make.left.equalTo(self.view).with.offset(AdaptatSize(10));
        make.right.equalTo(self.view).with.offset(-AdaptatSize(10));
        make.height.mas_equalTo(AdaptatSize(30));
    }];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(NavBar_H + AdaptatSize(65));
    }];
    [_btmLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(1);
        if (IPHONE_X) {
            make.bottom.equalTo(self.view).with.offset(-AdaptatSize(89));
        }else {
            make.bottom.equalTo(self.view).with.offset(-AdaptatSize(49));
        }
    }];
    [_bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.btmLine).with.offset(5);
    }];
}

#pragma mark - Iniitalization methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self showNaviSingleLine];
    self.view.backgroundColor = APP_CONFIG.appBackgroundColor;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods
- (void)initUITitle:(NSString *)title nextText:(NSString *)text {
    self.titleLB.text = title;
    [self.view addSubview:self.titleLB];
    [self.view addSubview:self.btmLine];
    [self.view addSubview:self.bottomBtn];
    if (text) {
        [self.view addSubview:self.nextStepBtn];
        [self.nextStepBtn setTitle:text forState:UIControlStateNormal];
    }
    UIBarButtonItem * back = [[UIBarButtonItem alloc] initWithCustomView:[UIView new]];
    self.navigationItem.leftBarButtonItem = back;
}

#pragma mark - Event response
- (void)nextStepBtnClick {
    
}

- (void)dismiss {
    UIViewController *vc = self;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
}

- (void)bottomBtnClick {
    [AlertManager showActionSheetMessage:_bottomBtn.titleLabel.text titleArr:@[@"登录"] chooseIndex:^(NSInteger idx) {
        [self dismiss];
    }];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (UIButton *)nextStepBtn {
    if (!_nextStepBtn) {
        _nextStepBtn = [[UIButton alloc] init];
        _nextStepBtn.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:16];
        _nextStepBtn.layer.cornerRadius = 3;
        _nextStepBtn.clipsToBounds = YES;
        _nextStepBtn.backgroundColor = APP_CONFIG.appMainColor;
        [_nextStepBtn setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
        [_nextStepBtn addTarget:self action:@selector(nextStepBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextStepBtn;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [APP_CONFIG appAdaptFontOfSize:18];
        _titleLB.textColor = [UIColor colorWithRGB:112 g:144 b:253];
        [_titleLB sizeToFit];
    }
    return _titleLB;
}

- (UIView *)btmLine {
    if (!_btmLine) {
        _btmLine = [[UIView alloc] init];
        _btmLine.backgroundColor = APP_CONFIG.separatorLineColor;
    }
    return _btmLine;
}

- (UIButton *)bottomBtn {
    if (!_bottomBtn) {
        _bottomBtn = [[UIButton alloc] init];
        _bottomBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:14];
        [_bottomBtn setTitle:@"有账户了？" forState:UIControlStateNormal];
        [_bottomBtn setTitleColor:APP_CONFIG.appMainColor forState:UIControlStateNormal];
        [_bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomBtn;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = [APP_CONFIG appAdaptFontOfSize:17];
        _textField.textColor = APP_CONFIG.darkTextColor;
        _textField.placeholder = @"请输入...";
        [_textField setTintColor:APP_CONFIG.appMainColor];
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.layer.cornerRadius = 2;
        _textField.clipsToBounds = YES;
        _textField.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _textField;
}

- (UILabel *)remindLB {
    if (!_remindLB) {
        _remindLB = [[UILabel alloc] init];
        _remindLB.font = [APP_CONFIG appAdaptFontOfSize:13];
        _remindLB.textColor = APP_CONFIG.darkTextColor;
        [_remindLB sizeToFit];
    }
    return _remindLB;
}

- (CGFloat)topInputTFW {
    return AdaptatSize(280);
}

- (CGFloat)topInputTFH {
    return AdaptatSize(37);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
