//
//  ZDCoinPriceModel.h
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/12.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZDCoinPriceModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *price;

- (instancetype)initWithDict: (NSDictionary *)dict;
@end
