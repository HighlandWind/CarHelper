//
//  GJHomeVC.m
//  CarHelper
//
//  Created by Arlenly on 2018/6/12.
//  Copyright © 2018年 CAR. All rights reserved.
//

#import "GJHomeVC.h"
#import "GJHomeTopView.h"
#import "GJHomeTopCell.h"
#import "GJHomeParkingCell.h"
#import "GJNearbyCell.h"
#import "GJScheduleCell.h"
#import "GJHomeTopImage.h"
#import "GJHomeSpeechButton.h"
#import "GJSpeechScreenView.h"
#import "GJCarPoolVC.h"
#import "GJStopACarVC.h"
#import "GJWashACarVC.h"

@interface GJHomeVC () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) GJHomeTopView *topView;
@property (nonatomic, strong) GJHomeTopImage *topBgImg;
@property (nonatomic, assign) CGFloat topBgImgHeight;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) GJBaseTableView *tableView;
@property (nonatomic, strong) NSArray <GJBaseTableViewCell *> *cells;
@property (nonatomic, strong) GJHomeTopCell *topCell;
@property (nonatomic, strong) GJNearbyCell *nearbyCell;
@property (nonatomic, strong) GJHomeSpeechButton *speechBtn;
@end

@implementation GJHomeVC

#pragma mark - View controller life circle
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _topView.frame = CGRectMake(0, 0, self.view.width, _topView.searchHeight);
    _topBgImg.frame = CGRectMake(0, 0, self.view.width, _topBgImgHeight);
    _backView.frame = CGRectMake(0, _topBgImg.height, self.view.width, self.view.height-_topBgImg.height);
    _tableView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    [_speechBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view).with.offset(-AdaptatSize(20));
        make.width.mas_equalTo(AdaptatSize(60));
        make.height.mas_equalTo(AdaptatSize(60));
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializationData];
    [self initializationSubView];
    [self initializationNetWorking];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setStatusBarLight:YES];
}

#pragma mark - Iniitalization methods
- (void)initializationData {
    _backView = [[UIView alloc] init];
    _backView.backgroundColor = APP_CONFIG.appBackgroundColor;
    
    _topCell = [[GJHomeTopCell alloc] init];
    GJHomeParkingCell *parkingCell = [[GJHomeParkingCell alloc] init];
    _nearbyCell = [[GJNearbyCell alloc] init];
    GJScheduleCell *scheduleCell = [[GJScheduleCell alloc] init];
    
    _cells = @[_topCell, parkingCell, _nearbyCell, scheduleCell];
    
    _topBgImgHeight = _topCell.height - 15;
}

- (void)initializationSubView {
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self.view addSubview:self.backView];
    [self.view addSubview:self.topBgImg];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.topView];
    [self.view addSubview:self.speechBtn];
    [self blockHanddle];
}

- (void)initializationNetWorking {
    [_topBgImg sd_setImageWithURL:[NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1533284438509&di=21e32c93671a719447ecb2221b106b61&imgtype=0&src=http%3A%2F%2Fpic.5442.com%3A82%2F2014%2F0929%2F04%2F03.jpg%2521960.jpg"]];
    _nearbyCell.leftTBVDatas =@[@"花果园金融街停车场", @"亚太中心停车场", @"好卡博尔其背后去不去而", @"偶尔去日本和空气哦", @"惹不起不确认确认白求恩", @"而不去日本"];
}

#pragma mark - Request Handle


#pragma mark - Private methods
- (void)blockHanddle {
    __weak typeof(self)weakself = self;
    _topView.blockSearch = ^(NSString *searchText) {
        
    };
    _topView.blockSpeech = ^{
        
    };
    _topView.blockAdd = ^{
        
    };
    _topCell.blockClickFiveBtns = ^(NSInteger tag) {
        GJBaseViewController *vc;
        if (tag == 1) {
            GJStopACarVC *stop = [[GJStopACarVC alloc] init];
            [stop pushPageWith:weakself];
        }else if (tag == 2) {
            vc = [[GJWashACarVC alloc] init];
        }else if (tag == 3) {
            vc = [[GJCarPoolVC alloc] init];
        }
        if (vc) {
            vc.hidesBottomBarWhenPushed = YES;
            [weakself.view endEditing:YES];
            [weakself.navigationController pushViewController:vc animated:YES];
        }
    };
    _nearbyCell.blockClickScanMap = ^{
        GJStopACarVC *stop = [[GJStopACarVC alloc] init];
        [stop pushPageWith:weakself];
    };
    _speechBtn.speechClickBlock = ^{
        weakself.speechBtn.hidden = YES;
        GJSpeechScreenView *v = [GJSpeechScreenView installView];
        v.blockBack = ^{
            weakself.speechBtn.hidden = NO;
        };
    };
}

#pragma mark - Public methods


#pragma mark - Event response


#pragma mark - Custom delegate


#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cells[indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cells[indexPath.row].height;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == _tableView) {
        CGFloat yyy = scrollView.contentOffset.y;
        [_topView setBgAlpha:yyy / (_topView.height - _topBgImg.y)];
        if (yyy < 0) {
            [_topBgImg setHeight:_topBgImgHeight - yyy];
            [_topBgImg setWidth:self.view.width - yyy];
            [_topBgImg setCenterX:self.view.centerX];
        }
    }
}

#pragma mark - Getter/Setter
- (GJHomeTopView *)topView {
    if (!_topView) {
        _topView = [GJHomeTopView install];
    }
    return _topView;
}

- (GJBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[GJBaseTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain controller:self];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setContentInset:UIEdgeInsetsMake(0, 0, AdaptatSize(90), 0)];
    }
    return _tableView;
}

- (GJHomeTopImage *)topBgImg {
    if (!_topBgImg) {
        _topBgImg = [[GJHomeTopImage alloc] init];
    }
    return _topBgImg;
}

- (GJHomeSpeechButton *)speechBtn {
    if (!_speechBtn) {
        _speechBtn = [GJHomeSpeechButton install];
    }
    return _speechBtn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
