//
//  GJGiftExamListController.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseViewController.h"

@class GJGiftExamListData;

@interface GJGiftExamListController : GJBaseViewController
@property (nonatomic, strong) NSArray <GJGiftExamListData *> *datas;
@property (nonatomic, strong) NSString *phone;
@end
