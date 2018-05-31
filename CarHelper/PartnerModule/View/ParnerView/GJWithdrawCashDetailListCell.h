//
//  GJWithdrawCashDetailListCell.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"
#import "GJWithdrawCashDetailList.h"

@class GJShopScoreListDataList;
@class GJRechargeDetailListData;

@interface GJWithdrawCashDetailListCell : GJBaseTableViewCell
@property (nonatomic, assign) BOOL isFromShop;
@property (nonatomic, strong) GJWithdrawCashDetailList *model;
@property (nonatomic, strong) GJShopScoreListDataList *listData;
@property (nonatomic, strong) GJRechargeDetailListData *rechageData;
@end
