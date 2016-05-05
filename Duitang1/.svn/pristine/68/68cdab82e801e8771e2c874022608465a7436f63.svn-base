//
//  ScrollViewCell.m
//  Duitang
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ScrollViewCell.h"
#import "ScrollView.h"
@implementation ScrollViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createMyScrollView];
    }
    return self;
}
- (void)createMyScrollView {
    ScrollView * scroll = [[ScrollView alloc] initWithFrame:self.contentView.bounds];
    self.myScroll = scroll;
    [self.contentView addSubview:self.myScroll];
    [scroll release];
    
}

- (void)dealloc {
    self.myScroll = nil;
    [super dealloc];
    
}
@end
