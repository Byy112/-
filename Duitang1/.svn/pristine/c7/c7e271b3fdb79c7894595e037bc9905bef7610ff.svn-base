//
//  AlbumViewController.m
//  shiyan
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "AlbumViewController.h"
#import "CustomCell.h"
#import "Manager.h"
#import "Album.h"
#import "MangClassesViewController.h"

@interface AlbumViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, retain)UICollectionView *collectionView;

//存放所有专辑
@property (nonatomic, retain)NSMutableArray * albumArr;

@end

@implementation AlbumViewController
- (NSMutableArray *)albumArr {
    if (_albumArr == nil) {
        self.albumArr =[NSMutableArray new];
    }
    return _albumArr;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self createCollectionView];
    
    self.albumArr = [[[Manager sharedManager] selectAlbum] mutableCopy];
    
   
}
- (void)createCollectionView {

    //创建FlowLayout布局对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    //设置每一个Item（cell）的尺寸
    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width / 2 - 15, 200);
    
    //设置每一个分区距离周边的尺寸
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    //修改集合视图的背景颜色
    collectionView.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
    self.collectionView = collectionView;
    
    //指定视图集合的代理对象
    collectionView.dataSource = self;
    collectionView.delegate = self;
    [self.view addSubview:collectionView];
    
    //注册集合视图的cell
    [collectionView registerClass:[CustomCell class] forCellWithReuseIdentifier:@"cell"];
    
    [flowLayout release];
    [collectionView release];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.albumArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *indentify = @"cell";
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.album = self.albumArr[indexPath.row];
   
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MangClassesViewController * classificationVC = [[MangClassesViewController alloc] init];
    Album * album = self.albumArr[indexPath.row];
    
    classificationVC.blog_id = album.album_id;
    classificationVC.image = album.image;
    NSString * str = [NSString stringWithFormat:@"%@的专辑",album.album_name];
    classificationVC.title = str;
    [[Manager sharedManager].navigationController pushViewController:classificationVC animated:YES];
    
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
