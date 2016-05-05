//
//  User.m
//  PersistentDemo
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 LJC. All rights reserved.
//

#import "User.h"

@implementation User

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.image forKey:@"image"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeInteger:self.comment_count forKey:@"comment_count"];
    [aCoder encodeObject:self.blog_id forKey:@"blog_id"];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.image = [aDecoder decodeObjectForKey:@"image"];
    self.title = [aDecoder decodeObjectForKey:@"title"];
    self.comment_count = [aDecoder decodeIntegerForKey:@"comment_count"];
    self.blog_id = [aDecoder decodeObjectForKey:@"blog_id"];
    
    return self;
}



@end
