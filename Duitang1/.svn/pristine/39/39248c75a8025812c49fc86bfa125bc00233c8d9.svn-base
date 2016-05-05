//
//  CollectionViewController.m
//  shiyan
//
//  Created by lanouhn on 15/6/28.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "CollectionViewController.h"
#import "UICollectionViewWaterfallLayout.h"
#import "CollectionViewCell.h"
#import "HotModel.h"
#import "HotDetailViewController.h"
#import "Manager.h"
#import "User.h"
#import "MainDetailViewController.h"

//#import "RefreshCollectionViewCell.h"


#define kItemWidth ([UIScreen mainScreen].bounds.size.width / 2 - 15) //item的宽度

@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateWaterfallLayout>

@property (nonatomic, retain)NSMutableArray *dataArr; //存储数据
@property (nonatomic, retain)UICollectionView *collectionView;
@property (nonatomic)NSInteger loadCount;//加载的次数

@property (nonatomic, retain)UIRefreshControl *refresh;//创建刷新控件
@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我的收藏";
    
    self.dataArr = [[[Manager sharedManager] selectUser] mutableCopy];
    [self createCollectionView];
  
}

- (void)createCollectionView {
    
    UICollectionViewWaterfallLayout *waterFlow = [[UICollectionViewWaterfallLayout alloc]init];
    waterFlow.itemWidth = kItemWidth;
    
    //设置每个分区的缩进量
    waterFlow.sectionInset = UIEdgeInsetsMake(10, 10, 0, 10);
    //设置代理，用来动态返回每一个item的高度
    waterFlow.delegate = self;
    //设置最小行间距
    waterFlow.minLineSpacing = 10;
    
    
    self.collectionView = [[[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:waterFlow] autorelease];
    self.collectionView.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    [waterFlow release];
    
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
#pragma mark - UICollectionViewDataSource
//设置分区item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataArr.count;
}

//返回cell对象
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.user = self.dataArr[indexPath.row];
        
        cell.backgroundColor = [UIColor whiteColor];
   
        return cell;

}
//选中cell的时候
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    User * user = self.dataArr[indexPath.row];
    
    MainDetailViewController *hot = [[MainDetailViewController alloc]init];
    //把id值传过去
    
    hot.blog_id = user.blog_id;
    hot.commentCount = user.comment_count;
    [self.navigationController pushViewController:hot animated:YES];
    [hot release];
}


#pragma mark - UICollectionViewDelegateWaterfallLayout
//动态返回每个item的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewWaterfallLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    //根据对应的Model对象, 动态计算出每个item的高度,
    //按比例进行缩放,得到最终缩放之后的高度,返回
    if (indexPath.row < self.dataArr.count) {
        
        User * user = self.dataArr[indexPath.row ];
        
        CGRect rect = [user.title boundingRectWithSize:CGSizeMake(300, 100) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        
        return kItemWidth + rect.size.height + 10;
      
        
    }else {
        return 0;
    }
}

- (NSMutableArray *)dataArr {
    
    if (!_dataArr) {
        self.dataArr = [NSMutableArray arrayWithCapacity:0];
    }
    return [[_dataArr retain] autorelease];
}
- (void)dealloc {
    
    self.collectionView = nil;
    self.dataArr = nil;
    self.refresh = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
