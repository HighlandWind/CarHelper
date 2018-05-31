//
//  GJPartnerBenifitCell.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"
#import "GJPartnerBenifitData.h"
#import "GJShopBenifitData.h"

@interface GJPartnerBenifitCell : GJBaseTableViewCell
@property (nonatomic, assign) BOOL isFromShop;
@property (nonatomic, strong) GJPartnerBenifitDataList *model;
@property (nonatomic, strong) GJShopBenifitDataList *modelShop;
@end
