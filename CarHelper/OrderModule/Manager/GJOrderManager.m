//
//  GJOrderManager.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/5/4.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJOrderManager.h"
#import "GJRechargeDetailListData.h"

@implementation GJOrderManager

- (void)requestRechargeDetailSuccess:(void (^)(NSArray<GJRechargeDetailListData *> *))successBlock failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *param = @{@"api_token":APP_USER.userInfo.api_token};
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Order_Shop_Recharge_List andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        NSArray <GJRechargeDetailListData *> *datas = [NSArray yy_modelArrayWithClass:GJRechargeDetailListData.class json:response];
        successBlock(datas);
    } andFailedCallback:failureBlock];
}

- (void)requestPayOrderStatus:(NSString *)pay_sn yqid:(NSString *)yqid success:(void (^)(void))success failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *para = @{@"pay_sn":pay_sn,
                           @"pay_status":[NSNumber numberWithInteger:9000],
                           @"yqid":yqid
                           };
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Order_Payment_QueryStatus andParaDic:para andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        [APP_USER loginSucess:response];
        success();
    } andFailedCallback:failureBlock];
}

- (void)requestPayWithYqid:(NSString *)yqid type:(PayTypes)type pay_leixing:(NSString *)pay_leixing token:(NSString *)token success:(void (^)(GJOrderPaymentData *))success failure:(HTTPTaskFailureBlock)failureBlock {
    // pay_leixing - 支付类型（0：店铺扫码消费支付，1：申请商家支付，2：申请合伙人支付，3：超值礼包，4：优惠活动）
    NSDictionary *para = @{@"yqid":yqid,
                           @"pay_type":[NSNumber numberWithInteger:(NSInteger)type],
                           @"api_token":token,
                           @"pay_leixing":pay_leixing
                           };
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Partner_Apply_Pay andParaDic:para andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJOrderPaymentData *data = [GJOrderPaymentData yy_modelWithJSON:response];
        success(data);
    } andFailedCallback:failureBlock];
}

@end
