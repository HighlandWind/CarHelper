//
//  GJBindingInputVC.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/19.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseViewController.h"

@interface GJBindingInputVC : GJBaseViewController
@property (nonatomic, strong) NSString *placeHolder;
@property (nonatomic, assign) NSInteger type;   // 0支付宝，1微信
@end
