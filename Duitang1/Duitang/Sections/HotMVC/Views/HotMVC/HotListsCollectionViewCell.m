//
//  HotListsCollectionViewCell.m
//  Duitang
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "HotListsCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "Manager.h"
#import "HotDetailViewController.h"
//#import "ClassificationViewController.h"
#import "HotListsViewController.h"

#define MSG_HEIGHT self.bounds.size.height - 70 - self.rect.size.height

@interface HotListsCollectionViewCell ()
@property (nonatomic, assign)CGRect rect;
@end

@implementation HotListsCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        //添加子控件
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.msgLabel];
        [self.contentView addSubview:self.view];
    }
    return self;
}

- (UIImageView *)imageView {
    
    if (!_imageView) {
        
        self.imageView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width , self.bounds.size.height - self.rect.size.height - 70)] autorelease];
        //添加手势
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterAnotherViewController:)];
        _imageView.userInteractionEnabled = YES;
        [_imageView addGestureRecognizer:tap];
        
    }
    return [[_imageView retain] autorelease];
}
- (UILabel *)msgLabel {
    
    if (!_msgLabel) {
        
        self.msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,MSG_HEIGHT - 5,self.bounds.size.width - 10,self.rect.size.height )];
        
        _msgLabel.numberOfLines = 0;
        _msgLabel.font = [UIFont systemFontOfSize:11];
        
        _msgLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enterAnotherViewController:)];
        
        [_msgLabel addGestureRecognizer:tap];
        
    }
    return [[_msgLabel retain] autorelease];
}

- (UIView *)view {
    
    if (!_view) {
        self.view = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 50, self.bounds.size.width, 70)];
        self.view.backgroundColor = [UIColor whiteColor];
        
        UIImageView *favoriteView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 11, 11)];
        favoriteView.backgroundColor = [UIColor purpleColor];
        favoriteView.image = [UIImage imageNamed:@"star.png"];
        
        self.favorite_countLabel = [[UILabel alloc]initWithFrame:CGRectMake(17, 5, 30, 10)];
        self.favorite_countLabel.font = [UIFont systemFontOfSize:11];
        self.favorite_countLabel.textColor = [UIColor lightGrayColor];
        
        UIImageView *replyView = [[UIImageView alloc]initWithFrame:CGRectMake(45, 5, 10, 10)];
        //        replyView.backgroundColor = [UIColor orangeColor];
        replyView.image = [UIImage imageNamed:@"comment.png"];
        
        self.reply_countLabel = [[UILabel alloc]initWithFrame:CGRectMake(55, 5, 30, 10)];
        self.reply_countLabel.font = [UIFont systemFontOfSize:11];
        self.reply_countLabel.textColor = [UIColor lightGrayColor];
        self.reply_countLabel.text = @"0";
        UIImageView *likeView = [[UIImageView alloc]initWithFrame:CGRectMake(80, 5, 10, 10)];
        likeView.backgroundColor = [UIColor cyanColor];
        likeView.image = [UIImage imageNamed:@"like.png"];
        
        self.like_countLabel = [[UILabel alloc]initWithFrame:CGRectMake(90, 5, 30, 10)];
        self.like_countLabel.font = [UIFont systemFontOfSize:11];
        self.like_countLabel.textColor = [UIColor lightGrayColor];
        self.like_countLabel.text = @"0";
        
        UILabel *lineLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, self.bounds.size.width, 10)];
        UIColor * color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"line.jpg"] ];
        lineLabel.backgroundColor = color;
        
        
        self.sender_avatar = [[UIImageView alloc]initWithFrame:CGRectMake(5, 30, 30, 30)];
       
        self.sender_avatar.layer.cornerRadius = 15;
        self.sender_avatar.clipsToBounds = YES;//必须将clipsToBounds属性设置为YES，这样layer才能生效
       
        
        self.sender_username = [[UILabel alloc]initWithFrame:CGRectMake(40, 30, self.bounds.size.width - 10 - 35, 15)];
        self.sender_username.font = [UIFont systemFontOfSize:11];
        self.sender_username.textColor = [UIColor colorWithRed:79/255.0 green:148/255.0 blue:205/255.0 alpha:1.0];
       
        self.album_name = [[UILabel alloc]initWithFrame:CGRectMake(40, 40, self.bounds.size.width - 10 - 35, 20)];
        self.album_name.font = [UIFont systemFontOfSize:11];
        
       
        
        _view.userInteractionEnabled = YES;
        //为头像添加手势
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        
        [_view addGestureRecognizer:tap];
        
        [_view addSubview:favoriteView];
        [_view addSubview:self.favorite_countLabel];
        [_view addSubview:replyView];
        [_view addSubview:self.reply_countLabel];
        [_view addSubview:likeView];
        [_view addSubview:self.like_countLabel];
        [_view addSubview:self.sender_avatar];
        [_view addSubview:self.sender_username];
        [_view addSubview:self.album_name];
        [_view addSubview:lineLabel];
        [favoriteView release];
        [replyView release];
        [likeView release];
        [self.favorite_countLabel release];
        [self.reply_countLabel release];
        [self.like_countLabel release];
        [self.sender_avatar release];
        [self.sender_username release];
        [self.album_name release];
        [lineLabel release];
    }
    return [[_view retain] autorelease];
}
- (void)click:(UITapGestureRecognizer *)tap {
    if (self.album_id != nil) {
        HotListsViewController * classificationVC = [[HotListsViewController alloc] init];
        
        classificationVC.blog_id = self.album_id;
        classificationVC.image = _model.photo_path;
        NSString * str = [NSString stringWithFormat:@"%@的专辑",self.sender_username.text];
        classificationVC.title = str;
        classificationVC.nav = self.myNav;
//        [[Manager sharedManager].navigationController pushViewController:classificationVC animated:YES];
        [self.myNav pushViewController:classificationVC animated:YES];
    }
    
    
}
- (void)enterAnotherViewController:(UITapGestureRecognizer *)tap {
    
    HotDetailViewController *hot = [[HotDetailViewController alloc]init];
    //把id值传过去
    
    hot.blog_id = self.blog_id;
    hot.commentCount = [self.reply_countLabel.text integerValue];
//    [[Manager sharedManager].navigationController pushViewController:hot animated:YES];
    [self.myNav pushViewController:hot animated:YES];
    
}

//重写setter方法，为label赋值
- (void)setModel:(HotModel *)model {
    
    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
    [self view];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_model.photo_path]];
    
    self.msgLabel.text = _model.msg;
    self.favorite_countLabel.text = [NSString stringWithFormat:@"%@",_model.favorite_count];
    self.reply_countLabel.text = [NSString stringWithFormat:@"%@",_model.reply_count];
    if (_model.reply_count == nil) {
        
        self.reply_countLabel.text = @"0";
        
    }
    
    self.like_countLabel.text = [NSString stringWithFormat:@"%@",_model.like_count];
    if (_model.like_count == nil) {
        self.like_countLabel.text = @"0";
    }
    [self.sender_avatar sd_setImageWithURL:[NSURL URLWithString:_model.sender_avatar] placeholderImage:[UIImage imageNamed:@"2.jpg"]];
    self.sender_username.text = _model.sender_username;
    self.album_id = _model.album_id;
    self.album_name.text = [NSString stringWithFormat:@"收集到 %@",_model.album_name];
    
    self.rect = [model.msg boundingRectWithSize:CGSizeMake(self.bounds.size.width - 10, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil];
    CGRect fram = self.msgLabel.frame;
    fram.size.height = self.rect.size.height;
    self.msgLabel.frame = fram;
    self.blog_id = model.blog_id;//进入详情界面的id
    self.comment = [model.reply_count integerValue];
}
- (void)dealloc {
    
    self.imageView = nil;
    self.msgLabel = nil;
    self.favorite_countLabel = nil;
    self.reply_countLabel = nil;
    self.like_countLabel = nil;
    self.sender_avatar = nil;
    self.sender_username = nil;
    self.album_name = nil;
    self.view = nil;
    self.model = nil;
    [super dealloc];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.bounds.size.width , self.bounds.size.height - self.rect.size.height - 80);
    
    self.msgLabel.frame = CGRectMake(5,MSG_HEIGHT - 5,self.bounds.size.width - 10,self.rect.size.height );
    self.view.frame = CGRectMake(0, self.bounds.size.height - 70, self.bounds.size.width, 70);
}



@end
