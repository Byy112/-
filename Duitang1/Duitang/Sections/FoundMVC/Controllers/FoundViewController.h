//
//  FoundViewController.h
//  Duitang
//
//  Created by lanouhn on 15/6/17.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"
#import "NetWorkRequest.h"
@class SearchViewController;
@interface FoundViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,UISearchBarDelegate,NetWorkRequestDelegate>

@property (nonatomic, retain)UIImageView *zoomImageView;//变焦图片做底层

@property (nonatomic, retain)UIImageView *circleView; //类似头像的 UIImageView;

@property (nonatomic, retain)UILabel *textLabel; //类似昵称的UILabel

@property (nonatomic, retain)UICollectionView *collectView; //整个视图


@property (nonatomic, retain)UISearchBar * searchBar;
@property (nonatomic, retain)SearchViewController *searchController;

@property (nonatomic, retain)NSMutableArray * showData;
@property (nonatomic, retain)NSMutableArray *dataList;

@end
