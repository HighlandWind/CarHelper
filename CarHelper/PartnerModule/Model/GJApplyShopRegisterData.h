//
//  GJApplyShopRegisterData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/22.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJApplyShopRegisterDataTypeList : GJBaseModel
@property (nonatomic, strong) NSString *dp_ejlb_id;
@property (nonatomic, strong) NSString *dp_ejlb_name;
@end

@interface GJApplyShopRegisterDataType : GJBaseModel
@property (nonatomic, strong) NSString *catid;
@property (nonatomic, strong) NSString *cat_name;
@property (nonatomic, strong) NSArray <GJApplyShopRegisterDataTypeList *> *dp_ejlb;
@end

@interface GJApplyShopRegisterData : GJBaseModel
@property (nonatomic, strong) NSString *tjr_phone;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSArray <GJApplyShopRegisterDataType *> *dp_type;
@end
