//
//  GJApplyPartnerData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJApplyPartnerData : GJBaseModel

@property (nonatomic, strong) NSString *api_token;
@property (nonatomic, strong) NSString *yqid;
@property (nonatomic, strong) NSString *group_name;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *type;

@end
