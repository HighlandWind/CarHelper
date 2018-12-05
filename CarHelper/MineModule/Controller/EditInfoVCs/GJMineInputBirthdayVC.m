//
//  GJMineInputBirthdayVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/12/4.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineInputBirthdayVC.h"
#import "GJMineInputSexVC.h"

@interface GJMineInputBirthdayVC ()
@property (nonatomic, strong) UIButton *birthdayBtn;
@end

@implementation GJMineInputBirthdayVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_birthdayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.titleLB.mas_bottom).with.offset(AdaptatSize(10));
        make.width.mas_equalTo(self.topInputTFW);
        make.height.mas_equalTo(self.topInputTFH);
    }];
    [self.remindLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.birthdayBtn.mas_bottom).with.offset(AdaptatSize(10));
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
    [self initUITitle:@"请输入您的生日" nextText:@"继续"];
    [self addSubview:self.birthdayBtn];
    [self addSubview:self.remindLB];
    self.remindLB.text = @"有助于提供适合您的服务体验";
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)nextStepBtnClick {
    GJMineInputSexVC *vc = [[GJMineInputSexVC alloc] init];
    [vc pushPageWith:self];
}

- (void)birthdayBtnClick {
    
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (UIButton *)birthdayBtn {
    if (!_birthdayBtn) {
        _birthdayBtn = [[UIButton alloc] init];
        _birthdayBtn.titleLabel.font = [APP_CONFIG appAdaptFontOfSize:15];
        _birthdayBtn.layer.cornerRadius = 2;
        _birthdayBtn.clipsToBounds = YES;
        _birthdayBtn.backgroundColor = [UIColor whiteColor];
        [_birthdayBtn addTarget:self action:@selector(birthdayBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _birthdayBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
