//
//  GJRegisterView.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/15.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"
#import "GJVerifyButton.h"

@interface GJRegisterView : GJBaseView

@property (nonatomic, copy) void (^getVerifyCodeClick)(NSString *phone);
@property (nonatomic, copy) void (^scanProtocolClick)(void);
@property (nonatomic, copy) void (^scanBtnClick)(void);
@property (nonatomic, copy) void (^blockSubmit)(NSString *recommandPhone, NSString *phone, NSString *code);
@property (nonatomic, strong) GJVerifyButton *getVerifyCodeBtn;
@property (nonatomic, strong) UITextField *phoneNumTF;
@property (nonatomic, strong) UIButton *submitBtn;

- (void)codeTFBecomrFirst;

@end
