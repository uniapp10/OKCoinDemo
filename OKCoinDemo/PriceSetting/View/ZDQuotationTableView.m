//
//  ZDQuotationTableView.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/13.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDQuotationTableView.h"

@implementation ZDQuotationTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.backgroundColor = GXB_RGBColor(240, 240, 240);
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

@end
