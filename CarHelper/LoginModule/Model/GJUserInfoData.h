//
//  GJUserInfoData.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/29.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJUserInfoData : GJBaseModel <NSCoding>

@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSString *api_token;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *tokenid;
@property (nonatomic, strong) NSString *wx_tokenid;
@property (nonatomic, strong) NSString *group_id;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *isWX;
@property (nonatomic, strong) NSString *isQQ;
@property (nonatomic, strong) NSString *credits;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, strong) NSString *sfz_card;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *freeze;
@property (nonatomic, strong) NSString *spend;

@property (nonatomic, strong) NSString *isShop;
@property (nonatomic, strong) NSString *isHhr;
@property (nonatomic, strong) NSString *region_id;
@property (nonatomic, strong) NSString *supplier_id;
@property (nonatomic, strong) NSString *registration_id;
@property (nonatomic, strong) NSString *default_id;
@property (nonatomic, strong) NSString *zfbzh;
@property (nonatomic, strong) NSString *wxzh;

@property (nonatomic, strong) UIImage *avatarImage;

@end
