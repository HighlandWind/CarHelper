//
//  GJPickerView.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/22.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPickerView.h"

@interface GJPickerView () <UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic, strong) UIPickerView *pickerView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIButton *leftBtn;
@end

@implementation GJPickerView

- (void)setDatas_col1:(NSArray *)datas_col1 {
    _datas_col1 = datas_col1;
    [_pickerView reloadComponent:0];
    [_pickerView selectRow:0 inComponent:0 animated:NO];
    if (_columns >= 2) {
        [_pickerView selectRow:0 inComponent:1 animated:NO];
    }
    if (_columns >= 3) {
        [_pickerView selectRow:0 inComponent:2 animated:NO];
    }
    _selectRowAtCol1 = 0;
    _selectRowAtCol2 = 0;
    _selectRowAtCol3 = 0;
}

- (void)setDatas_col2:(NSArray *)datas_col2 {
    _datas_col2 = datas_col2;
    [_pickerView reloadComponent:1];
}

- (void)setDatas_col3:(NSArray *)datas_col3 {
    _datas_col3 = datas_col3;
    [_pickerView reloadComponent:2];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)leftBtnClick {
    BLOCK_SAFE(_dismissSelf)();
}

- (void)rightBtnClick {
    BLOCK_SAFE(_selectRowAt)(_selectRowAtCol1, _selectRowAtCol2, _selectRowAtCol3);
}

#pragma mark - PickerView function
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return _columns;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return _datas_col1.count;
    }else if (component == 1) {
        return _datas_col2.count;
    }else if (component == 2) {
        return _datas_col3.count;
    }
    return 0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 30.0f;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (!view){
        view = [[UIView alloc]init];
    }
    
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width / _columns, 20)];
    text.textAlignment = NSTextAlignmentCenter;
    [view addSubview:text];
    
    if (component == 0) {
        text.text = _datas_col1[row];
    }else if (component == 1) {
        text.text = _datas_col2[row];
    }else if (component == 2) {
        text.text = _datas_col3[row];
    }else {
        text.text = @"";
    }
    
    //隐藏上下直线
    [self.pickerView.subviews objectAtIndex:1].backgroundColor = [UIColor clearColor];
    [self.pickerView.subviews objectAtIndex:2].backgroundColor = [UIColor clearColor];
    return view;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        _selectRowAtCol1 = row;
        if ([self.myDelegate respondsToSelector:@selector(blockReloadCol2:)]) {
            [self.myDelegate blockReloadCol2:row];
        }
    }
    if (component == 1) {
        _selectRowAtCol2 = row;
        if (_columns == 3) {
            if ([self.myDelegate respondsToSelector:@selector(blockReloadCol3:)]) {
                [self.myDelegate blockReloadCol3:row];
            }
        }
    }
    if (component == 2) {
        _selectRowAtCol3 = row;
    }
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor clearColor];
    
    _backView = [[UIView alloc] initWithFrame:self.bounds];
    _backView.backgroundColor = [UIColor whiteColor];
    _backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    _backView.layer.shadowOpacity = 1;
    _backView.layer.shadowRadius = 4.f;
    _backView.layer.shadowOffset = CGSizeMake(0,0);
    
    _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, AdaptatSize(30), _backView.width, _backView.height-AdaptatSize(30))];
    _pickerView.backgroundColor = [UIColor whiteColor];
    _pickerView.delegate = self;
    _pickerView.dataSource = self;
    
    _leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, AdaptatSize(80), AdaptatSize(50))];
    _leftBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:15]);
    [_leftBtn setTitle:@"取 消" forState:UIControlStateNormal];
    [_leftBtn setTitleColor:APP_CONFIG.blackTextColor forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_W-_leftBtn.width, 0, _leftBtn.width, _leftBtn.height)];
    _rightBtn.titleLabel.font = AdapFont([APP_CONFIG appFontOfSize:15]);
    [_rightBtn setTitle:@"完 成" forState:UIControlStateNormal];
    [_rightBtn setTitleColor:APP_CONFIG.blackTextColor forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_backView];
    [self addSubview:_pickerView];
    [self addSubview:_rightBtn];
    [self addSubview:_leftBtn];
}

@end
