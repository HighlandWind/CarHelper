//
//  GJHomeNaviView.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@class GJHomeShopData;

@interface GJHomeNaviView : GJBaseView

@property (nonatomic, strong) GJHomeShopData *shopData;

@property (copy,nonatomic) void(^blockShopStatusClick)(void);
+ (GJHomeNaviView *)install;
@end
