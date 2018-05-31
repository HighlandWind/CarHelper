//
//  GJPickerView.h
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/22.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJBaseView.h"

@protocol GJPickerViewDelegate <NSObject>
- (void)blockReloadCol2:(NSInteger)row;
- (void)blockReloadCol3:(NSInteger)row;
@end

@interface GJPickerView : GJBaseView

@property (nonatomic, weak) id <GJPickerViewDelegate> myDelegate;

@property (nonatomic, copy) void (^selectRowAt)(NSInteger col1, NSInteger col2, NSInteger col3);
@property (nonatomic, copy) void (^dismissSelf)(void);

@property (nonatomic, assign) NSInteger selectRowAtCol1;
@property (nonatomic, assign) NSInteger selectRowAtCol2;
@property (nonatomic, assign) NSInteger selectRowAtCol3;

@property (nonatomic, assign) NSInteger columns;
@property (nonatomic, strong) NSArray *datas_col1;
@property (nonatomic, strong) NSArray *datas_col2;
@property (nonatomic, strong) NSArray *datas_col3;

@end
