//
//  GJApplyShopFormBtmCell.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/21.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseTableViewCell.h"

// 最多可选择图片张数
#define MAX_UPLOAD_IMAGES 8

@interface GJApplyShopFormBtmCell : GJBaseTableViewCell

@property (nonatomic, copy) void (^blockCamera) (void);
@property (nonatomic, copy) void (^blockAlbum) (void);
@property (nonatomic, copy) void (^blockDeleteBtnClick) (NSUInteger index);
@property (nonatomic, copy) void (^blockImageViewTap) (NSUInteger index, UIImageView *view);

@property (nonatomic, strong) NSArray *imagesArr;
@property (nonatomic, strong) UIViewController *context;


@end
