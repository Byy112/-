//
//  CommentCountCell.h
//  shiyan
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotModel.h"
@interface CommentCountCell : UITableViewCell
@property (nonatomic, retain)UILabel *commentLabel;
@property (nonatomic, retain)UILabel *commentCountLabel;

@property (nonatomic, retain)HotModel *model;
@end
