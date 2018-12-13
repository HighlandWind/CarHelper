//
//  GJWashCarSearchTBVHeader.m
//  CarHelper
//
//  Created by hsrd on 2018/9/28.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJWashCarSearchTBVHeader.h"

@interface GJWashCarSearchTBVHeader ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *yuyinBtn;
@property (nonatomic, strong) UITextField *fieldView;
@end

@implementation GJWashCarSearchTBVHeader

- (void)yuyinBtnClick {
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _backView = [[UIView alloc] init];
        _backView.layer.cornerRadius = AdaptatSize(30) / 2;
        _backView.clipsToBounds = YES;
        _backView.backgroundColor = APP_CONFIG.appBackgroundColor;
        
        _yuyinBtn = [[UIButton alloc] init];
        [_yuyinBtn setImage:[UIImage imageNamed:@"mine_setup"] forState:UIControlStateNormal];
        [_yuyinBtn addTarget:self action:@selector(yuyinBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _fieldView = [[UITextField alloc] init];
        _fieldView.font = [APP_CONFIG appAdaptFontOfSize:14];
        _fieldView.placeholder = @"请输入目的地";
        [_fieldView setValue:APP_CONFIG.grayTextColor forKeyPath:@"_placeholderLabel.textColor"];
        
        [self addSubview:_backView];
        [self addSubview:_fieldView];
        [self addSubview:_yuyinBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(AdaptatSize(20));
        make.right.equalTo(self).with.offset(-AdaptatSize(20));
        make.top.equalTo(self).with.offset(AdaptatSize(10));
        make.bottom.equalTo(self).with.offset(-AdaptatSize(10));
    }];
    [_yuyinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.backView);
        make.right.equalTo(self.backView).with.offset(-10);
        make.width.height.equalTo(self.backView.mas_height);
    }];
    [_fieldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backView).with.offset(AdaptatSize(30));
        make.right.equalTo(self.yuyinBtn.mas_left);
        make.top.bottom.equalTo(self.backView);
    }];
}

@end
