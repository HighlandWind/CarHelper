//
//  GJHomeCellNormal.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@class GJHomeShopData;
@class GJPartnerHomeDataList;

@interface GJHomeCellNormal : GJBaseTableViewCell

@property (nonatomic, strong) GJPartnerHomeDataList *partnerModel;

- (void)setShopData:(GJHomeShopData *)shopData index:(NSInteger)idx;

@end
