//
//  GJUserAccountManager.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJUserAccountManager.h"
#import "GJUserDefaults.h"

NSString *const kUserLoginStatuNotice = @"com.lgj.UserLoginStatuNotice";

@implementation GJUserAccountManager
SYNTHESIZE_SINGLETON_FOR_CLASS(GJUserAccountManager)

- (instancetype)init {
    if (self = [super init]) {
        self.userInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:UserInfoModelFile];
    }
    return self;
}

-(void)saveLoginUserInfo:(GJUserInfoData *)userInfo {
    if (self.userInfo) {
        self.userInfo = nil;
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager removeItemAtPath:UserInfoModelFile error:nil];
    }
    self.userInfo = userInfo;
    [NSKeyedArchiver archiveRootObject:self.userInfo toFile:UserInfoModelFile];
}

- (BOOL)isLoginStatus {
    if (self.userInfo) {
        return YES;
    }
    return NO;
}

-(void)loginOut {
    self.userInfo = nil;
    [[NSFileManager defaultManager] removeItemAtPath:UserInfoModelFile error:nil];
}

- (void)loginSucess:(NSDictionary *)info {
    self.userInfo  = [[GJUserInfoData alloc] init];
    [self.userInfo fillWithDictionary:info];
    [self saveLoginUserInfo:self.userInfo];
}

@end
