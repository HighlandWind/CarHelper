//
//  GJRecommandVC1.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRecommandVC1.h"

@interface GJRecommandVC1 ()
@end

@implementation GJRecommandVC1

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
    
    return cell;
}

- (NSInteger)recommandPage_numberOfSectionsInTableView {
    return 5;
}

#pragma mark - Getter/Setter


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
