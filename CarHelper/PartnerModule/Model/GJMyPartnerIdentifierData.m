//
//  GJMyPartnerIdentifierData.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/23.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJMyPartnerIdentifierData.h"

@implementation GJMyPartnerIdentifierData
- (NSString *)tjr_phone {
    @try {
        if (_tjr_phone.length > 0) {
            NSMutableString *str = [[NSMutableString alloc] initWithString:_tjr_phone];
            [str replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
            return str;
        }else {
            return @"00000000000";
        }
    } @catch (NSException *exception) {
        return @"00000000000";
    }
}
@end

@implementation GJMyQRCodeData

@end
