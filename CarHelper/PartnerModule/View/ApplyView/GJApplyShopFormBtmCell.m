//
//  GJApplyShopFormBtmCell.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/21.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJApplyShopFormBtmCell.h"
#import "AlertManager.h"

#define TAG_ADDED_IMAGES 999
#define TAG_DELETE_IMAGES 1099

@interface GJApplyShopFormBtmCell ()
{
    CGFloat imageUploadedWidth;
    CGFloat selfHeight;
}

@property (nonatomic, strong) UIButton *addImageBtn;
@property (nonatomic, strong) UILabel *mostUploadRemindLB;

@end

@implementation GJApplyShopFormBtmCell

- (CGFloat)height {
    selfHeight = 235;
    
    return AdaptatSize(selfHeight);
}

#pragma mark - addSubViews
- (void)commonInit {
    imageUploadedWidth = (SCREEN_W - (13*5)) / 4;
    [self showTopLine];
    
    UILabel *uploadImageLB = [[UILabel alloc] init];
    uploadImageLB.font = AdapFont([APP_CONFIG appFontOfSize:14]);
    uploadImageLB.textColor = [UIColor grayColor];
    uploadImageLB.text = @"上传图片";
    [uploadImageLB sizeToFit];
    [self.contentView addSubview:uploadImageLB];
    [uploadImageLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(15);
        make.left.equalTo(self).with.offset(18);
    }];
    
    _mostUploadRemindLB = [[UILabel alloc] init];
    _mostUploadRemindLB.font = AdapFont([APP_CONFIG appFontOfSize:13]);
    _mostUploadRemindLB.textColor = [UIColor lightGrayColor];
    _mostUploadRemindLB.text = [NSString stringWithFormat:@"第一张图片作为店铺形象"];
    [_mostUploadRemindLB sizeToFit];
    [self.contentView addSubview:_mostUploadRemindLB];
    [_mostUploadRemindLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(uploadImageLB);
        make.left.equalTo(uploadImageLB.mas_right).with.offset(13);
    }];
    
    // addImageBtn
    _addImageBtn = [[UIButton alloc] init];
    _addImageBtn.titleLabel.font = [APP_CONFIG appFontOfSize:60];
    [_addImageBtn setImage:[UIImage imageNamed:@"release_demand_icon12"] forState:UIControlStateNormal];
    [_addImageBtn addTarget:self action:@selector(addImageBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_addImageBtn];
    if (!_imagesArr || _imagesArr.count == 0) {
        [_addImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(13);
            make.top.equalTo(_mostUploadRemindLB.mas_bottom).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(imageUploadedWidth, imageUploadedWidth));
        }];
    }
}

// 根据图片的x、y并添加UIImageView
- (void)addUploadedImageViewsIndex:(int)index x:(int)x y:(int)y {
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.tag = TAG_ADDED_IMAGES + index;
    imageView.image = _imagesArr[index];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageView:)];
    tap.numberOfTapsRequired = 1;
    [imageView addGestureRecognizer:tap];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(imageVLongPress:)];
    longPress.minimumPressDuration = 1.0;
    [imageView addGestureRecognizer:longPress];
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(imageUploadedWidth, imageUploadedWidth));
        make.top.equalTo(_mostUploadRemindLB.mas_bottom).with.offset(10 + y * (imageUploadedWidth + 13));
        make.left.equalTo(self).with.offset(13 + x * (imageUploadedWidth + 13));
    }];
    
    CGFloat deleteBtnWidth = 20;
    UIButton *deleteBtn = [[UIButton alloc] init];
    deleteBtn.titleLabel.font = [APP_CONFIG appFontOfSize:16];
    deleteBtn.tag = TAG_DELETE_IMAGES + index;
    [deleteBtn setImage:[UIImage imageNamed:@"release_demand_icon11"] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:deleteBtn];
    [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(deleteBtnWidth, deleteBtnWidth));
        make.centerX.equalTo(imageView.mas_right);
        make.centerY.equalTo(imageView.mas_top);
    }];
}

#pragma mark - Event response
- (void)imageVLongPress:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state != UIGestureRecognizerStateBegan) return;
    __block NSInteger index = longPress.view.tag - TAG_ADDED_IMAGES;
    [AlertManager showAlertTitle:nil content:@"是否要删除上传的图片" viecontroller:self.context cancel:@"否" sure:@"是" cancelHandle:nil sureHandle:^{
        BLOCK_SAFE(_blockDeleteBtnClick)(index);
    }];
}

- (void)addImageBtnClick {
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:@"上传图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        BLOCK_SAFE(_blockCamera)();
    }];
    [sheet addAction:photo];
    
    UIAlertAction *album = [UIAlertAction actionWithTitle:@"用户相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        BLOCK_SAFE(_blockAlbum)();
    }];
    [sheet addAction:album];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [sheet addAction:cancel];
    UIViewController *vc = [GJFunctionManager CurrentTopViewcontroller];
    dispatch_async(dispatch_get_main_queue(), ^{
        [vc presentViewController:sheet animated:YES completion:nil];
    });
}

- (void)tapImageView:(UITapGestureRecognizer *)tap {
    BLOCK_SAFE(_blockImageViewTap)(tap.view.tag - TAG_ADDED_IMAGES, (UIImageView *)tap.view);
}

- (void)deleteBtnClick:(UIButton *)btn {
    BLOCK_SAFE(_blockDeleteBtnClick)(btn.tag - TAG_DELETE_IMAGES);
}

#pragma mark - Getter/Setter
- (void)setImagesArr:(NSArray *)imagesArr {
    _imagesArr = imagesArr;
    
    if (_imagesArr) [self refreshImageViews];
}

#pragma mark - Private methods
// 选择了新的图片，更新图片位置
- (void)refreshImageViews {
    for (UIView *view in self.contentView.subviews)
        if (view.tag >= TAG_ADDED_IMAGES) [view removeFromSuperview];
    
    NSUInteger imageCounts = _imagesArr.count;
    NSUInteger column = 4;
    NSUInteger row = imageCounts%column==0 ? imageCounts/column : imageCounts/column+1;
    NSUInteger rowReal = row*column==imageCounts ? row : row-1;
    int index = 0;
    
    // addImageBtn
    if (imageCounts == MAX_UPLOAD_IMAGES) {
        _addImageBtn.hidden = YES;
        -- rowReal;
    }else {
        [_addImageBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(imageUploadedWidth, imageUploadedWidth));
            make.top.equalTo(_mostUploadRemindLB.mas_bottom).with.offset(10+rowReal*(imageUploadedWidth+13));
            make.left.equalTo(self).with.offset(13+imageCounts%column*(imageUploadedWidth+13));
        }];
        _addImageBtn.hidden = NO;
    }
    
    // 计算图片的x、y
    @try {
        // imageViews
        for (int y = 0; y < row; y ++) {
            for (int x = 0; x < column; x ++) {
                if (index == imageCounts) return ;
                [self addUploadedImageViewsIndex:index x:x y:y];
                index ++;
            }
        }
    } @catch (NSException *exception) {
    }
}

- (void)showTopLine {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = APP_CONFIG.separatorLineColor;
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.top.equalTo(self).with.offset(5);
        make.height.mas_equalTo(1);
    }];
}

@end
