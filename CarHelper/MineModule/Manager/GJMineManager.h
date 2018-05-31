//
//  GJMineManager.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/5/4.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GJAppInfoData;
@class GJInviteFriendListData;
@class GJAddressListData;

@interface GJMineManager : NSObject

- (void)requestBindingPayAccount:(NSString *)zfbzh
                            wxzh:(NSString *)wxzh
                         success:(void (^)(void))successBlock
                         failure:(HTTPTaskFailureBlock)failureBlock;

/**
 受邀好友、商家、合伙人列表

 @param type 受邀人类型（0：好友，1：商家，2：合伙人
 @param success 成功
 @param failureBlock 失败
 */
- (void)requestInviteFriendsListWithType:(NSInteger)type
                                 success:(void (^)(NSArray <GJInviteFriendListData *> *data))success
                                 failure:(HTTPTaskFailureBlock)failureBlock;

/**
 关于我们

 @param success 成功
 @param failureBlock 失败
 */
- (void)requestAppInfoSuccess:(void (^)(GJAppInfoData *data))success
                      failure:(HTTPTaskFailureBlock)failureBlock;

/**
 * 修改用户信息
 */
- (void)requestEditUserInfoWithName:(NSString *)name context:(UIViewController *)context;
- (void)requestEditUserInfoWithSex:(NSString *)sex context:(UIViewController *)context;
- (void)requestEditUserInfoWithNick:(NSString *)nick context:(UIViewController *)context;

/**
 获取用户信息

 @param successBlock 成功
 @param failureBlock 失败
 */
- (void)requestUserInfoSuccess:(void (^)(void))successBlock
                       failure:(HTTPTaskFailureBlock)failureBlock;

/**
 更新头像

 @param image 图片
 @param successBlock 成功
 @param failureBlock 失败
 */
- (void)uploadPortraitFile:(UIImage *)image
                   success:(void (^)(NSString *imgURL))successBlock
                   failure:(HTTPTaskFailureBlock)failureBlock;

@end
