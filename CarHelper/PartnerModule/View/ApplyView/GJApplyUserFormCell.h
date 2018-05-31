//
//  GJApplyUserFormCell.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"
#import "GJVerifyButton.h"

@interface GJApplyUserFormCell : GJBaseTableViewCell

@property (nonatomic, strong) UITextField *centerTF;
@property (nonatomic, strong) GJVerifyButton *codeBtn;
@property (nonatomic, copy) void (^blockBtnClick)(void);

- (void)setSelectTitle:(NSString *)title;

+ (GJApplyUserFormCell *)installTitle1:(NSString *)title1 title2:(NSString *)title2 rightImg:(NSString *)rightImg index:(NSInteger)index;

@end
