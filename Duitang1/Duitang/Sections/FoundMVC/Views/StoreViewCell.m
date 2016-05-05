//
//  StoreViewCell.m
//  Duitang
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "StoreViewCell.h"
#import "PreferentialViewController.h"
#import "Manager.h"
#import "FoundModel.h"

#import "ClassificationViewController.h"

@implementation StoreViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self createButton];
        
    }
    return self;
    
    
}
- (void)createButton {
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.button addSubview:self.imageView];
    [self.button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.button];
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(17, 17, self.contentView.frame.size.width / 5, self.contentView.frame.size.height - 30)];
        
    }
    return _imageView;
}

- (void)click:(UIButton *)btn {
   
   UISearchBar * searchBar = (UISearchBar *)[[Manager sharedManager].navigationController.navigationBar viewWithTag:122];
//    [searchBar removeFromSuperview];
    searchBar.alpha = 0;
    
    if ([btn.titleLabel.text isEqualToString:@"特卖惠"]) {
        PreferentialViewController * preVC = [[PreferentialViewController alloc] init];
        preVC.URL = self.URL;
        [[Manager sharedManager].navigationController pushViewController:preVC animated:YES];
    } else {
        ClassificationViewController * classVC = [[ClassificationViewController alloc] init];
        classVC.title = btn.titleLabel.text;
        classVC.target_id = self.URL;
        [[Manager sharedManager].navigationController pushViewController:classVC animated:YES];
        
    }
    

}

- (void)setImageViewWithImage:(UIImage *)image {
    self.imageView.image = image;
    
}
- (void)setButtonTitle:(NSString *)str {
    [self.button setTitle:str forState:UIControlStateNormal];
    
}
- (void)setModel:(FoundModel *)model {
    
    if (_model != model) {
        [_model release];
        _model = [model retain];
    }
    self.URL = model.target_idArr[0];
//    [self.button addSubview:self.imageView];
    
}

@end
