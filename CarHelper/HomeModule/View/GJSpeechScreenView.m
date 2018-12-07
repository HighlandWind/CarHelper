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
@property (nonatomic,strong) UIView *bgView;
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
    
    _closeBtn = [[UIButton alloc] init];
    _closeBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    _closeBtnImgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_payway_gray_close"]];
    [_closeBtn addTarget:self action:@selector(closePage) forControlEvents:UIControlEventTouchUpInside];
    
    _speechBtn = [GJHomeSpeechButton install];
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor whiteColor];
    _bgView.layer.cornerRadius = 10;
    _bgView.clipsToBounds = YES;
    
    [self addSubview:self.tableView];
    [self addSubview:_bgView];
    [self addSubview:_speechBtn];
    [self addSubview:_closeBtn];
    [self addSubview:_closeBtnImgV];
    
    [self scrollToBottom];
    CGFloat tbvY = [UIApplication sharedApplication].statusBarFrame.size.height;
    if (IPHONE_X) tbvY -= 10;
    [UIView animateWithDuration:0.3 animations:^{
        [self.tableView setY:tbvY];
    } completion:^(BOOL finished) {
        [self.tableView reloadData];
    }];
}

- (void)scrollToBottom {
    CGFloat yOffset = 0;
    if (self.tableView.contentSize.height > self.tableView.bounds.size.height) {
        yOffset = self.tableView.contentSize.height - self.tableView.bounds.size.height;
    }
    [self.tableView setContentOffset:CGPointMake(0, yOffset) animated:NO];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self).with.offset(10);
        if (SCREEN_H >= kGJIphoneX) {
            make.height.mas_equalTo(AdaptatSize(120));
        }else {
            make.height.mas_equalTo(AdaptatSize(100));
        }
    }];
    [_speechBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.bgView).with.offset(AdaptatSize(15));
        make.width.height.mas_equalTo(AdaptatSize(70));
    }];
    [_closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.speechBtn);
        make.right.equalTo(self.bgView);
        make.width.height.mas_equalTo(AdaptatSize(50));
    }];
    [_closeBtnImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.closeBtn);
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
    NSInteger cellType = indexPath.row % 2;
    if (!cell) {
        NSString *reuseIndentifier = @"";
        if (cellType) reuseIndentifier = @"speech.cell.nor";
        else reuseIndentifier = @"speech.cell";
        cell = [[GJSpecchTBVCell alloc] initWithStyle:[GJSpecchTBVCell expectingStyle] reuseIdentifier:reuseIndentifier];
    }
    cell.cellType = cellType;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(100);
}

- (GJBaseTableView *)tableView {
    if (!_tableView) {
        CGFloat top = [UIApplication sharedApplication].statusBarFrame.size.height;
        CGFloat h = SCREEN_H - AdaptatSize(90) - top;
        if (IPHONE_X) h -= 20;
        CGRect rect = CGRectMake(0, top+h, self.width, h);
        _tableView = [[GJBaseTableView alloc] initWithFrame:rect style:UITableViewStylePlain view:self];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
