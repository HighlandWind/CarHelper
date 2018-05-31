//
//  GJCashDeskTopView.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/4/21.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@interface GJCashDeskTopView : GJBaseView
@property (nonatomic, strong) UITextField *priceTF;

- (void)setCashDetail:(NSString *)cashDetail type:(NSInteger)type;  // 0合伙人，1店铺  入驻支付
@end
