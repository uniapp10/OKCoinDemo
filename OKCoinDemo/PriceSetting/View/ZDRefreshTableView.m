//
//  ZDRefreshTableView.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/12.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDRefreshTableView.h"
#import "ZDRefreshCell.h"

@interface ZDRefreshTableView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation ZDRefreshTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.selectedIndex = 0;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZDRefreshCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDRefreshCell"];
    if (!cell) {
        cell = [[ZDRefreshCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZDRefreshCell"];
    }
    
    switch (indexPath.row) {
        case 0:
            cell.titleLabel.text = @"实时刷新";
            break;
            
        case 1:
            cell.titleLabel.text = @"固定频率刷新";
            break;
            
        default:
            cell.titleLabel.text = @"智能切换（WIFI下实时刷新）";
            cell.sepView.hidden = true;
            break;
    }
    
    if (indexPath.row == self.selectedIndex) {
        cell.iconView.hidden = false;
    }else {
        cell.iconView.hidden = true;
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedIndex = indexPath.row;
    [self reloadData];
}
@end
