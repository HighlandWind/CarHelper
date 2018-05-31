//
//  GJPartnerManager.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GJApplyPartnerData.h"

@class GJPartnerBenifitData;
@class GJWithdrawCashDetailList;
@class GJApplyShopRegisterData;
@class GJShopBenifitData;
@class GJMyPartnerIdentifierData;
@class GJMyQRCodeData;
@class GJPartnerHomeData;

@interface GJPartnerManager : NSObject

/**
 合伙人首页数据
 
 @param date 日期（today,yesterday,week）默认为today
 此处传 1代表today，2代表yesterday，3代表week
 */
- (void)requestPartnerHomeWithDate:(NSInteger)date
                           success:(void (^)(GJPartnerHomeData *models))successBlock
                           failure:(HTTPTaskFailureBlock)failureBlock;

/**
 我的推荐码
 */
- (void)requestMyQRCodeSuccess:(void (^)(GJMyQRCodeData *datas))success
                       failure:(HTTPTaskFailureBlock)failureBlock;

/**
 我的合伙人身份
 */
- (void)requestMyPartnerIdentifierSuccess:(void (^)(NSArray <GJMyPartnerIdentifierData *> *datas))success
                                  failure:(HTTPTaskFailureBlock)failureBlock;

/**
 申请店铺-完善资质
 */
- (void)requestApplyShopWithImages:(NSArray <UIImage *> *)images
                          tjrPhone:(NSString *)tjrPhone
                             phone:(NSString *)phone
                               uid:(NSString *)uid
                     supplier_name:(NSString *)supplier_name
                          province:(NSString *)province
                              city:(NSString *)city
                          district:(NSString *)district
                          streetID:(NSString *)streetID
                           address:(NSString *)address
                             catid:(NSString *)catid
                        shop_hours:(NSString *)shop_hours
                           zhizhao:(NSString *)zhizhao
                               tel:(NSString *)tel
                           success:(void (^)(GJApplyPartnerData *applyShopData))successBlock
                           failure:(HTTPTaskFailureBlock)failureBlock;

/**
 提现明细

 @param type 提现来源（0：从合伙余额中提现，1：店铺余额中提现）
 */
- (void)requestWithdrawCashDetailListType:(NSInteger)type
                                  success:(void (^)(NSArray <GJWithdrawCashDetailList *> *list))success
                                  failure:(HTTPTaskFailureBlock)failureBlock;

/**
 提现

 @param type 提现来源（0：从合伙余额中提现，1：店铺余额中提现）
 */
- (void)requestWithdrawCashWithType:(NSInteger)type
                              money:(double)money
                            success:(void (^)(NSString *message))success
                            failure:(HTTPTaskFailureBlock)failureBlock;

/**
 合伙收益列表
 */
- (void)requestPartnerBenifitWithPage:(NSInteger)page
                              success:(void (^)(GJPartnerBenifitData *data))success
                              failure:(HTTPTaskFailureBlock)failureBlock;

/**
 店铺收益列表
 */
- (void)requestShopBenifitWithPage:(NSInteger)page
                           success:(void (^)(GJShopBenifitData *data))success
                           failure:(HTTPTaskFailureBlock)failureBlock;

/**
 申请商铺
 */
- (void)requestShopPhone:(NSString *)phone
                tjrPhone:(NSString *)tjrPhone
                    code:(NSString *)code
                 success:(void (^)(GJApplyShopRegisterData *data))success
                 failure:(HTTPTaskFailureBlock)failureBlock;

/**
 申请合伙人
 */
- (void)requestApplyPartnerUserPhone:(NSString *)phone
                            tjrPhone:(NSString *)tjrPhone
                            group_id:(NSUInteger)group_id
                             city_id:(NSString *)city_id
                         district_id:(NSString *)district_id
                                code:(NSString *)code
                      success:(void (^)(GJApplyPartnerData *data))success
                      failure:(HTTPTaskFailureBlock)failureBlock;

@end
