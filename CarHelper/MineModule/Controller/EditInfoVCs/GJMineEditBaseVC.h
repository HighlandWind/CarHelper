//
//  GJMineEditBaseVC.h
//  CarHelper
//
//  Created by liugangjian on 2018/11/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJCustomPresentController.h"

@interface GJMineEditBaseVC : GJCustomPresentController

@property (nonatomic, strong) UILabel *titleLB;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *remindLB;
@property (nonatomic, strong) UIButton *nextStepBtn;

@property (nonatomic, assign) CGFloat topInputTFW;
@property (nonatomic, assign) CGFloat topInputTFH;

- (void)initUITitle:(NSString *)title nextText:(NSString *)text;

- (void)dismiss;

- (void)nextStepBtnClick;

@end
