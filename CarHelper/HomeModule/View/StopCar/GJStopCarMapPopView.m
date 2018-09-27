//
//  GJStopCarMapPopView.m
//  CarHelper
//
//  Created by hsrd on 2018/9/27.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJStopCarMapPopView.h"
#import "GJStopCarMapTBVCell.h"

@interface GJStopCarMapPopView () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UIButton *topBtn;
@property (nonatomic, strong) UIView *topBtnLine;
@property (nonatomic, strong) GJBaseTableView *tableView;
@end

@implementation GJStopCarMapPopView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _topBtn = [[UIButton alloc] init];
        _topBtn.titleLabel.font = [APP_CONFIG appAdaptBoldFontOfSize:16];
        [_topBtn setTitle:@" 花果园附近的停车场" forState:UIControlStateNormal];
        [_topBtn setTitleColor:APP_CONFIG.darkTextColor forState:UIControlStateNormal];
        [_topBtn setImage:[UIImage imageNamed:@"setup"] forState:UIControlStateNormal];
        [_topBtn sizeToFit];
        
        _topBtnLine = [[UIView alloc] init];
        _topBtnLine.backgroundColor = APP_CONFIG.separatorLineColor;
        
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain view:self];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addSubview:_topBtn];
        [self addSubview:_topBtnLine];
        [self addSubview:_tableView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [_topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(AdaptatSize(11));
    }];
    [_topBtnLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.mas_equalTo(2);
        make.top.equalTo(_topBtn.mas_bottom).with.offset(AdaptatSize(11));
    }];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(_topBtnLine.mas_bottom);
    }];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GJStopCarMapTBVCell *cell = [tableView dequeueReusableCellWithIdentifier:[GJStopCarMapTBVCell reuseIndentifier]];
    if (!cell) {
        cell = [[GJStopCarMapTBVCell alloc] initWithStyle:[GJStopCarMapTBVCell expectingStyle] reuseIdentifier:[GJStopCarMapTBVCell reuseIndentifier]];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return AdaptatSize(85);
}

@end
