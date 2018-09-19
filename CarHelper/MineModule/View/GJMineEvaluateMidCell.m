//
//  GJMineEvaluateMidCell.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/18.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJMineEvaluateMidCell.h"

@interface GJMineEvaluateMidCell () <UITextViewDelegate>
@property (nonatomic, strong) UITextView *textMidView;
@property (nonatomic, strong) UILabel *tvPlaceHolder;
@end

@implementation GJMineEvaluateMidCell

- (void)commonInit {
    _textMidView = [[UITextView alloc] init];
    _textMidView.font = [APP_CONFIG appAdaptFontOfSize:14];
    _textMidView.delegate = self;
    
    _tvPlaceHolder = [[UILabel alloc] initWithFrame:CGRectMake(5, 8, self.width, 30)];
    _tvPlaceHolder.font = AdapFont([APP_CONFIG appFontOfSize:14]);
    _tvPlaceHolder.text = @"您觉得环境怎么样，服务满意吗？位置好找吗？";
    _tvPlaceHolder.textColor = [UIColor colorWithHexRGB:@"#aaaaaa"];
    _tvPlaceHolder.numberOfLines = 0;
    [_tvPlaceHolder sizeToFit];
    
    [self.contentView addSubview:_textMidView];
    [_textMidView addSubview:_tvPlaceHolder];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_textMidView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    if ([textView.text isEqualToString:@""]) {
        _tvPlaceHolder.hidden = NO;
    }else {
        _tvPlaceHolder.hidden = YES;
    }
}

- (CGFloat)height {
    return AdaptatSize(200);
}

@end
