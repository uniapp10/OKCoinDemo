//
//  ViewController.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/11.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ViewController.h"
#import "ZDOKSetViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = [UIScreen mainScreen].bounds;
    CGFloat margin = 50;
    CGFloat btnW = (rect.size.width - 3 * margin) * 0.5;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(margin, 100, btnW, 50);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(redButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *greenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    greenButton.backgroundColor = [UIColor greenColor];
    greenButton.frame = CGRectMake(rect.size.width - btnW - margin, 100, btnW, 50);
    [self.view addSubview:greenButton];
    [greenButton addTarget:self action:@selector(greenButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)redButtonClick{
    ZDOKSetViewController *okSetVC = [[ZDOKSetViewController alloc] init];
    [self.navigationController pushViewController:okSetVC animated:true];
}

- (void)greenButtonClick{
    
}

@end
