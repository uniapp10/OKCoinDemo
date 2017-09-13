//
//  ZDPriceHeaderView.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/13.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDPriceHeaderView.h"
#define LineHeight 1

@interface ZDPriceHeaderView ()
{
    NSInteger selectIndex;
}

@property (nonatomic, strong) UIButton *oldSelectedBtn;
@property (nonatomic, strong) UIView *lineV;

@end
@implementation ZDPriceHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *titles = @[@"BTC", @"LTC", @"ETH", @"BTC合约", @"LTC合约"];
        CGFloat btnW = (GXB_ScreenWidth - 2 * 10) / 4;
        self.contentSize = CGSizeMake(2 * 10 + btnW * titles.count, frame.size.height);
        [titles enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(btnW * idx + 10, 0, btnW, frame.size.height);
            btn.tag = BaseTag_btn + idx;
            [self addSubview:btn];
            [btn setTitle:obj forState:UIControlStateNormal];
            btn.titleLabel.font = GXB_FONT_PingFangSC_Regular(14);
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            [btn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchUpInside];
        }];
        self.showsVerticalScrollIndicator = false;
        self.showsHorizontalScrollIndicator = false;
        self.lineV = [[UIView alloc] initWithFrame:CGRectMake(10, self.frame.size.height - LineHeight, btnW, 1)];
        self.lineV.backgroundColor = GXB_RGBColor(64, 175, 250);
        [self addSubview:self.lineV];
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (void)selectedBtn: (UIButton *)btn {
    if (selectIndex >= BaseTag_btn) {
        UIButton *oldSelectedBtn = [self viewWithTag: selectIndex];
        oldSelectedBtn.selected = false;
    }
    
    btn.selected = true;
    selectIndex =  btn.tag;
    
    [UIView animateWithDuration:0.25 animations:^{
        self.lineV.frame = CGRectMake(btn.frame.origin.x, self.frame.size.height - LineHeight, (GXB_ScreenWidth - 2 * 10) / 4, LineHeight);
        CGFloat offSetX = btn.center.x - self.bounds.size.width * 0.5 + 10;
        CGFloat offsetX1 = (self.contentSize.width - btn.center.x) - self.bounds.size.width * 0.5 + 10;
        if (offSetX > 0 && offsetX1 > 0) {
            self.contentOffset = CGPointMake(offSetX, 0);
        }else if(offSetX < 0){
            self.contentOffset = CGPointMake(0, 0);
        }else if (offsetX1 < 0){
            self.contentOffset = CGPointMake(self.contentSize.width - self.bounds.size.width - 10, 0);
        }
    }];
    
    if (self.clickDelegate) {
        self.clickDelegate(btn);
    }
}
@end
