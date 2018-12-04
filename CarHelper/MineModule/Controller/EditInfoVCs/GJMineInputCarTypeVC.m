//
//  GJMineInputCarTypeVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/12/4.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineInputCarTypeVC.h"
#import "GJMineInputCarNumVC.h"

@interface GJMineInputCarTypeVC ()

@end

@implementation GJMineInputCarTypeVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.titleLB.mas_bottom).with.offset(AdaptatSize(10));
        make.width.mas_equalTo(self.topInputTFW);
        make.height.mas_equalTo(self.topInputTFH);
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
    [self initUITitle:@"请输入您的车牌型号" nextText:@"继续"];
    [self addSubview:self.textField];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)nextStepBtnClick {
    GJMineInputCarNumVC *vc = [[GJMineInputCarNumVC alloc] init];
    [vc pushPageWith:self];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
