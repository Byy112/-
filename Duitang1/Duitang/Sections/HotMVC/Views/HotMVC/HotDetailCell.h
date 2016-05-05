//
//  HotDetailCell.h
//  shiyan
//
//  Created by lanouhn on 15/6/19.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotModel.h"
@interface HotDetailCell : UITableViewCell

@property (nonatomic, retain)UIImageView *imgView;

@property (nonatomic, retain)UIImageView *sender_avatar;
@property (nonatomic, retain)UILabel *sender_username;
@property (nonatomic, retain)UILabel *album_name;
@property (nonatomic, retain)UIView *customView;
@property (nonatomic, retain)UILabel *add_datetime_prettyLabel;//几天前发表的

@property (nonatomic, retain)HotModel *model;


@end
