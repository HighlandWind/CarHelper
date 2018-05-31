//
//  GJHomeBottomView.h
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@interface GJHomeBottomView : GJBaseView
@property (nonatomic, strong) void (^bottomScanBtnBlock)(void);
+ (GJHomeBottomView *)installWithText:(NSString *)text image:(NSString *)image;
@end
