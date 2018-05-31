//
//  GJRecommandVC3.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRecommandVC3.h"

@interface GJRecommandVC3 ()
@end

@implementation GJRecommandVC3

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
    cell.data = @"333 突然忘记我让他忽然";
    return cell;
}

- (NSInteger)recommandPage_numberOfSectionsInTableView {
    return 2;
}

#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
