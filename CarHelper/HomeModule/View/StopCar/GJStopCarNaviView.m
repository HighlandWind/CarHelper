//
//  GJStopCarNaviView.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/26.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJStopCarNaviView.h"

@interface GJStopCarNaviView ()
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *backBtn;
@property (nonatomic, strong) UITextField *fieldView;
@property (nonatomic, strong) UIButton *speechBtn;
@property (nonatomic, strong) UIButton *moreBtn;
@end

@implementation GJStopCarNaviView

- (void)backBtnClick {
    BLOCK_SAFE(_blockBackClick)();
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor whiteColor];
        _backView.layer.cornerRadius = 5;
        _backView.layer.shadowColor = [UIColor blackColor].CGColor;
        _backView.layer.shadowOpacity = 0.2;
        _backView.layer.shadowRadius = 5.f;
        _backView.layer.shadowOffset = CGSizeMake(0,0);
        
        _backBtn = [[UIButton alloc] init];
        [_backBtn setImage:[UIImage imageNamed:@"arrow_left_back"] forState:UIControlStateNormal];
        [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _fieldView = [[UITextField alloc] init];
        _fieldView.font = [APP_CONFIG appAdaptFontOfSize:15];
        _fieldView.placeholder = @"请输入目的地";
        [_fieldView setValue:APP_CONFIG.grayTextColor forKeyPath:@"_placeholderLabel.textColor"];
        
        _speechBtn = [[UIButton alloc] init];
        [_speechBtn setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
        
        _moreBtn = [[UIButton alloc] init];
        _moreBtn.layer.cornerRadius = 5;
        _moreBtn.clipsToBounds = YES;
        [_moreBtn setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
        
        [self addSubview:_backView];
        [self addSubview:_backBtn];
        [self addSubview:_fieldView];
        [self addSubview:_speechBtn];
        [self addSubview:_moreBtn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.height.mas_equalTo(42);
        make.left.equalTo(self).with.offset(AdaptatSize(25));
        make.right.equalTo(self).with.offset(-AdaptatSize(25));
    }];
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.equalTo(_backView);
        make.width.equalTo(_backView.mas_height);
        make.left.equalTo(_backView).with.offset(7);
    }];
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.equalTo(_backView);
        make.width.equalTo(_backView.mas_height);
        make.right.equalTo(_backView);
    }];
    [_speechBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.equalTo(_backView);
        make.width.equalTo(_backView.mas_height);
        make.right.equalTo(_moreBtn.mas_left);
    }];
    [_fieldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.equalTo(_backView);
        make.left.equalTo(_backBtn.mas_right).with.offset(AdaptatSize(10));
        make.right.equalTo(_speechBtn.mas_left);
    }];
}

@end
