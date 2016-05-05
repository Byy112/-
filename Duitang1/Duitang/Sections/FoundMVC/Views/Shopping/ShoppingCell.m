//
//  ShoppingCell.m
//  shiyan
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ShoppingCell.h"
#import "HotModel.h"
#import "TransformToTaoBaoViewController.h"
#import "Manager.h"


@interface ShoppingCell ()
@property (nonatomic, copy)NSString *source_link;//链接
@end
@implementation ShoppingCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self.contentView addSubview:self.taoImageView];
        [self.contentView addSubview:self.shopTitleLabel];
        [self.contentView addSubview:self.priceLabel];
        [self.contentView addSubview:self.buyButton];
    }
    return self;
}

- (UIImageView *)taoImageView {

    if (!_taoImageView) {
        self.taoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
        self.taoImageView.image = [UIImage imageNamed:@"tao.png"];
//        self.taoImageView.backgroundColor = [UIColor redColor];
    }
    return [[_taoImageView retain] autorelease];
}
- (UILabel *)shopTitleLabel {

    if (!_shopTitleLabel) {
        self.shopTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 10, self.bounds.size.width - 45, 20)];
        self.shopTitleLabel.textColor = [UIColor blueColor];
        self.shopTitleLabel.font = [UIFont systemFontOfSize:15];
    }
    return [[_shopTitleLabel retain] autorelease];
}
- (UILabel *)priceLabel {

    if (!_priceLabel) {
        self.priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 35, 100, 20)];
//        self.priceLabel.backgroundColor = [UIColor orangeColor];
    }
    return [[_priceLabel retain] autorelease];
}
- (UIButton *)buyButton {

    if (!_buyButton) {
        self.buyButton = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width - 10 - 60, 35, 60, 30)];
        [self.buyButton setImage:[UIImage imageNamed:@"buy.png"] forState:UIControlStateNormal];
        [self.buyButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return [[_buyButton retain] autorelease];
}
- (void)click:(UIButton *)sender {
    
    TransformToTaoBaoViewController * transformToWebVC = [[TransformToTaoBaoViewController alloc] init];
    transformToWebVC.source_link = self.source_link;
    [[Manager sharedManager].navigationController pushViewController:transformToWebVC animated:YES];

    
    
}
- (void)setModel:(HotModel *)model {

    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
    NSString *str = [NSString stringWithFormat:@"%@",_model.price];
    self.priceLabel.text = [@"￥"stringByAppendingString:str];
    self.shopTitleLabel.text = _model.source_title;
    self.source_link = _model.source_link;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {

    self.taoImageView = nil;
    self.shopTitleLabel = nil;
    self.priceLabel = nil;
    self.buyButton = nil;
    [super dealloc];
}
@end
