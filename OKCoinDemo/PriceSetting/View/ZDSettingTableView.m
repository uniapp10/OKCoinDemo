//
//  ZDSettingTableView.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/13.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDSettingTableView.h"
#import "ZDSettingCell.h"

@interface ZDSettingTableView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ZDSettingTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.titles = @[@"BTCChina", @"BTstamp", @"HuoBi", @"Coinbase"];
        self.tableFooterView = [[UIView alloc] init];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZDSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZDSettingCell"];
    if (!cell) {
        cell = [[ZDSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZDSettingCell"];
    }
    
    if (indexPath.row == self.titles.count - 1) {
        cell.sepV.hidden = true;
    }else{
        cell.sepV.hidden = false;
    }
    cell.titleL.text = self.titles[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *headerL = [[UILabel alloc] init];
    headerL.text = @"选择交易所";
    headerL.font = GXB_FONT_PingFangSC_Regular(14);
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, ZDSettingH)];
    headerV.backgroundColor = GXB_RGBColor(240, 240, 240);
    headerL.frame = CGRectMake(10, (ZDSettingH - 30) * 0.5, GXB_ScreenWidth, 30);
    [headerV addSubview:headerL];
    return headerV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return ZDSettingH;
}
@end
