//
//  TKWebJSContent.m
//  TongKe
//
//  Created by arlen on 2017/7/21.
//  Copyright © 2017年 BBD. All rights reserved.
//

#import "TKWebJSContent.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "GJUserDefaults.h"
#import "TKWebMedia.h"
#import "AlertManager.h"
#import "GJSystemHelper.h"

@interface TKWebJSContent ()
@property (strong, nonatomic) GJSystemHelper *systemHelper;

@end

@implementation TKWebJSContent
-(id)initWith:(JSContext *)context {
    self = [super init];
    if (self) {
        self.systemHelper = [GJSystemHelper system];
        self.context = context;
    }
    return self;
}

- (void)configJsContentByController:(UIViewController *)controller webView:(UIWebView *)webView {
    
//    __weak typeof(self)weakSelf = self;
    
    self.byController = controller;
    
    
    
}

#pragma mark - 分享
- (void)shareAction:(UIBarButtonItem *)item {
    ShowProgressHUD(YES, nil);
//    __block UIImage *image;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^{
        // To do background task
//        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:_picUrl]];
//        UIImage *urlImage = [UIImage imageWithData:imageData];
//        image = [UIImage imageWithData:[UIImage imageObjectToData:urlImage andCompressionQuality:0.5 andMaxSize:200]];
        dispatch_async(dispatch_get_main_queue(), ^{
            ShowProgressHUD(NO, nil);
//            [[GJFunctionManager CurrentTopViewcontroller] popShareViewID:nil type:0 title:_title desc:_content urlStr:_jumpUrl icon:image];
        });
    });
}

#pragma mark - 相册资源
- (void)chooseTakePhotoByController:(UIViewController *)vc webView:(UIWebView *)webView {
    __weak typeof(self)weakSelf = self;
    [_systemHelper vistiSystemTakePhoto:^(UIImage *image) {
        [weakSelf upDateImage:image webView:webView];
    } failure:^{
    } presentController:vc];
}

- (void)chooseAlbumByController:(UIViewController *)vc webView:(UIWebView *)webView {
    __weak typeof(self)weakSelf = self;
    [_systemHelper vistiSystemAlbum:^(UIImage *image) {
        [weakSelf upDateImage:image webView:webView];
    } failure:^{} presentController:vc];
}

- (void)upDateImage:(UIImage *)image webView:(UIWebView *)webView{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^{
        // To do background task
//        NSData *scaleImgData = [UIImage imageObjectToData:image];
//        NSString *sta = [scaleImgData base64Encoding];
//        NSString *js = [NSString stringWithFormat:@"window.H5.setPicture('%@')",sta];
//          [webView stringByEvaluatingJavaScriptFromString:js];
        dispatch_async(dispatch_get_main_queue(), ^{
            // To do UI
          
        });
    });
}

@end
