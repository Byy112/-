//
//  PreferentialViewController.h
//  Duitang
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetWorkRequest.h"
@interface PreferentialViewController : UITableViewController<NetWorkRequestDelegate>

@property (nonatomic, copy)NSString * URL;

@end
