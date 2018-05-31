//
//  GJPartnerManager.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPartnerManager.h"
#import "GJPartnerBenifitData.h"
#import "GJWithdrawCashDetailList.h"
#import "GJApplyShopRegisterData.h"
#import "GJShopBenifitData.h"
#import "GJMyPartnerIdentifierData.h"
#import "GJPartnerHomeData.h"

@implementation GJPartnerManager

- (void)requestPartnerHomeWithDate:(NSInteger)date success:(void (^)(GJPartnerHomeData *))successBlock failure:(HTTPTaskFailureBlock)failureBlock {
    NSString *dateStr = @"";
    if (date == 1) {
        dateStr = @"today";
    }else if (date == 2) {
        dateStr = @"yesterday";
    }else if (date == 3) {
        dateStr = @"week";
    }
    NSDictionary *param = @{@"api_token":APP_USER.userInfo.api_token, @"date":dateStr};
    [[GJHttpNetworkingManager sharedInstance] requestAllDataPostWithPathUrl:Partner_Shop_Index andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJPartnerHomeData *data = [GJPartnerHomeData yy_modelWithJSON:response];
        successBlock(data);
    } andFailedCallback:failureBlock];
}

- (void)requestMyQRCodeSuccess:(void (^)(GJMyQRCodeData *))success failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *param = @{@"api_token":APP_USER.userInfo.api_token};
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Partner_My_QRCode andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJMyQRCodeData *data = [GJMyQRCodeData yy_modelWithJSON:response];
        success(data);
    } andFailedCallback:failureBlock];
}

- (void)requestMyPartnerIdentifierSuccess:(void (^)(NSArray<GJMyPartnerIdentifierData *> *))success failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *param = @{@"api_token":APP_USER.userInfo.api_token};
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Partner_MyIdentifier_List andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        NSArray <GJMyPartnerIdentifierData *> *list = [NSArray yy_modelArrayWithClass:GJMyPartnerIdentifierData.class json:response];
        success(list);
    } andFailedCallback:failureBlock];
}

- (void)requestApplyShopWithImages:(NSArray<UIImage *> *)images tjrPhone:(NSString *)tjrPhone phone:(NSString *)phone uid:(NSString *)uid supplier_name:(NSString *)supplier_name province:(NSString *)province city:(NSString *)city district:(NSString *)district streetID:(NSString *)streetID address:(NSString *)address catid:(NSString *)catid shop_hours:(NSString *)shop_hours zhizhao:(NSString *)zhizhao tel:(NSString *)tel success:(void (^)(GJApplyPartnerData *))successBlock failure:(HTTPTaskFailureBlock)failureBlock {
    
    NSMutableArray <NSData *> *datas = @[].mutableCopy;
    [images enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [datas addObject:[UIImage compressImage:obj]];
    }];
    NSMutableDictionary *param = @{@"tjr_phone":tjrPhone,
                                   @"phone":phone,
                                   @"uid":uid,
                                   @"supplier_name":supplier_name,
                                   @"province":province,
                                   @"city":city,
                                   @"district":district,
                                   @"address":address,
                                   @"catid":catid,
                                   @"shop_hours":shop_hours,
                                   @"zhizhao":zhizhao,
                                   @"tel":tel,
                                   @"type":[NSNumber numberWithInt:1]
                                   }.mutableCopy;
    if (!JudgeContainerCountIsNull(datas)) {
        NSMutableString *dataStr = @"".mutableCopy;
        [datas enumerateObjectsUsingBlock:^(NSData * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *str = [obj base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
            [dataStr appendFormat:@"%@,", str];
        }];
        [dataStr deleteCharactersInRange:NSMakeRange(dataStr.length-1, 1)];
        [param addEntriesFromDictionary:@{@"file":dataStr}];
    }
    
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Partner_Apply_Shop andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJApplyPartnerData *data = [GJApplyPartnerData yy_modelWithJSON:response];
        successBlock(data);
    } andFailedCallback:failureBlock];
    
//    [[GJHttpNetworkingManager sharedInstance] reqeustLoadImageData:datas url:Partner_Apply_Shop params:param andProgress:NULL andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
//        GJApplyPartnerData *data = [GJApplyPartnerData yy_modelWithJSON:response[@"data"]];
//        successBlock(data);
//    } andFailedCallback:failureBlock];
}

- (void)requestWithdrawCashDetailListType:(NSInteger)type success:(void (^)(NSArray<GJWithdrawCashDetailList *> *))success failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *param = @{@"api_token":APP_USER.userInfo.api_token,
                            @"type":@(type)
                            };
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Partner_WithdrawCash_DetailList andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        NSArray <GJWithdrawCashDetailList *> *list = [NSArray yy_modelArrayWithClass:GJWithdrawCashDetailList.class json:response];
        success(list);
    } andFailedCallback:failureBlock];
}

- (void)requestWithdrawCashWithType:(NSInteger)type money:(double)money success:(void (^)(NSString *))success failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *param = @{@"api_token":APP_USER.userInfo.api_token,
                            @"type":@(type),
                            @"money":@(money)
                            };
    [[GJHttpNetworkingManager sharedInstance] requestAllDataPostWithPathUrl:Partner_Withdraw_Cash andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        NSString *message = response[@"message"];
        success(message);
    } andFailedCallback:failureBlock];
}

- (void)requestShopBenifitWithPage:(NSInteger)page success:(void (^)(GJShopBenifitData *))success failure:(HTTPTaskFailureBlock)failureBlock {
    [[GJHttpNetworkingManager sharedInstance] requestAllDataPostWithPathUrl:Shop_Benifit_Money andParaDic:@{@"api_token":APP_USER.userInfo.api_token, @"page":[NSNumber numberWithInteger:page]} andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJShopBenifitData *data = [GJShopBenifitData yy_modelWithJSON:response];
        success(data);
    } andFailedCallback:failureBlock];
}

- (void)requestPartnerBenifitWithPage:(NSInteger)page success:(void (^)(GJPartnerBenifitData *))success failure:(HTTPTaskFailureBlock)failureBlock {
    [[GJHttpNetworkingManager sharedInstance] requestAllDataPostWithPathUrl:Partner_Benifit_Money andParaDic:@{@"api_token":APP_USER.userInfo.api_token, @"page":[NSNumber numberWithInteger:page]} andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJPartnerBenifitData *data = [GJPartnerBenifitData yy_modelWithJSON:response];
        success(data);
    } andFailedCallback:failureBlock];
}

- (void)requestShopPhone:(NSString *)phone tjrPhone:(NSString *)tjrPhone code:(NSString *)code success:(void (^)(GJApplyShopRegisterData *))success failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *param = @{@"phone":phone,
                            @"tjr_phone":tjrPhone,
                            @"code":code
                            };
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Partner_Apply_ShopReg andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJApplyShopRegisterData *data = [GJApplyShopRegisterData yy_modelWithJSON:response];
        success(data);
    } andFailedCallback:failureBlock];
}

- (void)requestApplyPartnerUserPhone:(NSString *)phone tjrPhone:(NSString *)tjrPhone group_id:(NSUInteger)group_id city_id:(NSString *)city_id district_id:(NSString *)district_id code:(NSString *)code success:(void (^)(GJApplyPartnerData *))success failure:(HTTPTaskFailureBlock)failureBlock {
    NSMutableDictionary *para = @{@"tjr_phone":tjrPhone,
                           @"group_id":@(group_id),
                           @"phone":phone,
                           @"code":code
                           }.mutableCopy;
    if (city_id) {
        [para addEntriesFromDictionary:@{@"city_id":city_id}];
    }
    if (district_id) {
        [para addEntriesFromDictionary:@{@"district_id":district_id}];
    }
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Partner_Apply_User andParaDic:para andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJApplyPartnerData *data = [GJApplyPartnerData yy_modelWithJSON:response];
        success(data);
    } andFailedCallback:failureBlock];
}

@end
