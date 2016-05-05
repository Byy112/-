//
//  RefreshsViewCell.h
//  shiyan
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshCollectionViewCell : UICollectionViewCell
//创建风火轮
@property (nonatomic, retain)UIActivityIndicatorView *activityIndicatorV;
//创建显示内容的标签
@property (nonatomic, retain)UILabel *contentLabel;
@end
