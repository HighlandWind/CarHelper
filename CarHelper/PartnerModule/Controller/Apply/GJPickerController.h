//
//  GJPickerController.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/22.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseViewController.h"
#import "GJPickerView.h"

@interface GJPickerController : GJBaseViewController

@property (nonatomic, strong) GJPickerView *pickerView;

@property (nonatomic, copy) void (^selectRowAt)(NSInteger col1, NSInteger col2, NSInteger col3);

- (void)presentSelf:(UIViewController *)context columns:(NSInteger)columns;

@end
