//
//  ScrollView.h
//  Duitang
//
//  Created by lanouhn on 15/6/18.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FoundModel;

@interface ScrollView : UIView<UIScrollViewDelegate>
@property (nonatomic, retain)UIScrollView * scrollView;
//存放图片
@property (nonatomic, retain)NSMutableArray * imageArray;
//存放图片的标题
@property (nonatomic, retain)NSMutableArray * titleArray;

@property (nonatomic, retain)UIImageView * imageView;
@property (nonatomic, retain)UILabel * label;

@property (nonatomic, retain)NSString * icon_url;
@property (nonatomic, retain)NSString * target_idHeader;
@property (nonatomic, retain)NSString * target_id;

@property (nonatomic, retain)NSMutableArray * icon_urlArr;
@property (nonatomic, retain)NSMutableArray * target_idArr;
@property (nonatomic, retain)NSMutableArray * target_idHeaderArr;

@property (nonatomic, retain)NSMutableArray * dataSource;

- (void)configureSrollWithFoundModel:(FoundModel *)model;
@end
