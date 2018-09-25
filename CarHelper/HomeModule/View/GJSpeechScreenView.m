//
//  GJSpeechScreenView.m
//  CarHelper
//
//  Created by Arlenly on 2018/9/23.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJSpeechScreenView.h"
#import "GJHomeSpeechButton.h"
#import "GJSpecchTBVCell.h"

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
    UIView *bgV = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_H-AdaptatSize(90), self.width, AdaptatSize(100))];
    bgV.backgroundColor = [UIColor whiteColor];
    bgV.layer.cornerRadius = 10;
    bgV.clipsToBounds = YES;
    
    [self addSubview:self.tableView];
    [self addSubview:bgV];
    [self addSubview:_speechBtn];
    [self addSubview:_closeBtn];
    [self addSubview:_closeBtnImgV];
    
    [UIView animateWithDuration:0.3 animations:^{
        [_tableView setY:[UIApplication sharedApplication].statusBarFrame.size.height];
    } completion:^(BOOL finished) {
        [_tableView reloadData];
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_closeBtnImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_closeBtn);
    }];
    [_speechBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self).with.offset(-AdaptatSize(15));
        make.width.height.mas_equalTo(AdaptatSize(60));
    }];
}

- (void)closePage {
    __weak typeof(self)weakself = self;
    BLOCK_SAFE(_blockBack)();
    [weakself removeFromSuperview];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJSpecchTBVCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJSpecchTBVCell reuseIndentifier]];
    if (!cell) {
        cell = [[GJSpecchTBVCell alloc] initWithStyle:[GJSpecchTBVCell expectingStyle] reuseIdentifier:[GJSpecchTBVCell reuseIndentifier]];
    }
    cell.cellType = indexPath.row % 2;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(100);
}

- (GJBaseTableView *)tableView {
    if (!_tableView) {
        CGFloat top = [UIApplication sharedApplication].statusBarFrame.size.height;
        CGFloat h = SCREEN_H-AdaptatSize(90)-top;
        CGRect rect = CGRectMake(0, top+h, self.width, h);
        _tableView = [[GJBaseTableView alloc] initWithFrame:rect style:UITableViewStylePlain view:self];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
