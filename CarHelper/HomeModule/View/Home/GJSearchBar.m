//
//  GJSearchBar.m
//  ZHYK
//
//  Created by hsrd on 2018/7/11.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJSearchBar.h"

@interface GJSearchBar () <UITextFieldDelegate>
// placeholder 和icon 和 间隙的整体宽度
@property (nonatomic, assign) CGFloat placeholderWidth;
@end


// icon宽度
static CGFloat const searchIconW = 20.0;
// icon与placeholder间距
static CGFloat const iconSpacing = 10.0;
// 占位文字的字体大小
static CGFloat const placeHolderFont = 13.0;

@implementation GJSearchBar

- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置背景图片
    [self setBackgroundImage:CreatImageWithColor([UIColor colorWithRGB:0 g:154 b:233])];
    // 重设field的frame
    UITextField *field = [self valueForKey:@"_searchField"];
    field.frame = CGRectMake(0, 0, self.frame.size.width-40.0, self.frame.size.height);
    [field setBackgroundColor:self.backgroundColor];
    field.textColor = [UIColor whiteColor];
    field.borderStyle = UITextBorderStyleNone;
    field.layer.cornerRadius = 2.0f;
    field.layer.masksToBounds = YES;
    field.tintColor = APP_CONFIG.whiteGrayColor;
    field.font = [APP_CONFIG appAdaptBoldFontOfSize:placeHolderFont];
    [field setValue:APP_CONFIG.whiteGrayColor forKeyPath:@"_placeholderLabel.textColor"];
    [field setValue:field.font forKeyPath:@"_placeholderLabel.font"];
    UIButton *clearButton = [field valueForKey:@"_clearButton"];
    [clearButton setImage:[UIImage imageNamed:@"home_circle_close"] forState:UIControlStateNormal];
    
    if (@available(iOS 11.0, *)) {
        // 先默认居中placeholder
        [self setPositionAdjustment:UIOffsetMake((field.frame.size.width-self.placeholderWidth)/2, 0) forSearchBarIcon:UISearchBarIconSearch];
    }
    
    [field.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:UIImageView.class]) {
            obj.hidden = YES;
        }
    }];
}

// 开始编辑的时候重置为靠左
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    // 继续传递代理方法
    if ([self.delegate respondsToSelector:@selector(searchBarShouldBeginEditing:)]) {
        [self.delegate searchBarShouldBeginEditing:self];
    }
    if (@available(iOS 11.0, *)) {
        [self setPositionAdjustment:UIOffsetZero forSearchBarIcon:UISearchBarIconSearch];
    }
    return YES;
}
// 结束编辑的时候设置为居中
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(searchBarShouldEndEditing:)]) {
        [self.delegate searchBarShouldEndEditing:self];
    }
    if (@available(iOS 11.0, *)) {
        [self setPositionAdjustment:UIOffsetMake((textField.frame.size.width-self.placeholderWidth)/2, 0) forSearchBarIcon:UISearchBarIconSearch];
    }
    return YES;
}

// 计算placeholder、icon、icon和placeholder间距的总宽度
- (CGFloat)placeholderWidth {
    if (!_placeholderWidth) {
        CGSize size = [self.placeholder boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[APP_CONFIG appAdaptFontOfSize:placeHolderFont]} context:nil].size;
        _placeholderWidth = size.width + iconSpacing + searchIconW + 5;
    }
    return _placeholderWidth;
}

@end
