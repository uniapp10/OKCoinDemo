//
//  ZDOKSetViewController.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/11.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDOKSetViewController.h"

@interface ZDOKSetViewController ()

@end

@implementation ZDOKSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    self.navigationController.navigationBar.translucent = true;
    UISegmentedControl *titleControl = [[UISegmentedControl alloc] initWithItems:@[@"价格提醒", @"行情刷新", @"显示设置"]];
    titleControl.frame = CGRectMake(0, 100, 240, 30);
    titleControl.tintColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleControl;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
