//
//  GJTradeAreaModel.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/23.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJTradeAreaListModel : GJBaseModel
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *iconUrl;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *distance;
@property (nonatomic, strong) NSString *mark;
@end

@interface GJTradeAreaModel : GJBaseModel
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *distane;
@property (nonatomic, strong) NSString *shop;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *visits;
@property (nonatomic, strong) NSArray <GJTradeAreaListModel *> *lists;

+ (GJTradeAreaModel *)cellModelWithTitle:(NSString *)title detail:(NSString *)detail dis:(NSString *)d shop:(NSString *)s type:(NSString *)t visit:(NSString *)v lists:(NSArray <GJTradeAreaListModel *> *)list;
@end
