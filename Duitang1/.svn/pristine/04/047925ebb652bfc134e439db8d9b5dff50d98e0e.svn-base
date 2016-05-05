//
//  TopicModel.h
//  shiyan
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicModel : NSObject
//问题
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *sender_username;
@property (nonatomic, copy)NSString *sender_avatar;
@property (nonatomic, copy)NSString *clubName;

//评论
@property (nonatomic, copy)NSString *replycontent;
@property (nonatomic, copy)NSString *replysender_username;
@property (nonatomic, copy)NSString *replysender_avatar;
@property (nonatomic, retain)NSNumber *reply_count;
@property (nonatomic, retain)NSNumber *like_count;

+ (TopicModel *)createModelWithDic:(NSDictionary *)dic;
@end
