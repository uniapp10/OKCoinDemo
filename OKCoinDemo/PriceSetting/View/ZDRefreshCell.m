//
//  ZDRefreshCell.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/12.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDRefreshCell.h"
#define RefreshCellH 44

@interface ZDRefreshCell ()

@end

@implementation ZDRefreshCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = GXB_FONT_PingFangSC_Regular(14);
    self.titleLabel.frame = CGRectMake(10, (RefreshCellH - 30) * 0.5, GXB_ScreenWidth - 2 * 20, 30);
    
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
    [imageV sizeToFit];
    imageV.contentMode = UIViewContentModeScaleToFill;
    imageV.frame = CGRectMake(GXB_ScreenWidth - 40, (RefreshCellH - 30) * 0.5, 30, 30);
    imageV.hidden = true;
    self.iconView = imageV;
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:imageV];
    
    UIView *sepV = [[UIView alloc] initWithFrame:CGRectMake(0, RefreshCellH - 0.5, GXB_ScreenWidth, 0.5)];
    sepV.backgroundColor = [UIColor darkGrayColor];
    [self.contentView addSubview:sepV];
    self.sepView = sepV;    
}

@end
