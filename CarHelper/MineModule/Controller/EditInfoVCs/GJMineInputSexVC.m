//
//  GJMineInputSexVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/12/4.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineInputSexVC.h"
#import "GJMineInputNameVC.h"

@interface GJMineInputSexVC ()
@property (nonatomic, strong) UIButton *nanBtn;
@property (nonatomic, strong) UIButton *nvBtn;
@end

@implementation GJMineInputSexVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_nanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(AdaptatSize(105));
        make.top.equalTo(self.titleLB.mas_bottom).with.offset(AdaptatSize(45));
        make.right.equalTo(self.view.mas_centerX).with.offset(-AdaptatSize(30));
    }];
    [_nvBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.top.equalTo(self.nanBtn);
        make.left.equalTo(self.view.mas_centerX).with.offset(AdaptatSize(30));
    }];
    [self.remindLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.nanBtn.mas_bottom).with.offset(AdaptatSize(20));
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
    
}

- (void)initializationSubView {
    [self initUITitle:@"请选择您的性别" nextText:nil];
    [self addSubview:self.nanBtn];
    [self addSubview:self.nvBtn];
    [self addSubview:self.remindLB];
    self.remindLB.text = @"稍后您可以在我的资料中更改";
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)nextStepBtnClick {
    GJMineInputNameVC *vc = [[GJMineInputNameVC alloc] init];
    [vc pushPageWith:self];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (UIButton *)nanBtn {
    if (!_nanBtn) {
        _nanBtn = [[UIButton alloc] init];
        _nanBtn.layer.borderColor = APP_CONFIG.grayTextColor.CGColor;
        _nanBtn.layer.borderWidth = 1;
        _nanBtn.layer.cornerRadius = 5;
        _nanBtn.clipsToBounds = YES;
        [_nanBtn addTarget:self action:@selector(nextStepBtnClick) forControlEvents:UIControlEventTouchUpInside];
        UILabel *lb = [[UILabel alloc] init];
        lb.font = [APP_CONFIG appAdaptFontOfSize:17];
        lb.text = @"男";
        lb.textColor = APP_CONFIG.darkTextColor;
        [_nanBtn addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.nanBtn);
            make.bottom.equalTo(self.nanBtn).with.offset(-8);
        }];
        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_editinfo_nan"]];
        [_nanBtn addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.nanBtn);
            make.bottom.equalTo(self.nanBtn.mas_centerY);
        }];
    }
    return _nanBtn;
}

- (UIButton *)nvBtn {
    if (!_nvBtn) {
        _nvBtn = [[UIButton alloc] init];
        _nvBtn.layer.borderColor = APP_CONFIG.grayTextColor.CGColor;
        _nvBtn.layer.borderWidth = 1;
        _nvBtn.layer.cornerRadius = 5;
        _nvBtn.clipsToBounds = YES;
        [_nvBtn addTarget:self action:@selector(nextStepBtnClick) forControlEvents:UIControlEventTouchUpInside];
        UILabel *lb = [[UILabel alloc] init];
        lb.font = [APP_CONFIG appAdaptFontOfSize:17];
        lb.text = @"女";
        lb.textColor = APP_CONFIG.darkTextColor;
        [_nvBtn addSubview:lb];
        [lb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.nvBtn);
            make.bottom.equalTo(self.nvBtn).with.offset(-8);
        }];
        UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_editinfo_nv"]];
        [_nvBtn addSubview:imgV];
        [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.nvBtn);
            make.bottom.equalTo(self.nvBtn.mas_centerY);
        }];
    }
    return _nvBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
