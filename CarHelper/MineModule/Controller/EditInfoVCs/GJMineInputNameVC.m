//
//  GJMineInputNameVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/11/29.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineInputNameVC.h"

@interface GJMineInputNameVC ()
@property (nonatomic, strong) UITextField *secondTF;
@end

@implementation GJMineInputNameVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_centerX).with.offset(-AdaptatSize(10));
        make.top.equalTo(self.titleLB.mas_bottom).with.offset(AdaptatSize(10));
        make.width.mas_equalTo(self.topInputTFW * 0.58);
        make.height.mas_equalTo(self.topInputTFH);
    }];
    [_secondTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.top.equalTo(self.textField);
        make.left.equalTo(self.view.mas_centerX).with.offset(AdaptatSize(10));
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
    [self initUITitle:@"请输入您的姓名" nextText:@"确定"];
    [self addSubview:self.textField];
    [self addSubview:self.secondTF];
    [self addSubview:self.remindLB];
    self.remindLB.text = @"只有在需要实名场景中才会展示您的姓名";
    self.textField.placeholder = @" 姓";
    self.secondTF.placeholder = @" 名";
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)nextStepBtnClick {
    [self dismiss];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (UITextField *)secondTF {
    if (!_secondTF) {
        _secondTF = [[UITextField alloc] init];
        _secondTF.font = [APP_CONFIG appAdaptFontOfSize:17];
        _secondTF.textColor = APP_CONFIG.darkTextColor;
        [_secondTF setTintColor:APP_CONFIG.appMainColor];
        _secondTF.backgroundColor = [UIColor whiteColor];
        _secondTF.layer.cornerRadius = 2;
        _secondTF.clipsToBounds = YES;
        _secondTF.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _secondTF;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
