//
//  RefreshsViewCell.m
//  shiyan
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RefreshCollectionViewCell.h"

@implementation RefreshCollectionViewCell
- (void)dealloc {
    
    self.activityIndicatorV = nil;
    self.contentLabel = nil;
    [super dealloc];
}

- (UIActivityIndicatorView *)activityIndicatorV {
    
    if (!_activityIndicatorV) {
        
        self.activityIndicatorV = [[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
        _activityIndicatorV.frame = CGRectMake(10, 10, 20, 50);
    }
    
    return _activityIndicatorV;
}

- (UILabel *)contentLabel {
    
    if (!_contentLabel) {
        
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(35, 15, 220, 40)];
        _contentLabel.text = @"吐血加载中";
        _contentLabel.font = [UIFont systemFontOfSize:15];
    }
    return _contentLabel;
}
- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        
        [self.contentView addSubview:self.activityIndicatorV];
        [self.contentView addSubview:self.contentLabel];
        
        //启动风火轮
        [self.activityIndicatorV startAnimating];
    }
    return self;
}

@end
