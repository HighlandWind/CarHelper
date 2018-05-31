//
//  GJRecommandRelatedHeader.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/17.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJRecommandRelatedHeader.h"
#import "GJRecommandFiveBtn.h"

@interface GJRecommandRelatedHeader ()
@property (nonatomic, strong) GJRecommandFiveBtn *button1;
@property (nonatomic, strong) GJRecommandFiveBtn *button2;
@property (nonatomic, strong) GJRecommandFiveBtn *button3;
@property (nonatomic, strong) GJRecommandFiveBtn *button4;
@property (nonatomic, strong) GJRecommandFiveBtn *button5;
@property (nonatomic, strong) GJRecommandFiveBtn *currentBtn;
@end

@implementation GJRecommandRelatedHeader

- (void)commonInit {
    self.backgroundColor = [UIColor colorWithRGB:51 g:51 b:51];
    
    _button1 = [GJRecommandFiveBtn install];
    _button1.selected = YES;
    _button2 = [GJRecommandFiveBtn install];
    _button3 = [GJRecommandFiveBtn install];
    _button4 = [GJRecommandFiveBtn install];
    _button5 = [GJRecommandFiveBtn install];
    _currentBtn = _button1;
    
    [self addSubview:_button1];
    [self addSubview:_button2];
    [self addSubview:_button3];
    [self addSubview:_button4];
    [self addSubview:_button5];
    
    [_button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_button4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_button5 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setNumber:(NSString *)number atIndex:(NSInteger)idx {
    if (idx == 0) {
        [_button1 setTitle:number];
    }else if (idx == 1) {
        [_button2 setTitle:number];
    }else if (idx == 2) {
        [_button3 setTitle:number];
    }else if (idx == 3) {
        [_button4 setTitle:number];
    }else if (idx == 4) {
        [_button5 setTitle:number];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.width / 5;
    _button1.frame = CGRectMake(0, 0, width, self.height);
    _button2.frame = CGRectMake(width, 0, self.width/5, self.height);
    _button3.frame = CGRectMake(width*2, 0, width, self.height);
    _button4.frame = CGRectMake(width*3, 0, width, self.height);
    _button5.frame = CGRectMake(width*4, 0, width, self.height);
    
    [_button1 setDetail:@"发展店铺"];
    [_button2 setDetail:@"初级合伙"];
    [_button3 setDetail:@"区县代理"];
    [_button4 setDetail:@"城市领袖"];
    [_button5 setDetail:@"天使投资"];
}

- (CGFloat)height {
    return AdaptatSize(100);
}

- (void)buttonClick:(UIButton *)btn {
    btn.selected = YES;
    
    if (btn == _button1 && _currentBtn != _button1) {
        _button2.selected = NO;
        _button3.selected = NO;
        _button4.selected = NO;
        _button5.selected = NO;
        _currentBtn = _button1;
        BLOCK_SAFE(_blockClickItems)(0);
    }else if (btn == _button2 && _currentBtn != _button2) {
        _button1.selected = NO;
        _button3.selected = NO;
        _button4.selected = NO;
        _button5.selected = NO;
        _currentBtn = _button2;
        BLOCK_SAFE(_blockClickItems)(1);
    }else if (btn == _button3 && _currentBtn != _button3) {
        _button2.selected = NO;
        _button1.selected = NO;
        _button4.selected = NO;
        _button5.selected = NO;
        _currentBtn = _button3;
        BLOCK_SAFE(_blockClickItems)(2);
    }else if (btn == _button4 && _currentBtn != _button4) {
        _button2.selected = NO;
        _button3.selected = NO;
        _button1.selected = NO;
        _button5.selected = NO;
        _currentBtn = _button4;
        BLOCK_SAFE(_blockClickItems)(3);
    }else if (btn == _button5 && _currentBtn != _button5) {
        _button2.selected = NO;
        _button3.selected = NO;
        _button4.selected = NO;
        _button1.selected = NO;
        _currentBtn = _button5;
        BLOCK_SAFE(_blockClickItems)(4);
    }
}

@end
