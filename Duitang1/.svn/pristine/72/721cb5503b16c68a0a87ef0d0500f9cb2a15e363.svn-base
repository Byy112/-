//
//  MainModel.m
//  shiyan
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "MainModel.h"

@implementation MainModel
+ (MainModel *)createModelWithDic:(NSDictionary *)dic {
    
    MainModel *model = [[MainModel alloc]init];
    model.background_img_url = dic[@"background_img_url"];
    model.username = dic[@"username"];
    model.avatar = dic[@"avatar"];
    model.score = dic[@"score"];
    model.follow_count = dic[@"follow_count"];
    model.be_follow_count = dic[@"be_follow_count"];
    model.album_count = dic[@"album_count"];
    model.mblog_count = dic[@"mblog_count"];
    model.album_like_count = dic[@"album_like_count"];
    return [model autorelease];
}

@end
