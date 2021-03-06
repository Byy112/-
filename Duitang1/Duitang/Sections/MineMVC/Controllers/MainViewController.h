//
//  MainViewController.h
//  shiyan
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, retain)UIImageView *zoomImageView;//变焦图片做底层

@property (nonatomic, retain)UIImageView *sender_avatarView; //类似头像的 UIImageView;
@property (nonatomic, copy)NSString * icon;
@property (nonatomic, retain)UILabel *usernameLabel; //类似昵称的UILabel
@property (nonatomic, copy)NSString * userName;
@property (nonatomic, retain)UITableView *tableView;

@property (nonatomic, copy)NSString * aboutMe;
@property (nonatomic, copy)NSString * url;
@end
