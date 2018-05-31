//
//  GJStoreDetailModel.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/26.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJStoreDetailModel : GJBaseModel
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) NSArray *marks;
@property (nonatomic, strong) NSString *perPersonPrice;
@property (nonatomic, strong) NSString *telephone;
@property (nonatomic, strong) NSString *adress;

+ (GJStoreDetailModel *)cellModelWithTitle:(NSString *)title detail:(NSString *)detail iconUrl:(NSString *)iconUrl price:(NSString *)price discount:(NSString *)discount marks:(NSArray *)marks perPrice:(NSString *)perPrice tele:(NSString *)tele adress:(NSString *)adress;
@end
