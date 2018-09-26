//
//  GJHomeSpeechButton.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/23.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeSpeechButton.h"

@interface GJHomeSpeechButton ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation GJHomeSpeechButton

+ (GJHomeSpeechButton *)install {
    GJHomeSpeechButton *btn = [[GJHomeSpeechButton alloc] init];
    return btn;
}

- (void)speechButtonClick {
    BLOCK_SAFE(_speechClickBlock)();
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _button = [[UIButton alloc] init];
        _button.backgroundColor = APP_CONFIG.appMainColor;
        _button.clipsToBounds = YES;
        [_button addTarget:self action:@selector(speechButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button];
        
        self.layer.shadowColor = [UIColor blackColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity = 0.4;
        self.layer.shadowRadius = 6;
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    _button.frame = self.bounds;
    _button.layer.cornerRadius = self.height/2;
}

@end
