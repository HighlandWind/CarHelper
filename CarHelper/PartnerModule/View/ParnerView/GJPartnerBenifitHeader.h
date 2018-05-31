//
//  GJPartnerBenifitHeader.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@interface GJPartnerBenifitHeader : GJBaseView
@property (nonatomic, assign) BOOL isFromShop;
- (void)setLeft:(NSString *)left center:(NSString *)center right:(NSString *)right;
@end
