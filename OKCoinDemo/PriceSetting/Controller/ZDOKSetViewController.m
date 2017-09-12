//
//  ZDOKSetViewController.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/11.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDOKSetViewController.h"
#import "ZDPriceTableView.h"
#import "ZDRefreshTableView.h"

@interface ZDOKSetViewController ()

@property (nonatomic, strong) ZDPriceTableView *priceView;
@property (nonatomic, strong) ZDRefreshTableView *refreshView;

@end

@implementation ZDOKSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitleView];
    [self addPriceView];
    self.navigationController.navigationBar.translucent = false;
}

- (void)setTitleView {
    UISegmentedControl *titleControl = [[UISegmentedControl alloc] initWithItems:@[@"价格提醒", @"行情刷新", @"显示设置"]];
    [titleControl addTarget:self action:@selector(segmentControlChanged:) forControlEvents:UIControlEventValueChanged];
    titleControl.frame = CGRectMake(0, 100, 240, 30);
    titleControl.tintColor = [UIColor whiteColor];
    [titleControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateSelected];
    [titleControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    titleControl.selectedSegmentIndex = 0;
    self.navigationItem.titleView = titleControl;
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"arrowR"] forState:UIControlStateNormal];
    [backBtn sizeToFit];
    [backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    backBtn.transform = CGAffineTransformMakeRotation(M_PI);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
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
            break;
    }
}

- (void)addPriceView {
    [self.view addSubview:self.priceView];
}

- (void)addRefreshView {
    [self.view addSubview:self.refreshView];
}

- (ZDPriceTableView *)priceView {
    if (!_priceView) {
        _priceView = [[ZDPriceTableView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, GXB_ScreenHeight) style:UITableViewStylePlain];
        _priceView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _priceView;
}

- (ZDRefreshTableView *)refreshView {
    if (!_refreshView) {
        _refreshView = [[ZDRefreshTableView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, GXB_ScreenHeight) style:UITableViewStylePlain];
        _refreshView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _refreshView;
}

@end
