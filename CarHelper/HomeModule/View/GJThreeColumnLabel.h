//
//  GJThreeColumnLabel.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/16.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@interface GJThreeColumnLabel : GJBaseView

- (void)setLeft:(NSString *)left center:(NSString *)center right:(NSString *)right;

- (void)setTopLBColorLeft:(UIColor *)left center:(UIColor *)center right:(UIColor *)right;
- (void)setBtmLBColorLeft:(UIColor *)left center:(UIColor *)center right:(UIColor *)right;
- (void)setNumLabelFontBold;

+ (GJThreeColumnLabel *)installLeft:(NSString *)left center:(NSString *)center right:(NSString *)right;

@end
