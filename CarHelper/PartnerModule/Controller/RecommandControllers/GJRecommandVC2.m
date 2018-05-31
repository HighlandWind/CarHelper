//
//  GJRecommandVC2.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRecommandVC2.h"

@interface GJRecommandVC2 ()
@end

@implementation GJRecommandVC2

#pragma mark - View controller life circle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

#pragma mark - Iniitalization methods
- (void)initializationData {}

- (void)initializationSubView {
    
}

- (void)initializationNetWorking {}

#pragma mark - Request Handle


#pragma mark - Private methods


#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (UITableViewCell *)recommandPage:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJRecommandRelatedCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJRecommandRelatedCell reuseIndentifier]];
    if (!cell) cell = [[GJRecommandRelatedCell alloc] initWithStyle:[GJRecommandRelatedCell expectingStyle] reuseIdentifier:[GJRecommandRelatedCell reuseIndentifier]];
    cell.data = @"222 而且他家去退货日期";
    return cell;
}

- (NSInteger)recommandPage_numberOfSectionsInTableView {
    return 3;
}

#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
