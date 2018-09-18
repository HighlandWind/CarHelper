//
//  GJMineEvaluateMidCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineEvaluateMidCell.h"

@interface GJMineEvaluateMidCell ()
@property (nonatomic, strong) UITextView *textMidView;
@end

@implementation GJMineEvaluateMidCell

- (void)commonInit {
    _textMidView = [[UITextView alloc] init];
    _textMidView.font = [APP_CONFIG appAdaptFontOfSize:14];
    
    [self.contentView addSubview:_textMidView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_textMidView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (CGFloat)height {
    return AdaptatSize(200);
}

@end
