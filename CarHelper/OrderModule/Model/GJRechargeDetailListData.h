//
//  GJRechargeDetailListData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/31.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJRechargeDetailListData : GJBaseModel
@property (nonatomic, assign) NSInteger log_type;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *supplier_name;
@property (nonatomic, strong) NSString *payid;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *credits;
@property (nonatomic, strong) NSString *created_at;
@property (nonatomic, strong) NSString *beizhu;
@end
