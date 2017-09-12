//
//  ZDPriceCoinCell.m
//  OKCoinDemo
//
//  Created by 朱冬冬 on 2017/9/12.
//  Copyright © 2017年 朱冬冬. All rights reserved.
//

#import "ZDPriceCoinCell.h"
#import "GXBMacrosDefine.h"

@interface ZDPriceCoinCell ()
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *priceL;
@end

@implementation ZDPriceCoinCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];        
    }
    return self;
}

- (void)setupUI{
    
    UIView *sepV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, GXB_ScreenWidth, 0.5)];
    sepV.backgroundColor = [UIColor darkGrayColor];
    [self.contentView addSubview:sepV];
    
    UILabel *titleL = [[UILabel alloc] init];
    titleL.frame = CGRectMake(10, 5, GXB_WidthScale_IOS6(150), 30);
    titleL.font = GXB_FONT_PingFangSC_Regular(14);
    
    UILabel *priceL = [[UILabel alloc] init];
    priceL.frame = CGRectMake(10, 40, GXB_WidthScale_IOS6(150), 30);
    priceL.font = GXB_FONT_PingFangSC_Regular(16);
    
    CGFloat limitW = 160;
    UITextField *upPriceTF = [[UITextField alloc] initWithFrame:CGRectMake(GXB_ScreenWidth - GXB_WidthScale_IOS6(limitW), 5, GXB_WidthScale_IOS6(100), 35)];
    upPriceTF.placeholder = @"输入价格上限";
    upPriceTF.font = GXB_FONT_PingFangSC_Regular(12);
    upPriceTF.textAlignment = NSTextAlignmentCenter;
    upPriceTF.backgroundColor = [UIColor lightGrayColor];
    upPriceTF.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    
    UITextField *downPriceTF = [[UITextField alloc] initWithFrame:CGRectMake(GXB_ScreenWidth - GXB_WidthScale_IOS6(limitW), 42.5, GXB_WidthScale_IOS6(100), 35)];
    downPriceTF.placeholder = @"输入价格下限";
    downPriceTF.font = GXB_FONT_PingFangSC_Regular(12);
    downPriceTF.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
    downPriceTF.textAlignment = NSTextAlignmentCenter;
    
    UISwitch *priceSW = [[UISwitch alloc] init];
    priceSW.frame = CGRectMake(GXB_ScreenWidth - 10 - 51, (CellH - 31) * 0.5, 51, 31);
    
    [self.contentView addSubview:titleL];
    [self.contentView addSubview:priceL];
    [self.contentView addSubview:upPriceTF];
    [self.contentView addSubview:downPriceTF];
    [self.contentView addSubview:priceSW];
    
    self.titleL = titleL;
    self.priceL = priceL;
}

- (void)setCoinModel:(ZDCoinPriceModel *)coinModel{
    _coinModel = coinModel;
    self.titleL.text = coinModel.title;
    self.priceL.text = coinModel.price;
}

@end
