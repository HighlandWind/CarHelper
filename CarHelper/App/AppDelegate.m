//
//  AppDelegate.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Config.h"

@interface AppDelegate ()
@property (nonatomic, strong) CLLocationManager *locationmanager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupMainInterface];
    [self setupThirdApy];
    [self setupUnify];
    [self checkNetwork];
    [self setupLogger];
    
    [UIApplication sharedApplication].idleTimerDisabled = TRUE;
    _locationmanager = [[CLLocationManager alloc] init];
    [_locationmanager requestAlwaysAuthorization];       //NSLocationAlwaysUsageDescription
    [_locationmanager requestWhenInUseAuthorization];    //NSLocationWhenInUseDescription
    _locationmanager.delegate = self;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    
}

#pragma mark - Result callback of Alipay payment
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    BOOL ret = NO;
    ret = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
    ret = [self handelThirePayOpenURL:url];
    return ret;
}

// after 9.0
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options {
    BOOL ret = NO;
    ret = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    ret = [self handelThirePayOpenURL:url];
    return ret;
}

// before 9.0
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    BOOL result;
    result = [[UMSocialManager defaultManager] handleOpenURL:url];
    result = [self handelThirePayOpenURL:url];
    return result;
}

@end
