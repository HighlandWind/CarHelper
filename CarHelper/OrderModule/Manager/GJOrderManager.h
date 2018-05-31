//
//  GJOrderManager.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/5/4.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GJOrderPaymentData.h"

@class GJRechargeDetailListData;

@interface GJOrderManager : NSObject

- (void)requestRechargeDetailSuccess:(void (^)(NSArray <GJRechargeDetailListData *> *datas))successBlock
                             failure:(HTTPTaskFailureBlock)failureBlock;

/**
 支付成功查询订单状态
 */
- (void)requestPayOrderStatus:(NSString *)pay_sn
                         yqid:(NSString *)yqid
                      success:(void (^)(void))success
                      failure:(HTTPTaskFailureBlock)failureBlock;

/**
 请求支付：微信、支付宝
 */
- (void)requestPayWithYqid:(NSString *)yqid
                      type:(PayTypes)type
               pay_leixing:(NSString *)pay_leixing
                     token:(NSString *)token
                    success:(void (^)(GJOrderPaymentData *data))success
                    failure:(HTTPTaskFailureBlock)failureBlock;

@end
