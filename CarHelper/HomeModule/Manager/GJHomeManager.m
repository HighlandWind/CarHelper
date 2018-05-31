//
//  GJHomeManager.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/4/4.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJHomeManager.h"
#import "GJHomeShopData.h"
#import "GJShopScoreListData.h"

@implementation GJHomeManager

- (void)requestShopScoreListSuccess:(void (^)(GJShopScoreListData *))successBlock failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *param = @{@"api_token":APP_USER.userInfo.api_token};
    [[GJHttpNetworkingManager sharedInstance] requestAllDataPostWithPathUrl:Home_Shop_ScoreList andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJShopScoreListData *data = [GJShopScoreListData yy_modelWithJSON:response];
        successBlock(data);
    } andFailedCallback:failureBlock];
}

- (void)requestGiveScore:(NSString *)phone score:(NSString *)score success:(void (^)(NSString *))successBlock failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *param = @{@"api_token":APP_USER.userInfo.api_token, @"phone":phone, @"credits":score};
    [[GJHttpNetworkingManager sharedInstance] requestAllDataPostWithPathUrl:Home_Give_Score andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        successBlock(response[@"message"]);
    } andFailedCallback:failureBlock];
}

- (void)requestGiftExamList:(NSString *)phone success:(void (^)(NSArray<GJGiftExamListData *> *))successBlock failure:(HTTPTaskFailureBlock)failureBlock {
    NSDictionary *param = @{@"phone":APP_USER.userInfo.api_token, @"date":phone};
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Home_Gift_Exam andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        NSArray *data = [NSArray yy_modelArrayWithClass:GJGiftExamListData.class json:response];
        successBlock(data);
    } andFailedCallback:failureBlock];
}

- (void)requestShopIndexWithDate:(NSInteger)date success:(void (^)(GJHomeShopData *))successBlock failure:(HTTPTaskFailureBlock)failureBlock {
    NSString *dateStr = @"";
    if (date == 1) {
        dateStr = @"today";
    }else if (date == 2) {
        dateStr = @"yesterday";
    }else if (date == 3) {
        dateStr = @"week";
    }
    NSDictionary *param = @{@"api_token":APP_USER.userInfo.api_token, @"date":dateStr};
    [[GJHttpNetworkingManager sharedInstance] requestFormTypePostWithPathUrl:Home_Shop_Index andParaDic:param andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJHomeShopData *data = [GJHomeShopData yy_modelWithJSON:response];
        successBlock(data);
    } andFailedCallback:failureBlock];
}

- (void)requestRegionData {
    if (APP_USER.regionData) return ;
    [[GJHttpNetworkingManager sharedInstance] requestAllDataPostWithPathUrl:Home_Region_List andParaDic:nil andSucceedCallback:^(NSURLResponse *urlResponse, id response) {
        GJRegionData *data = [GJRegionData yy_modelWithJSON:response];
        [APP_USER saveRegionData:data];
    } andFailedCallback:^(NSURLResponse *urlResponse, NSError *error) {
        ShowWaringAlertHUD(@"获取省市区数据失败", nil);
    }];
}

@end
