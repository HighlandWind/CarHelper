//
//  GJShopBenifitData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/23.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJShopBenifitDataList : GJBaseModel
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *bd_yyr;
@property (nonatomic, strong) NSString *bd_yyr_sr;
@property (nonatomic, strong) NSString *yd_md;
@property (nonatomic, strong) NSString *yd_md_fc;
@property (nonatomic, strong) NSString *total_money;
@end

@interface GJShopBenifitData : GJBaseModel
@property (nonatomic, strong) NSArray <GJShopBenifitDataList *> *data;
@property (nonatomic, strong) NSString *ysrz;
@property (nonatomic, strong) NSString *ydfr;
@property (nonatomic, assign) NSInteger total_money;
@property (nonatomic, strong) NSString *balance;
@end
