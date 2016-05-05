//
//  RefreshTableViewCell.h
//  LessonUI netEase
//
//  Created by lanouhn on 15/6/4.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RefreshTableViewCell : UITableViewCell
//创建风火轮
@property (nonatomic, retain)UIActivityIndicatorView * activityIndicator;
//创建显示内容的标签
@property (nonatomic, retain)UILabel * contentLabel;



@end
