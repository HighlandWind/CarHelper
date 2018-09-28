//
//  GJWashCarSearchTBVCell.m
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarSearchTBVCell.h"

@interface GJWashCarSearchTBVCell ()

@end

@implementation GJWashCarSearchTBVCell

- (void)commonInit {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.textLabel.font = [APP_CONFIG appAdaptFontOfSize:14];
    self.detailTextLabel.font = [APP_CONFIG appAdaptFontOfSize:11];
    self.textLabel.textColor = APP_CONFIG.darkTextColor;
    self.detailTextLabel.textColor = APP_CONFIG.grayTextColor;
    
    self.imageView.image = [UIImage imageNamed:@"setup"];
    self.textLabel.text = @"花果园购物中心";
    self.detailTextLabel.text = @"南明区 花果园大街1号";
}

@end
