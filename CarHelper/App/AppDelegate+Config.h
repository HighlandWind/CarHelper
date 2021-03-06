//
//  AppDelegate+Config.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//


#import "AppDelegate.h"
#import <UMSocialCore/UMSocialCore.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate (Config) <CLLocationManagerDelegate>

- (void)setupMainInterface;
- (void)setupThirdApy;
- (void)setupUnify;
- (BOOL)handelThirePayOpenURL:(NSURL *)url;
- (void)checkNetwork;
- (void)setupLogger;

@end
