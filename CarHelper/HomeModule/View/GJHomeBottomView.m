//
//  GJHomeBottomView.m
//  GaoYuanFeng
//
//  Created by hsrd on 2018/3/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJHomeBottomView.h"

@interface GJHomeBottomView ()
@property (nonatomic, strong) UIButton *bottomBtn;
@end

@implementation GJHomeBottomView

+ (GJHomeBottomView *)installWithText:(NSString *)text image:(NSString *)image {
    GJHomeBottomView *bottom = [[GJHomeBottomView alloc] init];
    [bottom.bottomBtn setTitle:text forState:UIControlStateNormal];
    if (!JudgeContainerCountIsNull(image)) {
        [bottom.bottomBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [bottom.bottomBtn setImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    }
    return bottom;
}

- (void)commonInit {
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.4;
    self.layer.shadowRadius = 7;
    
    _bottomBtn = [[UIButton alloc] initWithFrame:self.bounds];
    _bottomBtn.backgroundColor = [UIColor blackColor];
    _bottomBtn.layer.cornerRadius = 8;
    _bottomBtn.clipsToBounds = YES;
    _bottomBtn.titleLabel.font = AdapFont([APP_CONFIG appBoldFontOfSize:16]);
    [_bottomBtn setTitleColor:APP_CONFIG.whiteGrayColor forState:UIControlStateNormal];
    [_bottomBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
    [_bottomBtn addTarget:self action:@selector(bottomBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_bottomBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _bottomBtn.frame = CGRectMake(15, 5, self.width-30, AdaptatSize(59));
}

- (void)bottomBtnClick {
    BLOCK_SAFE(_bottomScanBtnBlock)();
}

@end
