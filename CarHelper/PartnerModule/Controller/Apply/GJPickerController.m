//
//  GJPickerController.m
//  GaoYuanFengStore
//
//  Created by hsrd on 2018/5/22.
//  Copyright © 2018年 HSRD. All rights reserved.
//

#import "GJPickerController.h"

@interface GJPickerController ()

@end

@implementation GJPickerController

- (void)presentSelf:(UIViewController *)context columns:(NSInteger)columns {
    _pickerView.columns = columns;
    [context presentViewController:self animated:YES completion:nil];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
        self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak typeof(self)weakSelf = self;
    [self.view addSubview:self.pickerView];
    _pickerView.selectRowAt = ^(NSInteger col1, NSInteger col2, NSInteger col3) {
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
        BLOCK_SAFE(weakSelf.selectRowAt)(col1, col2, col3);
    };
    _pickerView.dismissSelf = ^{
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (GJPickerView *)pickerView {
    if (!_pickerView) {
        _pickerView = [[GJPickerView alloc] initWithFrame:CGRectMake(0, self.view.height-self.view.height/4, SCREEN_W, self.view.height/4)];
    }
    return _pickerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
