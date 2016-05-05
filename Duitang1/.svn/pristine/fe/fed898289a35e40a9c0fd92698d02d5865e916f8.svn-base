//
//  FoundModel.h
//  Duitang
//
//  Created by lanouhn on 15/6/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoundModel : NSObject

@property (nonatomic, retain)NSString * name;
@property (nonatomic, retain)NSString * icon_url;
@property (nonatomic, retain)NSString * target_id;
@property (nonatomic, copy)NSString * target_head;

@property (nonatomic, retain)NSMutableArray * iconArr;
@property (nonatomic, retain)NSMutableArray * target_idArr;
@property (nonatomic, retain)NSMutableArray * target_headArr;
@property (nonatomic, retain)NSMutableArray * nameArr;
@property (nonatomic, copy)NSString * filter_id;

@property (nonatomic, copy)NSString * date;
/****************************************************/
//特卖惠

@property (nonatomic, retain)NSString * title;
@property (nonatomic, retain)NSString * desc;
@property (nonatomic, retain)NSString * photo_url;
@property (nonatomic, retain)NSString * source_link;
@property (nonatomic, retain)NSNumber * price;
@property (nonatomic, retain)NSNumber * promotion_price;

+ (FoundModel *)createFoundModelWithDic:(NSDictionary *)dic;
+ (FoundModel *)createFoundModelWithStr:(NSString *)str;
@end
