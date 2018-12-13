//
//  GJHomeMoreVC.m
//  CarHelper
//
//  Created by liugangjian on 2018/12/13.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeMoreVC.h"

@interface GJHomeMoreVC ()
@property (nonatomic, strong) UILabel *titleLB;
@end

@implementation GJHomeMoreVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setStatusBarLight:YES];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    [self showMainColorNavigation];
}

- (void)initializationSubView {
    self.title = @"全部服务";
    [self.view addSubview:self.titleLB];
    [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(AdaptatSize(30));
        make.top.equalTo(self.view).with.offset(AdaptatSize(10));
    }];
    UIView *leftLine = [[UIView alloc] init];
    leftLine.backgroundColor = APP_CONFIG.appMainColor;
    [self.view addSubview:leftLine];
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(AdaptatSize(15));
        make.centerY.equalTo(self.titleLB);
        make.width.mas_equalTo(2);
        make.height.mas_equalTo(AdaptatSize(15));
    }];
    UIView *topLine = [[UIView alloc] init];
    topLine.backgroundColor = APP_CONFIG.appBackgroundColor;
    [self.view addSubview:topLine];
    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(6);
    }];
}

- (void)initializationNetWorking {
    NSArray *titles = @[@"停车", @"限行提醒", @"移车通知", @"拼车", @"洗车", @"保养", @"维修"];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = [self createButtonTitle:obj titleColor:APP_CONFIG.appMainColor image:obj tag:idx + 100];
        [self.view addSubview:btn];
        
        CGFloat w = AdaptatSize(60);
        int row = idx / 4.0;
        CGFloat top = AdaptatSize(15) + row * (w + AdaptatSize(10));
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLB.mas_bottom).with.offset(top);
            make.width.height.mas_equalTo(w);
            if (idx % 4 == 0) {
                make.left.equalTo(self.view).with.offset(AdaptatSize(15));
            }else if (idx % 4 == 1) {
                make.right.equalTo(self.view.mas_centerX).with.offset(-AdaptatSize(20));
            }else if (idx % 4 == 2) {
                make.left.equalTo(self.view.mas_centerX).with.offset(AdaptatSize(20));
            }else {
                make.right.equalTo(self.view).with.offset(-AdaptatSize(15));
            }
        }];
        
        if (idx == titles.count - 1) {
            UIView *btmLine = [[UIView alloc] init];
            btmLine.backgroundColor = APP_CONFIG.appBackgroundColor;
            [self.view addSubview:btmLine];
            [btmLine mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.view);
                make.height.mas_equalTo(6);
                make.top.equalTo(btn.mas_bottom).with.offset(AdaptatSize(10));
            }];
        }
    }];
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response
- (void)buttonClick:(UIButton *)btn {
    NSInteger idx = btn.tag - 100;
    if (idx == 0) {
        
    }else if (idx == 1) {
        
    }
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [APP_CONFIG appAdaptBoldFontOfSize:16];
        _titleLB.text = @"常用工具";
        _titleLB.textColor = [UIColor grayColor];
        [_titleLB sizeToFit];
    }
    return _titleLB;
}

- (UIButton *)createButtonTitle:(NSString *)title titleColor:(UIColor *)titleColor image:(NSString *)image tag:(NSInteger)tag {
    UIButton *btn = [[UIButton alloc] init];
    btn.tag = tag;
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, AdaptatSize(28), 0)];
    UILabel *titleLB = [[UILabel alloc] init];
    titleLB.font = [APP_CONFIG appAdaptBoldFontOfSize:14];
    titleLB.text = title;
    titleLB.textColor = titleColor;
    [titleLB sizeToFit];
    [btn addSubview:titleLB];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(btn).with.offset(-5);
        make.centerX.equalTo(btn);
    }];
    return btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
