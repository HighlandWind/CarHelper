//
//  GJRecommandBaseVC.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseViewController.h"
#import "GJRecommandRelatedCell.h"

@interface GJRecommandBaseVC : GJBaseViewController <UITableViewDelegate, UITableViewDataSource>

- (NSInteger)recommandPage_numberOfSectionsInTableView;
- (UITableViewCell *)recommandPage:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
