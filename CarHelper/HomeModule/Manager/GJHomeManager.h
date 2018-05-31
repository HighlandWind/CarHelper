//
//  GJHomeManager.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/4/4.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GJGiftExamListData.h"

@class GJHomeShopData;
@class GJShopScoreListData;

@interface GJHomeManager : NSObject

/**
 店铺积分
 */
- (void)requestShopScoreListSuccess:(void (^)(GJShopScoreListData *data))successBlock
                            failure:(HTTPTaskFailureBlock)failureBlock;

/**
 赠送积分
 */
- (void)requestGiveScore:(NSString *)phone
                   score:(NSString *)score
                 success:(void (^)(NSString *msg))successBlock
                 failure:(HTTPTaskFailureBlock)failureBlock;

/**
 好礼核验
 */
- (void)requestGiftExamList:(NSString *)phone
                    success:(void (^)(NSArray <GJGiftExamListData *> *model))successBlock
                    failure:(HTTPTaskFailureBlock)failureBlock;

/**
 首页数据

 @param date 日期（today,yesterday,week）默认为today
 此处传 1代表today，2代表yesterday，3代表week
 */
- (void)requestShopIndexWithDate:(NSInteger)date
                         success:(void (^)(GJHomeShopData *model))successBlock
                         failure:(HTTPTaskFailureBlock)failureBlock;

/**
 省市区数据
 */
- (void)requestRegionData;

@end
