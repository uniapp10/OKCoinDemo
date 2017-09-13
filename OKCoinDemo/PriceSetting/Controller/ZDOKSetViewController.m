//
//  ZDOKSetViewController.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/11.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDOKSetViewController.h"
#import "ZDPriceContentView.h"
#import "ZDRefreshTableView.h"
#import "ZDSettingTableView.h"

@interface ZDOKSetViewController ()

@property (nonatomic, strong) ZDPriceContentView *priceContentView;
@property (nonatomic, strong) ZDRefreshTableView *refreshView;
@property (nonatomic, strong) ZDSettingTableView *settingView;

@end

@implementation ZDOKSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = GXB_RGBColor(240, 240, 240);
    [self setTitleView];
    [self addPriceView];
    self.navigationController.navigationBar.translucent = false;
}

- (void)setTitleView {
    UISegmentedControl *titleControl = [[UISegmentedControl alloc] initWithItems:@[@"价格提醒", @"行情刷新", @"显示设置"]];
    [titleControl addTarget:self action:@selector(segmentControlChanged:) forControlEvents:UIControlEventValueChanged];
    titleControl.frame = CGRectMake(0, 100, 240, 30);
    titleControl.tintColor = [UIColor whiteColor];
    [titleControl setTitleTextAttributes:@{NSForegroundColorAttributeName:GXB_RGBColor(64, 175, 250)} forState:UIControlStateSelected];
    [titleControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    titleControl.selectedSegmentIndex = 0;
    self.navigationItem.titleView = titleControl;
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"arrowR"] forState:UIControlStateNormal];
    [backBtn sizeToFit];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    backBtn.transform = CGAffineTransformMakeRotation(M_PI);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationController.navigationBar.barTintColor = GXB_RGBColor(64, 175, 250);
}
- (void)backBtnClick{
    [self.navigationController popViewControllerAnimated:true];
}

- (void)segmentControlChanged: (UISegmentedControl *)segmentC {
    switch (segmentC.selectedSegmentIndex) {
        case 0:
            [self addPriceView];
            break;
            
        case 1:
            [self addRefreshView];
            break;
            
        default:
            [self addSettingView];
            break;
    }
}

- (void)addPriceView {
    [self.view addSubview:self.priceContentView];
}

- (void)addRefreshView {
    [self.view addSubview:self.refreshView];
}

- (void)addSettingView {
    [self.view addSubview:self.settingView];
}

- (ZDPriceContentView *)priceContentView{
    if (!_priceContentView) {
        _priceContentView = [[ZDPriceContentView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, GXB_ScreenHeight)];
    }
    return _priceContentView;
}

- (ZDRefreshTableView *)refreshView {
    if (!_refreshView) {
        _refreshView = [[ZDRefreshTableView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, GXB_ScreenHeight) style:UITableViewStylePlain];
        _refreshView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _refreshView;
}

- (ZDSettingTableView *)settingView{
    if (!_settingView) {
        _settingView = [[ZDSettingTableView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, GXB_ScreenHeight) style:UITableViewStylePlain];
    }
    return _settingView;
}
@end
