//
//  ZDPriceContentView.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/13.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDPriceContentView.h"
#import "ZDPriceHeaderView.h"
#import "ZDPriceTableView.h"

@interface ZDPriceContentView ()

@property (nonatomic, strong) ZDPriceHeaderView *priceHeaderView;
@property (nonatomic, strong) ZDPriceTableView *priceView;

@end

@implementation ZDPriceContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = GXB_RGBColor(240, 240, 240);
        [self addSubview:self.priceHeaderView];
        [self addSubview:self.priceView];
        
        UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [arrowBtn setImage:[UIImage imageNamed:@"arrowR"] forState:UIControlStateNormal];
        [arrowBtn sizeToFit];
        arrowBtn.adjustsImageWhenHighlighted = false;
        arrowBtn.frame = CGRectMake(GXB_ScreenWidth - arrowBtn.bounds.size.width, 0, arrowBtn.bounds.size.width, 45);
        arrowBtn.backgroundColor = [UIColor whiteColor];
        [self addSubview:arrowBtn];
        [arrowBtn addTarget:self action:@selector(arrowBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)arrowBtnClick {
    CGFloat offsetX = self.priceHeaderView.contentSize.width - GXB_ScreenWidth + 2 * 10;
    self.priceHeaderView.contentOffset = CGPointMake(offsetX, 0);
}


- (ZDPriceHeaderView *)priceHeaderView{
    if (!_priceHeaderView) {
        _priceHeaderView = [[ZDPriceHeaderView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, 45)];
        
        __weak typeof(self) weakSelf = self;
        _priceHeaderView.clickDelegate = ^(UIButton *selectedBtn) {
            __strong typeof(self) strongSelf = weakSelf;
            NSInteger selectedIndex = selectedBtn.tag - BaseTag_btn;
            strongSelf.priceView.seletedIndex = selectedIndex;
        };
    }
    return _priceHeaderView;
}
- (ZDPriceTableView *)priceView {
    if (!_priceView) {
        _priceView = [[ZDPriceTableView alloc] initWithFrame:CGRectMake(0, 50, GXB_ScreenWidth, GXB_ScreenHeight - 50) style:UITableViewStylePlain];
        _priceView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _priceView;
}

@end
