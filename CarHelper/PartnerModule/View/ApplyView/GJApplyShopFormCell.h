//
//  GJApplyShopFormCell.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/21.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"

@interface GJApplyShopFormCell : GJBaseTableViewCell

@property (nonatomic, strong) UITextField *centerTF;
@property (nonatomic, copy) void (^blockBtnClick)(void);

+ (GJApplyShopFormCell *)installTitle1:(NSString *)title1 title2:(NSString *)title2 rightImg:(NSString *)rightImg index:(NSInteger)index;
- (void)setSelectTitle:(NSString *)title;

@end
