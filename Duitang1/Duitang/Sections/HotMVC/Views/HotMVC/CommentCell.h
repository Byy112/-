//
//  CommentCell.h
//  shiyan
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommentObjectList;
@interface CommentCell : UITableViewCell

@property (nonatomic, retain)UILabel *contentLabel;//评论内容
@property (nonatomic, retain)UIImageView *sender_avatar;//评论者的头像
@property (nonatomic, retain)UILabel *sender_username;//评论者的用户名
@property (nonatomic, retain)UILabel *add_datetime_strLabel;//发表评论的时间


@property (nonatomic, retain)CommentObjectList *commentModel;
@end

