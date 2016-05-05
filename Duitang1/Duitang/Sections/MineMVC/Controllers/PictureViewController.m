//
//  PictureViewController.m
//  Duitang
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PictureViewController.h"
#import "Manager.h"
#import "UIImageView+WebCache.h"
#import "PictureCollectionViewCell.h"
#import "Pictures.h"

#import "BigPictureViewController.h"

@interface PictureViewController ()<UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, retain)NSMutableArray * imageArr;

@end

@implementation PictureViewController
- (NSMutableArray *)imageArr {
    if (_imageArr == nil) {
        self.imageArr = [NSMutableArray new];
    }
    return _imageArr;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的图片";
    
    
    self.imageArr = [[[Manager sharedManager] selectPicture] mutableCopy];
    NSLog(@"%@",self.imageArr);
    [self createCollectView];
    
}

- (void)createCollectView {
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //    flowLayout.itemSize = CGSizeMake(self.view.bounds.size.width / 2 - 5, self.view.bounds.size.height / 5);
    
    flowLayout.itemSize = CGSizeMake(180, 290);
    flowLayout.sectionInset = UIEdgeInsetsMake(10 , 10, 10, 10);
    flowLayout.minimumLineSpacing = 20;
    flowLayout.minimumInteritemSpacing = 2;
    
    self.collectView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 45) collectionViewLayout:flowLayout];
    self.collectView.delegate = self;
    self.collectView.dataSource = self;
    self.collectView.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
    
    self.collectView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    [self.view addSubview:self.collectView];
    
    [self.collectView registerClass:[PictureCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
    
}


//返回每一个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    PictureCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    Pictures * picture = self.imageArr[indexPath.row];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:picture.image]];
    return cell;
        
        // cell.clipsToBounds = YES;
  
}


//返回每一个分区的行数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.imageArr.count;
    
}
//返回每一个cell的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return CGSizeMake(self.view.bounds.size.width / 2 - 30, self.view.bounds.size.height / 4 + 40);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
//    if (section == 1) {
//        return CGSizeMake(self.view.frame.size.width, 20);
//    }else {
//        return CGSizeMake(self.view.frame.size.width, 0);
//    }
    
    return CGSizeMake(self.view.frame.size.width, 0);
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    BigPictureViewController * imageVC = [[BigPictureViewController alloc]init];
    Pictures * picture = self.imageArr[indexPath.row];
    
    
    imageVC.image = picture.image;
    [self presentViewController:imageVC animated:YES completion:nil];

    
//    [self.navigationController pushViewController:imageVC animated:YES];
    
   
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.collectView reloadData];
    self.hidesBottomBarWhenPushed = YES;
}
- (void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    self.imageArr = nil;
    [super dealloc];
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
