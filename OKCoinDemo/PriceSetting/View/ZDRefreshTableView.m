//
//  ZDRefreshTableView.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/12.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDRefreshTableView.h"
#import "ZDRefreshCell.h"
#define SelectedIndex @"SelectedIndex"

@interface ZDRefreshTableView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) NSInteger selectedIndex;

@end

@implementation ZDRefreshTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        
        self.selectedIndex = [[GXB_Userdefult objectForKey:SelectedIndex] integerValue];
        if (!self.selectedIndex) {
            self.selectedIndex = 0;
        }
        [self addFooterView];
    }
    return self;
}

- (void)addFooterView {
    UIImageView *infoImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"info"]];
    UILabel *infoL = [[UILabel alloc] init];
    infoL.text = @"说明：理论上实时刷新相比固定频率刷新可能要消耗更多的网络流量";
    infoL.contentMode = UIViewContentModeScaleToFill;
    infoL.numberOfLines = 0;
    infoL.textColor = [UIColor darkGrayColor];
    infoL.font = GXB_FONT_PingFangSC_Regular(14);
    infoImageV.frame = CGRectMake(10, 15, 15, 15);
    infoL.frame = CGRectMake(30, 5, GXB_ScreenWidth - 40 - 10, 50);
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, 100)];
    [bottomView addSubview:infoImageV];
    [bottomView addSubview:infoL];
    bottomView.backgroundColor = GXB_RGBColor(240, 240, 240);
    self.tableFooterView = bottomView;
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
    [GXB_Userdefult setObject:@(self.selectedIndex) forKey:SelectedIndex];
    [GXB_Userdefult synchronize];
    [self reloadData];
}
@end
