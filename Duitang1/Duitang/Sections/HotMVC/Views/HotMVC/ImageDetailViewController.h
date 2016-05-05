//
//  ImageDetailViewController.h
//  shiyan
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageDetailViewController : UIViewController

@property (nonatomic, retain)UIImageView *imageView;
@property (nonatomic, copy)NSString *photo_path;
@property (nonatomic, retain)NSNumber *photo_height;
@property (nonatomic, retain)NSNumber *photo_width;
@end
