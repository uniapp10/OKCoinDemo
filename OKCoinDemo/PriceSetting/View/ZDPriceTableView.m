//
//  ZDPriceTableView.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/12.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDPriceTableView.h"
#import "ZDPriceCoinCell.h"
#import "ZDCoinPriceModel.h"

@interface ZDPriceTableView ()<UITableViewDataSource>

@property (nonatomic, strong) NSArray<ZDCoinPriceModel *> *dataArray;

@end

@implementation ZDPriceTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.rowHeight = CellH;
        UIView *bottomSepV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, 0.5)];
        bottomSepV.backgroundColor = [UIColor darkGrayColor];
        self.tableFooterView = bottomSepV;
        [self loadData];
        [self reloadData];
    }
    return self;
}

- (void)loadData {
    
    NSData *priceData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"CoinPrice" ofType:nil]];
    NSArray *priceArray = [NSJSONSerialization JSONObjectWithData:priceData options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:priceArray.count];
    [priceArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ZDCoinPriceModel *coinModel = [[ZDCoinPriceModel alloc] initWithDict:obj];
        [arrM addObject:coinModel];
    }];
    self.dataArray = arrM;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZDPriceCoinCell *coinCell = [tableView dequeueReusableCellWithIdentifier:@"ZDPriceCoinCell"];
    if (!coinCell) {
        coinCell = [[ZDPriceCoinCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZDPriceCoinCell"];
    }
    
    coinCell.selectionStyle = UITableViewCellSelectionStyleNone;
    ZDCoinPriceModel *priceModel = self.dataArray[indexPath.row];
    coinCell.coinModel = priceModel;
    return coinCell;
}

@end
