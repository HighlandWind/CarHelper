//
//  GJTradeAreaModel.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/23.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJTradeAreaModel.h"

@implementation GJTradeAreaListModel

@end

@implementation GJTradeAreaModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"lists" : GJTradeAreaListModel.class};
}

+ (GJTradeAreaModel *)cellModelWithTitle:(NSString *)title detail:(NSString *)detail dis:(NSString *)d shop:(NSString *)s type:(NSString *)t visit:(NSString *)v lists:(NSArray<GJTradeAreaListModel *> *)list {
    GJTradeAreaModel *model = [GJTradeAreaModel new];
    model.title = title;
    model.detail = detail;
    model.distane = d;
    model.shop = s;
    model.type = t;
    model.visits = v;
    model.lists = list;
    return model;
}

@end
