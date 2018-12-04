//
//  GJMineInputPhoneVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/11/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineInputPhoneVC.h"
#import "GJMineInputCarTypeVC.h"

@interface GJMineInputPhoneVC ()
@property (nonatomic, strong) UITextField *codeTF;
@end

@implementation GJMineInputPhoneVC

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
    [self initUITitle:@"请输入您的手机号码" nextText:@"继续"];
    [self addSubview:self.textField];
    self.textField.keyboardType = UIKeyboardTypeNumberPad;
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)nextStepBtnClick {
    GJMineInputCarTypeVC *vc = [[GJMineInputCarTypeVC alloc] init];
    [vc pushPageWith:self];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
