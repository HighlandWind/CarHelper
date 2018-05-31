//
//  GJApplyShopRegisterData.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/22.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyShopRegisterData.h"

@implementation GJApplyShopRegisterDataTypeList

@end

@implementation GJApplyShopRegisterDataType

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"dp_ejlb" : GJApplyShopRegisterDataTypeList.class};
}

@end

@implementation GJApplyShopRegisterData

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"dp_type" : GJApplyShopRegisterDataType.class};
}

@end
