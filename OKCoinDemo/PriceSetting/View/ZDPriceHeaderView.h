//
//  ZDPriceHeaderView.h
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/13.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import <UIKit/UIKit.h>
#define BaseTag_btn 100

@interface ZDPriceHeaderView : UIScrollView

@property (nonatomic, copy) void (^clickDelegate)(UIButton *selectedBtn);

@end
