//
//  TopicViewCell.m
//  shiyan
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TopicViewCell.h"
#import "UIImageView+WebCache.h"
#import "TopicModel.h"

@interface TopicViewCell ()
@property (nonatomic, assign)CGRect rect;
@end
@implementation TopicViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //添加子控件
        [self.contentView addSubview:self.sender_username];
        [self.contentView addSubview:self.sender_avatar];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.reply_countLabel];
        [self.contentView addSubview:self.like_countLabel];
        [self.contentView addSubview:self.customview];
    }
    return self;
}

- (UIImageView *)sender_avatar {
    
    if (!_sender_avatar) {
        self.sender_avatar = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];

        _sender_avatar.layer.cornerRadius = 20;
        _sender_avatar.clipsToBounds = YES;
    }
    return [[_sender_avatar retain] autorelease];
}
- (UILabel *)sender_username {
    
    if (!_sender_username) {
        self.sender_username = [[UILabel alloc]initWithFrame:CGRectMake(60, 15, 100 , 20)];
        _sender_username.font = [UIFont systemFontOfSize:15];
        _sender_username.textColor = [UIColor blueColor];
       
    }
    return [[_sender_username retain] autorelease];
}
- (UILabel *)content {
    
    if (!_content) {
        self.content = [[UILabel alloc]initWithFrame:CGRectMake(60, 45, self.bounds.size.width - 80 , 20)];
        _content.font = [UIFont systemFontOfSize:15];
        _content.numberOfLines = 0;
        
    }
    return [[_content retain] autorelease];
}
- (UIView *)customview {

    if (!_customview) {
        self.customview = [[UIView alloc]initWithFrame:CGRectMake(60, self.rect.size.height + 55,self.bounds.size.width - 80 , 20)];
        
        UIImageView *replyView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, 20, 20)];
        
        replyView.image = [UIImage imageNamed:@"comment.png"];
        
        self.reply_countLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, 30, 20)];
        self.reply_countLabel.font = [UIFont systemFontOfSize:11];
        
        UIImageView *likeView = [[UIImageView alloc]initWithFrame:CGRectMake(80, 0, 20, 20)];
        likeView.image = [UIImage imageNamed:@"like.png"];
        
        self.like_countLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 0, 30, 20)];
        self.like_countLabel.font = [UIFont systemFontOfSize:11];

        [self.customview addSubview:replyView];
        [self.customview addSubview:likeView];
        [self.customview addSubview:self.reply_countLabel];
        [self.customview addSubview:self.like_countLabel];
        [replyView release];
        [likeView release];
    }
    return [[_customview retain] autorelease];
}
//重写setter方法，为label赋值
- (void)setModel:(TopicModel*)model {
    
    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
    
    [self.sender_avatar sd_setImageWithURL:[NSURL URLWithString:_model.sender_avatar] placeholderImage:nil];
    
    self.sender_username.text = _model.sender_username;
    self.content.text = _model.content;
    self.rect = [_model.content boundingRectWithSize:CGSizeMake(260, 100000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    CGRect fram = self.content.frame;
    fram.size = self.rect.size;
    self.content.frame = fram;
    
    self.customview.frame = CGRectMake(60, self.rect.size.height + 55,self.bounds.size.width - 80 , 20);
    
    self.like_countLabel.text = [NSString stringWithFormat:@"%@",_model.like_count];
    self.reply_countLabel.text = [NSString stringWithFormat:@"%@",_model.reply_count];
    
}
- (void)dealloc {
    
    self.sender_avatar = nil;
    self.sender_username = nil;
    self.content = nil;
    self.model = nil;
    self.like_countLabel = nil;
    self.reply_countLabel = nil;
    [super dealloc];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
