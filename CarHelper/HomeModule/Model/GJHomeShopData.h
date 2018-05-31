//
//  GJHomeShopData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/23.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJHomeShopData : GJBaseModel
@property (nonatomic, strong) NSString *supplier_name;
@property (nonatomic, strong) NSString *status; // 店铺状态（1：营业中，2：暂停营业）
@property (nonatomic, strong) NSString *supplier_id;


@property (nonatomic, strong) NSString *date_sjxq;  // 格式化日期
@property (nonatomic, strong) NSString *date;       // 日期
@property (nonatomic, strong) NSString *dp_yyr_sr;  // 店铺营业收入
@property (nonatomic, strong) NSString *dp_user_add;// 店铺新增会员数量
@property (nonatomic, strong) NSString *dp_yyr;     // 店铺营业额
@property (nonatomic, strong) NSString *dp_md_num;  // 店铺买单数量
@property (nonatomic, strong) NSString *dp_md_avg;  // 每笔买单的平均价
@property (nonatomic, strong) NSString *dp_yyr_zrdb;// 店铺营业额昨日对比


@property (nonatomic, strong) NSString *bd_user_md_num;//店铺所有会员买单数量
@property (nonatomic, strong) NSString *dp_htl;     // 本店会员回头率
@property (nonatomic, strong) NSString *bd_htl_zrdb;// 回头率昨日对比


@property (nonatomic, strong) NSString *fr_money;   // 异店分润
@property (nonatomic, strong) NSString *yd_fr_zrdb; // 异店分润昨日对比
@property (nonatomic, strong) NSString *yd_md_num;  // 本店会员异店买单数
@property (nonatomic, strong) NSString *yd_md_money;// 本店会员异店买单总额
@end
