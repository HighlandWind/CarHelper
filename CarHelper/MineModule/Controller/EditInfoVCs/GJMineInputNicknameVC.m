//
//  GJMineInputNicknameVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/12/4.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineInputNicknameVC.h"
#import "GJMineInputBirthdayVC.h"

@interface GJMineInputNicknameVC ()

@end

@implementation GJMineInputNicknameVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.titleLB.mas_bottom).with.offset(AdaptatSize(10));
        make.width.mas_equalTo(self.topInputTFW);
        make.height.mas_equalTo(self.topInputTFH);
    }];
    [self.remindLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.textField.mas_bottom).with.offset(AdaptatSize(10));
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
    [self initUITitle:@"请输入您的昵称" nextText:@"继续"];
    [self addSubview:self.textField];
    [self addSubview:self.remindLB];
    self.remindLB.text = @"您在本系统中展示的名称";
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)nextStepBtnClick {
    GJMineInputBirthdayVC *vc = [[GJMineInputBirthdayVC alloc] init];
    [vc pushPageWith:self];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
