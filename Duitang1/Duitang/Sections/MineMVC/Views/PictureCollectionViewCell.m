//
//  PictureCollectionViewCell.m
//  Duitang
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PictureCollectionViewCell.h"

@implementation PictureCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        //添加子控件
        [self.contentView addSubview:self.imageView];
    
    }
    return self;
}

- (UIImageView *)imageView {
    
    if (!_imageView) {
        
        self.imageView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)] autorelease];
        
        _imageView.backgroundColor = [UIColor whiteColor];
        
    }
    return [[_imageView retain] autorelease];
}

@end
