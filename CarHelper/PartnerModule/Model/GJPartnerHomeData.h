//
//  GJPartnerHomeData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/23.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJPartnerHomeDataList : GJBaseModel
@property (nonatomic, strong) NSString *group_id;
@property (nonatomic, strong) NSString *date_sjxq;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *date_sy_name;
@property (nonatomic, strong) NSString *date_sy;
@property (nonatomic, strong) NSString *fzdp_num;
@property (nonatomic, strong) NSString *fzdp_yyr;
@property (nonatomic, strong) NSString *date_sy_zrdb;
@property (nonatomic, strong) NSString *region_id;
@property (nonatomic, strong) NSString *group_name;
@property (nonatomic, strong) NSString *tjr_phone;
@property (nonatomic, strong) NSString *updated_at;
@end

@interface GJPartnerHomeData : GJBaseModel
@property (nonatomic, strong) NSArray <GJPartnerHomeDataList *> *data;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, strong) NSString *total_yyr;
@property (nonatomic, strong) NSString *total_sy;
@end
