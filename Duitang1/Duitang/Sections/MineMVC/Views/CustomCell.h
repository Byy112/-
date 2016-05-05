//
//  CustomCell.h
//  ceshi
//
//  Created by lanouhn on 15/6/18.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotModel.h"


@class Album;
@interface CustomCell : UICollectionViewCell

//展示图片
@property (nonatomic, retain)UIImageView *imageView;
@property (nonatomic, retain)UILabel *msgLabel;
@property (nonatomic, retain)UILabel *favorite_countLabel;
@property (nonatomic, retain)UIView *customView;
@property (nonatomic, retain)UIImageView *favoriteView;

@property (nonatomic, retain)Album * album;
@property (nonatomic, retain)HotModel *model;
@end
