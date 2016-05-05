//
//  ListOfProductsViewCell.m
//  Duitang
//
//  Created by lanouhn on 15/6/18.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ListOfProductsViewCell.h"
#import "FoundModel.h"
#import "ClassificationViewController.h"
#import "Manager.h"

@implementation ListOfProductsViewCell
//创建图片对象
- (UIImageView *)picture {

        self.picture = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width /4, self.frame.size.height / 3 - 10)];
    return _picture;
}
//创建显示文字的内容
- (UILabel *)contentLabel {
    
        self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width / 4, 0, self.frame.size.width - 40, self.frame.size.height / 3 - 5)];
        _contentLabel.font = [UIFont systemFontOfSize:13];
        return _contentLabel;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {

        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createButton]; 
  
    }
    return self;
}
- (void)createButton {

    self.button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button1.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height / 3);
    self.button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button2.frame = CGRectMake(0, self.contentView.frame.size.height / 3, self.contentView.frame.size.width, self.contentView.frame.size.height / 3);
    self.button3.frame = CGRectMake(0, self.contentView.frame.size.height * 2 / 3, self.contentView.frame.size.width, self.contentView.frame.size.height / 3);

    [self.button1 setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
//    self.button1.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    
//    [self.button1 setBackgroundImage:[UIImage imageNamed:@"11.png"] forState:UIControlStateNormal];
    
    [self.button1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.button3 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    self.button1.tag = 110;
    self.button2.tag = 111;
    self.button3.tag = 112;
    
    [self.contentView addSubview:self.button1];
    [self.contentView addSubview:self.button2];
    [self.contentView addSubview:self.button3];
    

 
}
- (UIImageView *)imageView {
    if (_imageView == nil) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(17, 17, self.contentView.frame.size.width / 5, self.contentView.frame.size.height - 30)];
        
    }
    return _imageView;
}

- (void)setImageViewWithImage:(UIImage *)image {
    self.imageView.image = image;
    
    UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, self.contentView.frame.size.width / 18, self.contentView.frame.size.height * 1 / 15)];
    image1.image = self.imageView.image;
    
    UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, self.contentView.frame.size.width / 18, self.contentView.frame.size.height * 1 / 15)];
    image2.image = self.imageView.image;
    image2.tintColor = [UIColor greenColor];
    UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(25, 15, self.contentView.frame.size.width / 18, self.contentView.frame.size.height * 1 / 15)];
    image3.image = self.imageView.image;

    [self.button1 addSubview:image1];
    [self.button2 addSubview:image2];
    [self.button3 addSubview:image3];
    
    
}
- (NSMutableArray *)target_idArr {
    if (_target_idArr == nil) {
        self.target_idArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _target_idArr;
}
- (void)setModel:(FoundModel *)model{
    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
//    self.contentView.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
    self.target_idArr = model.target_idArr;
    
}
- (void)setButtonTitle:(NSArray *)arr {
    [self.button1 setTitle:arr[0] forState:UIControlStateNormal];
    [self.button2 setTitle:arr[1] forState:UIControlStateNormal];
    [self.button3 setTitle:arr[2] forState:UIControlStateNormal];
    
}
- (void)click:(UIButton *)btn {
  //  NSLog(@"%@",btn.titleLabel);
    NSLog(@"-%lu",(long)btn.tag);
    
    UISearchBar * searchBar = (UISearchBar *)[[Manager sharedManager].navigationController.navigationBar viewWithTag:122];
    //    [searchBar removeFromSuperview];
    searchBar.alpha = 0;
    
    ClassificationViewController * classVC = [[ClassificationViewController alloc] init];
    classVC.title = btn.titleLabel.text;
    classVC.target_id = self.target_idArr[btn.tag - 110];
    [[Manager sharedManager].navigationController pushViewController:classVC animated:YES];
    
    
}
- (void)dealloc {
    
    self.button1 = nil;
    self.button3 = nil;
    self.button3 = nil;
    
    self.picture = nil;
    self.contentLabel = nil;
    [super dealloc];
}


@end
