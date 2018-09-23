//
//  GJSpeechScreenView.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/23.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJSpeechScreenView.h"
#import "GJHomeSpeechButton.h"

static CGFloat BottomHeight = 130.0f;

@interface GJSpeechScreenView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UIImageView *closeBtnImgV;
@property (nonatomic, strong) GJHomeSpeechButton *speechBtn;
@property (nonatomic, strong) GJBaseTableView *tableView;
@end

@implementation GJSpeechScreenView

+ (GJSpeechScreenView *)installView {
    GJSpeechScreenView *view = [[GJSpeechScreenView alloc] initWithFrame:CGRectZero];
    [[UIApplication sharedApplication].keyWindow addSubview:view];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    self.backgroundColor = [UIColor clearColor];
    UIVisualEffect *ffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:ffect];
    effectView.frame = [UIScreen mainScreen].bounds;
    [self addSubview:effectView];
    
    CGFloat closeW = AdaptatSize(80);
    _closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_W-closeW, SCREEN_H-closeW, closeW, closeW)];
    _closeBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    _closeBtnImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back1"]];
    [_closeBtn addTarget:self action:@selector(closePage) forControlEvents:UIControlEventTouchUpInside];
    
    _speechBtn = [GJHomeSpeechButton install];
    
    [self addSubview:_closeBtn];
    [self addSubview:_closeBtnImgV];
    [self addSubview:_speechBtn];
    [self addSubview:self.tableView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_closeBtnImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_closeBtn);
    }];
    [_speechBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).with.offset(-AdaptatSize(20));
        make.width.height.mas_equalTo(AdaptatSize(60));
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset([UIApplication sharedApplication].statusBarFrame.size.height);
        make.left.right.equalTo(self);
        make.bottom.equalTo(_speechBtn.mas_top);
    }];
}

// add item spring aniamtion
- (void)addAnimationIsShow:(BOOL)show delay:(NSTimeInterval)delay animation:(BOOL)animation button:(UIButton *)button completion:(void(^)(BOOL finished))completion {
    
    CGAffineTransform transform;
    CGFloat alpha = show ? 1.0f : 0.0f;
    if (show) {
        transform = CGAffineTransformIdentity;
    }else {
        transform = CGAffineTransformMakeTranslation(0, BottomHeight);
    }
    
    if (!animation) {
        button.transform = transform;
        button.alpha = alpha;
        return;
    }
    [UIView animateWithDuration:0.8 delay:delay usingSpringWithDamping:0.4 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseOut animations:^{
        button.transform = transform;
        button.alpha = alpha;
    } completion:^(BOOL finished) {
        BLOCK_SAFE(completion)(finished);
    }];
}

- (void)closePage {
    __weak typeof(self)weakself = self;
    BLOCK_SAFE(_blockBack)();
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView transitionWithView:weakself duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            [weakself removeFromSuperview];
        } completion:^(BOOL finished) {
            [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        }];
//    });
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"111"];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = @"哈哈哈哈哈哈哈哈哈  我旁边有个傻X";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(50);
}

- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain view:self];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
