//
//  GJBaseViewController.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GJBaseViewController : UIViewController

- (void)allowBack;
- (void)allowBackWithImage:(NSString *)image;
- (void)showShadorOnNaviBar:(BOOL)show;
- (void)showNaviSingleLine;
- (void)backAction;
- (void)setStatusBarLight:(BOOL)is;

@end
