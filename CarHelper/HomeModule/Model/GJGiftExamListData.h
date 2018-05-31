//
//  GJGiftExamListData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJGiftExamListData : GJBaseModel
@property (nonatomic, strong) NSString *goods_id;
@property (nonatomic, strong) NSString *goods_name;
@property (nonatomic, strong) NSString *thumb;
@property (nonatomic, strong) NSString *goods_price;
@property (nonatomic, strong) NSString *num;
@property (nonatomic, strong) NSString *total_credits;
@end
