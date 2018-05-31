//
//  GJMyPartnerIdentifierData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/23.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJMyPartnerIdentifierData : GJBaseModel
@property (nonatomic, strong) NSString *group_id;
@property (nonatomic, strong) NSString *group_name;
@property (nonatomic, strong) NSString *tjr_phone;
@property (nonatomic, strong) NSString *updated_at;
@end

@interface GJMyQRCodeData : GJBaseModel
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *sf_num;
@property (nonatomic, strong) NSString *imgurl;
@end
