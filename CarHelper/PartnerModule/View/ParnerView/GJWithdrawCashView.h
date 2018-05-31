//
//  GJWithdrawCashView.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/18.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@interface GJWithdrawCashView : GJBaseView

- (instancetype)initIsFromShop:(BOOL)isFromShop;

@property (nonatomic, strong) NSString *yueMoney;
@property (nonatomic, copy) void (^blockClickSubmit)(double money);
@end
