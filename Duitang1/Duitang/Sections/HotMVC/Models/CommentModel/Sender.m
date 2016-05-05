//
//  Sender.m
//  shiyan
//
//  Created by lanouhn on 15/6/24.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Sender.h"

@implementation Sender
+ (Sender *)crtateDataWithDic:(NSDictionary *)dic {

    Sender *sender = [Sender new];
    sender.ID = dic[@"id"];
    sender.username = dic[@"username"];
    sender.avatar = dic[@"avatar"];
    return sender;
}

- (void)dealloc {

    self.ID = nil;
    self.username = nil;
    self.avatar = nil;
    [super dealloc];
}
@end
