//
//  GJTypeFile.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/21.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    ScanCenterType1 = 200
} ScanCenterType;

typedef enum : NSInteger {
    WeChatPay,
    ZhiFuBaoPay,
    UnionPay
} PayTypes;

@interface GJTypeFile : NSObject

@end
