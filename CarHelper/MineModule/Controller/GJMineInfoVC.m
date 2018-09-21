//
//  GJMineInfoVC.m
//  CarHelper
//
//  Created by hsrd on 2018/9/17.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineInfoVC.h"
#import "GJMineUpdateSexView.h"

@interface GJMineInfoVC ()
@property (nonatomic, strong) GJMineUpdateSexView *sexView;
@end

@implementation GJMineInfoVC

#pragma mark - View controller life circle
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }
    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [_sexView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).with.offset([UIApplication sharedApplication].statusBarFrame.size.height + AdaptatSize(90));
        make.height.mas_equalTo(AdaptatSize(260));
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
    [self.view addSubview:self.sexView];
}

- (void)initializationNetWorking {
    
}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Getter/Setter
- (GJMineUpdateSexView *)sexView {
    if (!_sexView) {
        _sexView = [[GJMineUpdateSexView alloc] init];
    }
    return _sexView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
