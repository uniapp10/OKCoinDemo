//
//  ZDCoinPriceModel.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/12.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDCoinPriceModel.h"

@implementation ZDCoinPriceModel

- (instancetype)initWithDict: (NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
