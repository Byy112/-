//
//  HeaderModel.m
//  shiyan
//
//  Created by lanouhn on 15/6/26.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "HeaderModel.h"

@implementation HeaderModel
+ (HeaderModel *)createModelWithDic:(NSDictionary *)dic {
    HeaderModel *model = [[HeaderModel alloc]init];
    model.descriptions = dic[@"description"];
    model.image_url = dic[@"image_url"];
    model.target = dic[@"target"];
   
    return [model autorelease];
}

@end
