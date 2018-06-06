//
//  GJTabBarController.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJTabBarController.h"
#import "GJTabBar.h"
#import "GJHomeViewController.h"
#import "GJPartnerShipController.h"
#import "GJMineCenterController.h"

@interface GJTabBarController () <LGJTabBarDelegate, UITabBarControllerDelegate>
@property (nonatomic, strong) GJHomeViewController *homePageVC;
@property (nonatomic, strong) GJPartnerShipController *partnerVC;
@property (nonatomic, strong) GJMineCenterController *mineVC;

@end

@implementation GJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    // Create owner-tabbar, use KVC repleace system-tabbar  with owner-tabbar.
    GJTabBar *tabbar = [[GJTabBar alloc] init];
    tabbar.myDelegate = self;
//    [self setValue:tabbar forKeyPath:@"tabBar"];
    
    _homePageVC = [[GJHomeViewController alloc] init];
    _partnerVC = [[GJPartnerShipController alloc] init];
    _mineVC = [[GJMineCenterController alloc] init];
    
    GJBaseNavigationController *firstTab = [self createTabItemVC:_homePageVC norImg:@"shopB" selectImg:@"shopA" Title:@"首页"];
    GJBaseNavigationController *secTab = [self createTabItemVC:_partnerVC norImg:@"partnerB" selectImg:@"partnerA" Title:@"合伙"];
    GJBaseNavigationController *fourTab = [self createTabItemVC:_mineVC norImg:@"userB" selectImg:@"userA" Title:@"我的"];
    
    self.viewControllers = @[firstTab, secTab, fourTab];
    self.selectedIndex = 0;
    [self setBartitleColor];
}

- (void)setBartitleColor{
    [[UITabBar appearance] setTranslucent:NO];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexRGB:@"999999"]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:APP_CONFIG.appMainRedColor} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -3)];
}

- (GJBaseNavigationController *)createTabItemVC:(UIViewController *)vc norImg:(NSString *)norImg selectImg:(NSString *)selectImg  Title:(NSString *)title {
    GJBaseNavigationController *tab = [[GJBaseNavigationController alloc] initWithRootViewController:vc];
    tab.tabBarItem.image = [[UIImage imageNamed:norImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab.tabBarItem.selectedImage = [[UIImage imageNamed:selectImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tab.tabBarItem.title = title;
    return tab;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
