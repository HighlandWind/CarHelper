//
//  GJGetCarMapTopView.m
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJGetCarMapTopView.h"

@interface GJGetCarMapTopView ()
@property (nonatomic, strong) UITextField *fieldView;
@end

@implementation GJGetCarMapTopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 7;
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOpacity = 0.2;
        self.layer.shadowRadius = 5.f;
        self.layer.shadowOffset = CGSizeMake(0,0);
        
        _fieldView = [[UITextField alloc] init];
        _fieldView.font = [APP_CONFIG appAdaptFontOfSize:15];
        _fieldView.placeholder = @"搜索地点";
        [_fieldView setValue:APP_CONFIG.grayTextColor forKeyPath:@"_placeholderLabel.textColor"];
        
        [self addSubview:_fieldView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_fieldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.bottom.equalTo(self);
        make.left.equalTo(self).with.offset(AdaptatSize(10));
    }];
}

@end
