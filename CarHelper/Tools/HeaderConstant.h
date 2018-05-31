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
#define AMap_APPKEY                     @"80e0ef8cff4ad6abb51b86428ea74209"
#define WeChat_APPKEY           @"wxfa36e03676b9fc53"
#define WeChat_SECRET           @"ee6d40266fde0b5adc8170d2d4609ea2"
#define WeChat_REDIRECT         @""
#define QQ_APPID                @"wxfa36e03676b9fc53"
#define QQ_APPKEY               @""
#define QQ_REDIRECT             @""
#define UMeng_APPKEY            @"5aff8c62f29d987ac0000087"

#define APP_SCHEMES                     @"gaoyuanfengshop"

// notifications
#define AliPaySucessNotice              @"AliPaySucessNotice"
#define WeChatPaySucessNotice           @"WeChatPaySucessNotice"




#endif /* HeaderConstant_h */
