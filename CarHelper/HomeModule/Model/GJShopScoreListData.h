//
//  GJShopScoreListData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJShopScoreListDataList : GJBaseModel
@property (nonatomic, assign) NSInteger log_type;
@property (nonatomic, strong) NSString *order_id;
@property (nonatomic, strong) NSString *credits;
@property (nonatomic, strong) NSString *beizhu;
@property (nonatomic, strong) NSString *created_at;
@end

@interface GJShopScoreListData : GJBaseModel
@property (nonatomic, strong) NSString *total_credits;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, strong) NSString *count;
@property (nonatomic, strong) NSString *total_pages;
@property (nonatomic, strong) NSArray <GJShopScoreListDataList *> *data;
@end
