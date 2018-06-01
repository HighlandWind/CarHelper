//
//  HeaderConstant.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#ifndef HeaderConstant_h
#define HeaderConstant_h

// APP settings
#define gj_dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#define UserInfoModelFile [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"userInfo.data"]
#define RegionDataFile [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"regionData.data"]

#define SCREEN_W                        [[UIScreen mainScreen] bounds].size.width
#define SCREEN_H                        [[UIScreen mainScreen] bounds].size.height
#define NavBar_H  (44 + [UIApplication sharedApplication].statusBarFrame.size.height)
#define GestureMinimumTranslation  10.0

#define AdaptatSize(width) (SCREEN_W*width/375.0f)
#undef    BLOCK_SAFE
#define BLOCK_SAFE(block)           if(block)block

// third-platform's key and secret
#define AMap_APPKEY             @""
#define WeChat_APPKEY           @""
#define WeChat_SECRET           @""
#define WeChat_REDIRECT         @""
#define QQ_APPID                @""
#define QQ_APPKEY               @""
#define QQ_REDIRECT             @""
#define UMeng_APPKEY            @"123"

#define APP_SCHEMES                     @"carhelper"

// notifications
#define AliPaySucessNotice              @"AliPaySucessNotice"
#define WeChatPaySucessNotice           @"WeChatPaySucessNotice"




#endif /* HeaderConstant_h */
