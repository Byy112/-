//
//  MainDetailViewController.h
//  Duitang
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetWorkRequest.h"
@interface MainDetailViewController : UITableViewController<NetWorkRequestDelegate>
@property (nonatomic, copy)NSString *blog_id;
@property (nonatomic)NSInteger commentCount;

@end
