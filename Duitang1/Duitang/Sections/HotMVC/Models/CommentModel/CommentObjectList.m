//
//  CommentObjectList.m
//  shiyan
//
//  Created by lanouhn on 15/6/24.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "CommentObjectList.h"
#import "Sender.h"
@implementation CommentObjectList
+ (CommentObjectList *)createModelWithDic:(NSDictionary *)dic {

    CommentObjectList *commentList = [CommentObjectList new];
    commentList.content = dic[@"content"];
    commentList.add_datetime_str = dic[@"add_datetime_str"];
    commentList.sender = [Sender crtateDataWithDic:dic[@"sender"]];
    return commentList;
}
@end
