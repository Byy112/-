//
//  TopicModel.m
//  shiyan
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel
+ (TopicModel *)createModelWithDic:(NSDictionary *)dic {
    //问题
    TopicModel *model = [[TopicModel alloc]init];
    
    model.content = dic[@"content"];
    model.sender_username = dic[@"sender"][@"username"];
    model.sender_avatar = dic[@"sender"][@"avatar"];
    model.clubName = dic[@"club"][@"name"];
    
    //评论
    model.replycontent = dic[@"content"];
    model.replysender_avatar = dic[@"sender"][@"username"];
    model.replysender_username = dic[@"sender"][@"username"];
    model.reply_count = dic[@"reply_count"];
    model.like_count = dic[@"like_count"];

    return [model autorelease];
}


@end
