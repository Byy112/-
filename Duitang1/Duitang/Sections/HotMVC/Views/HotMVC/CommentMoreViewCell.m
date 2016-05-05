//
//  CommentMoreViewCell.m
//  shiyan
//
//  Created by lanouhn on 15/6/23.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "CommentMoreViewCell.h"

@implementation CommentMoreViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加子控件
        [self.contentView addSubview:self.moreLabel];
            }
    return self;
}
- (UILabel *)moreLabel {

    if (!_moreLabel) {
        self.moreLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
        _moreLabel.text = @"查看全部...";
        self.moreLabel.textColor = [UIColor lightGrayColor];
    }
    return [[_moreLabel retain] autorelease];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
