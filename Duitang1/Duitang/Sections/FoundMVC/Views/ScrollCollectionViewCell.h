//
//  ScrollCollectionViewCell.h
//  Duitang
//
//  Created by lanouhn on 15/6/19.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ScrollView;
@class FoundModel;

@interface ScrollCollectionViewCell : UICollectionViewCell

@property    (nonatomic, retain)FoundModel *model;


@property (nonatomic, retain)ScrollView * myScroll;
@property (nonatomic, retain)UILabel * myLabel;
@end
