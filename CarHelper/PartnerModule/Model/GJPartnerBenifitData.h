//
//  GJPartnerBenifitData.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseModel.h"

@interface GJPartnerBenifitDataList : GJBaseModel
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *fzdp_num;
@property (nonatomic, strong) NSString *fzdp_money;
@property (nonatomic, strong) NSString *fzhhr_num;
@property (nonatomic, strong) NSString *fzhhr_money;
@property (nonatomic, strong) NSString *fzdp_zjdpyyr;
@property (nonatomic, strong) NSString *fzdp_zjfc;
@property (nonatomic, strong) NSString *fzdp_jjdpyyr;
@property (nonatomic, strong) NSString *fzdp_jjfc;
@property (nonatomic, strong) NSString *total_money;
@end

@interface GJPartnerBenifitData : GJBaseModel
@property (nonatomic, strong) NSArray <GJPartnerBenifitDataList *> *data;
@property (nonatomic, strong) NSString *dpsy;
@property (nonatomic, strong) NSString *tjsy;
@property (nonatomic, strong) NSString *balance;
@property (nonatomic, assign) NSInteger total;
@end
