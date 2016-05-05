//
//  MainModel.h
//  shiyan
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject
@property (nonatomic, copy)NSString *background_img_url;
@property (nonatomic, copy)NSString *username;
@property (nonatomic, copy)NSString *avatar;
@property (nonatomic, copy)NSString *score;
@property (nonatomic, copy)NSString *follow_count;//关注
@property (nonatomic, copy)NSString *be_follow_count;//粉丝
@property (nonatomic, copy)NSString *album_count;//专辑
@property (nonatomic, copy)NSString *mblog_count;//所有的图片
@property (nonatomic, copy)NSString *album_like_count;//喜欢的专辑
@end
