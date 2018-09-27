//
//  GJCarPoolVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/26.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJCarPoolVC.h"

@interface GJCarPoolVC ()
@property (nonatomic, strong) UIButton *startAPinCar;
@property (nonatomic, strong) UILabel *centerLB;
@end

@implementation GJCarPoolVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_startAPinCar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.height.mas_equalTo(AdaptatSize(60));
        make.top.equalTo(self.view.mas_centerY).with.offset(AdaptatSize(40));
    }];
    [_centerLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
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
    [self setStatusBarLight:NO];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    
}

- (void)initializationSubView {
    self.title = @"拼车";
    [self.view addSubview:self.startAPinCar];
    [self.view addSubview:self.centerLB];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (UIButton *)startAPinCar {
    if (!_startAPinCar) {
        _startAPinCar = [[UIButton alloc] init];
        _startAPinCar.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:20];
        [_startAPinCar setTitle:@"发起拼车" forState:UIControlStateNormal];
        [_startAPinCar setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
        _startAPinCar.backgroundColor = APP_CONFIG.appMainColor;
        _startAPinCar.layer.cornerRadius = 5;
        _startAPinCar.clipsToBounds = YES;
    }
    return _startAPinCar;
}

- (UILabel *)centerLB {
    if (!_centerLB) {
        _centerLB = [[UILabel alloc] init];
        _centerLB.font = [APP_CONFIG appAdaptBoldFontOfSize:14];
        _centerLB.textColor = [UIColor colorWithRGB:124 g:243 b:210];
        NSString *t = @"上下班拼车  低碳出行";
        NSString *text = [NSString stringWithFormat:@"— %@ —", t];
        NSMutableAttributedString *muText = [[NSMutableAttributedString alloc] initWithString:text];
        [muText addAttribute:NSForegroundColorAttributeName value:APP_CONFIG.grayTextColor range:[text rangeOfString:t]];
        _centerLB.attributedText = muText;
        [_centerLB sizeToFit];
    }
    return _centerLB;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
