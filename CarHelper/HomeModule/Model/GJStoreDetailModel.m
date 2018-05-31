//
//  GJStoreDetailModel.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/26.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJStoreDetailModel.h"

@implementation GJStoreDetailModel
+ (GJStoreDetailModel *)cellModelWithTitle:(NSString *)title detail:(NSString *)detail iconUrl:(NSString *)iconUrl price:(NSString *)price discount:(NSString *)discount marks:(NSArray *)marks perPrice:(NSString *)perPrice tele:(NSString *)tele adress:(NSString *)adress {
    GJStoreDetailModel *model = [GJStoreDetailModel new];
    model.title = title;
    model.detail = detail;
    model.iconUrl = iconUrl;
    model.price = price;
    model.discount = discount;
    model.marks = marks;
    model.perPersonPrice = perPrice;
    model.telephone = tele;
    model.adress = adress;
    return model;
}
@end
