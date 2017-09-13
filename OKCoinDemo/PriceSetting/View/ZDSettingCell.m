//
//  ZDSettingCell.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/13.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDSettingCell.h"

@implementation ZDSettingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    UILabel *titleL = [[UILabel alloc] init];
    titleL.frame = CGRectMake(10, (ZDSettingH - 30) * 0.5, 200, 30);
    titleL.font = GXB_FONT_PingFangSC_Regular(14);
    self.titleL = titleL;
    
    UISwitch *rightSW = [[UISwitch alloc] init];
    rightSW.frame = CGRectMake(GXB_ScreenWidth - 10 - 51, (ZDSettingH - 31) * 0.5, 51, 31);
    [self.contentView addSubview:titleL];
    [self.contentView addSubview:rightSW];
    
    UIView *sepV = [[UIView alloc] initWithFrame:CGRectMake(0, ZDSettingH - 0.5, GXB_ScreenWidth, 0.5)];
    sepV.backgroundColor = [UIColor darkGrayColor];
    [self.contentView addSubview:sepV];
    self.sepV = sepV;
}

@end
