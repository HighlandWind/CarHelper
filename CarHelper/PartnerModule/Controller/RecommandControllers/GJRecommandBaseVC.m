//
//  GJRecommandBaseVC.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRecommandBaseVC.h"

@interface GJRecommandBaseVC ()
@property (nonatomic, strong) GJBaseTableView *tableView;
@end

@implementation GJRecommandBaseVC

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

#pragma mark - Public methods
- (NSInteger)recommandPage_numberOfSectionsInTableView { return 1; }
- (UITableViewCell *)recommandPage:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath { return nil; }

#pragma mark - UITableViewDelegate、UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self recommandPage:tableView cellForRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self recommandPage_numberOfSectionsInTableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(80);
}

#pragma mark - Getter/Setter
- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped controller:self];
        _tableView.backgroundColor = [UIColor colorWithRGB:247 g:248 b:250];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
