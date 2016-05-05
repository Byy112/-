//
//  RefreshTableViewCell.m
//  LessonUI netEase
//
//  Created by lanouhn on 15/6/4.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "RefreshTableViewCell.h"

@implementation RefreshTableViewCell
//创建风火轮
- (UIActivityIndicatorView *)activityIndicator {
    if (_activityIndicator == nil) {
        self.activityIndicator = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray] autorelease];
        _activityIndicator.frame = CGRectMake(50, 0, 40, 40);
        
    }
    return _activityIndicator;
}
//创建显示内容的标签
- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        self.contentLabel = [[[UILabel alloc] initWithFrame:CGRectMake(80, 10, 220, 40)] autorelease];
        self.contentLabel.text = @"正在为你服务";
        
    }
    return _contentLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.activityIndicator];
        [self.contentView addSubview:self.contentLabel];
        //启动风火轮
        [self.activityIndicator startAnimating];   
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
