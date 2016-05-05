//
//  Pictures.m
//  Duitang
//
//  Created by lanouhn on 15/6/28.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "Pictures.h"

@implementation Pictures
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.image forKey:@"image"];
    
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self.image = [aDecoder decodeObjectForKey:@"image"];
   
    
    return self;
}


@end
