//
//  CustomCell.m
//  ceshi
//
//  Created by lanouhn on 15/6/18.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "CustomCell.h"
#import "UIImageView+WebCache.h"
#import "Album.h"

#define MSG_HEIGHT self.bounds.size.height  - 25 - self.rect.size.height


@interface CustomCell ()
@property (nonatomic, assign)CGRect rect;
@end

@implementation CustomCell

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        //添加子控件
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.msgLabel];
        [self.contentView addSubview:self.customView];
    }
    return self;
}

- (UIImageView *)imageView {

    if (!_imageView) {
      
        self.imageView = [[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, MSG_HEIGHT - 5)] autorelease];

        _imageView.backgroundColor = [UIColor whiteColor];
        
    }
    return [[_imageView retain] autorelease];
}
- (UILabel *)msgLabel {
    
    if (!_msgLabel) {
        
         self.msgLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,MSG_HEIGHT,self.bounds.size.width - 10, 30)];
        
        _msgLabel.backgroundColor = [UIColor whiteColor];
        _msgLabel.numberOfLines = 0;
        _msgLabel.font = [UIFont systemFontOfSize:14];
    }
    return [[_msgLabel retain] autorelease];
}
//- (UIView *)customView {
//
//    if (!_customView) {
//        
//        self.customView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 
//20, self.bounds.size.width, 20)];
//        self.customView.backgroundColor = [UIColor yellowColor];
//        
//        UIImageView *favoriteView = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width - 45, 5, 15, 15)];
//        favoriteView.backgroundColor = [UIColor purpleColor];
//        self.favorite_countLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width - 30, 5, 30, 15)];
//        self.favorite_countLabel.font = [UIFont systemFontOfSize:11];
//        
//
//        [_customView addSubview:favoriteView];
//        [_customView addSubview:self.favorite_countLabel];
//        [favoriteView release];
//        [self.favorite_countLabel release];
//    }
//    return [[_customView retain] autorelease];
//}

////重写setter方法，为label赋值
//- (void)setModel:(HotModel *)model {
//
//    if (_model != model) {
//        [_model release];
//        _model = [model retain];
//    }
//    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_model.photo_path]];
//    self.msgLabel.text = _model.msg;
//    self.favorite_countLabel.text = [NSString stringWithFormat:@"%@",_model.favorite_count];
//
//    self.rect = [model.msg boundingRectWithSize:CGSizeMake(self.bounds.size.width - 10, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil];
//    CGRect fram = self.msgLabel.frame;
//    fram.size.height = self.rect.size.height;
//    self.msgLabel.frame = fram;
//}
//重写album的setter方法，为label赋值
- (void)setAlbum:(Album *)album {
    if (_album != album) {
        [_album release];
        _album = [album retain];
    }
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_album.image]];
    self.msgLabel.text = _album.album_name;
    
//    self.rect = [model.msg boundingRectWithSize:CGSizeMake(self.bounds.size.width - 10, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:11]} context:nil];
//    CGRect fram = self.msgLabel.frame;
//    fram.size.height = self.rect.size.height;
//    self.msgLabel.frame = fram;
    
    
    
}


- (void)dealloc {

    self.imageView = nil;
    self.msgLabel = nil;
    self.favorite_countLabel = nil;
    self.favoriteView = nil;
    self.customView = nil;
    self.model = nil;
    [super dealloc];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.imageView.frame = CGRectMake(0, 0, self.bounds.size.width, MSG_HEIGHT - 5);
    
    self.msgLabel.frame = CGRectMake(5,MSG_HEIGHT,self.bounds.size.width - 10,20);
    self.customView.frame = CGRectMake(0, self.bounds.size.height - 20, self.bounds.size.width, 20);
}
@end

