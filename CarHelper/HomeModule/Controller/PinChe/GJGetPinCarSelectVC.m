//
//  GJGetPinCarSelectVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJGetPinCarSelectVC.h"
#import "GJGetCarSelectStep1.h"
#import "GJGetCarSelectStep2.h"
#import "GJGetMarkOnMapVC.h"

@interface GJGetPinCarSelectVC ()
@property (nonatomic, strong) GJGetCarSelectStep1 *step1View;
@property (nonatomic, strong) GJGetCarSelectStep2 *step2View;
@end

@implementation GJGetPinCarSelectVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
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
    [self.view addSubview:self.step1View];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    tap.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tap];
    [self blockHanddle];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods
- (void)blockHanddle {
    __weak typeof(self)weakself = self;
    GJGetMarkOnMapVC *vc = [[GJGetMarkOnMapVC alloc] init];
    _step1View.blockClickStartPoint = ^{
        vc.title = @"标注出发地";
        [vc pushPageWith:weakself];
    };
    _step2View.blockClickStartPoint = ^{
        vc.title = @"标注出发地";
        [vc pushPageWith:weakself];
    };
    _step2View.blockClickEndPoint = ^{
        vc.title = @"标注目的地";
        [vc pushPageWith:weakself];
    };
}

#pragma mark - Public methods


#pragma mark - Event response
- (void)tapClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Custom delegate


#pragma mark - Getter/Setter
- (GJGetCarSelectStep1 *)step1View {
    if (!_step1View) {
        _step1View = [GJGetCarSelectStep1 installContext:self];
    }
    return _step1View;
}

- (GJGetCarSelectStep2 *)step2View {
    if (!_step2View) {
        _step2View = [GJGetCarSelectStep2 installContext:self];
    }
    return _step2View;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
