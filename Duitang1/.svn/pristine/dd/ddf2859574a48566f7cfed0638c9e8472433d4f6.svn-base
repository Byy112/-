//
//  ClassificationViewController.m
//  shiyan
//
//  Created by lanouhn on 15/6/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "ClassificationViewController.h"
#import "UICollectionViewWaterfallLayout.h"
#import "ClassificationViewCell.h"
#import "HotModel.h"
#import "NetWorkRequest.h"
//#import "HotDetailViewController.h"
#import "FoundDetailTableViewController.h"
#import "RefreshCollectionViewCell.h"
#import "ShoppingDetailViewController.h"
#import "FoundModel.h"
#import "Manager.h"
#import "Album.h"


#define kItemWidth ([UIScreen mainScreen].bounds.size.width / 2 - 15) //item的宽度

@interface ClassificationViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateWaterfallLayout,NetWorkRequestDelegate>

@property (nonatomic, retain)NSMutableArray *dataArr; //存储数据
@property (nonatomic, retain)UICollectionView *collectionView;
@property (nonatomic)NSInteger loadCount;//加载的次数
//创建刷新控件
@property (nonatomic, retain)UIRefreshControl *refresh;

@end


@implementation ClassificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Manager sharedManager].navigationController = self.navigationController;
    self.navigationItem.title = self.title;
    NetWorkRequest *manager = [[NetWorkRequest alloc] init];
    manager.delegate = self;
    

    if ([self.target_idHeader containsString:@"theme/detail/?"]) {
        [manager startNetWorkRequestWithURL:self.target_idHeader method:nil parameters:nil kind:0 orContainChinese:YES];
  
        
    } else if ([self.target_id containsString:@"kw="]) {
        NSString * url = [@"http://www.duitang.com/napi/blog/list/by_search/?__dtac=%257B%2522_r%2522%253A%2520%2522597665%2522%257D&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&" stringByAppendingString:self.target_id];
        [manager startNetWorkRequestWithURL:url method:nil parameters:nil kind:0 orContainChinese:YES];
        
    
        
    } else if ([self.target containsString:@"album/detail"]) {
        NSString *url1 = @"http://www.duitang.com/napi/blog/list/by_album/?include_fields=album%2Csender%2Ctop_comments%2Creply_count%2Ctop_like_users%2Clike_count%2Cicon_url&start=0&album_";
        NSRange range = [self.target rangeOfString:@"?"];
        NSString *url2 = [self.target substringFromIndex:range.location+1];
        NSString *url3 = [url2 stringByAppendingString:@"&limit=24"];
        NSString *url = [url1 stringByAppendingString:url3];
        [manager startNetWorkRequestWithURL:url method:nil parameters:nil kind:0 orContainChinese:NO];
    } else if (self.blog_id != nil) {
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_notifications_like.png"] style:UIBarButtonItemStyleDone target:self action:@selector(like:)];
        self.navigationItem.rightBarButtonItem.tintColor = [UIColor lightGrayColor];
        
        
        NSString * url = [NSString stringWithFormat:@"album_id=%@",self.blog_id];
        NSString * url1 = [@"http://www.duitang.com/napi/blog/list/by_album/?include_fields=album%2Csender%2Ctop_comments%2Creply_count%2Ctop_like_users%2Clike_count%2Cicon_url&__dtac=%257B%2522_r%2522%253A%2520%2522455547%2522%257D&start=0&" stringByAppendingString:url];
        url1 = [url1 stringByAppendingString:@"&limit=24"];
        [manager startNetWorkRequestWithURL:url1 method:nil parameters:nil kind:0 orContainChinese:NO];
        
        
    } else if ([self.target containsString:@"topic"]) {
        
    }else if ([self.target containsString:@"urlopentype="]) {
        
    } else {
        
        [manager startNetWorkRequestWithURL:[@"http://www.duitang.com/napi/blog/list/by_category/?include_fields=sender%2Calbum%2Cicon_url%2Creply_count%2Clike_count&path=&__dtac=%257B%2522_r%2522%253A%2520%2522378150%2522%257D&start=0&limit=24&cate_key=" stringByAppendingString:self.target_id] method:nil parameters:nil kind:0 orContainChinese:NO];
    }
    
    [self createCollectionView];
    [manager release];
    [self.collectionView registerClass:[RefreshCollectionViewCell class] forCellWithReuseIdentifier:@"refresh"];
    
    //刷新
    self.refresh = [[UIRefreshControl alloc]init];
    
    //设置刷新操作时显示的内容
    self.refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"加载中"];
    
    //refresh.tintColor = [UIColor redColor];
    
    //为刷新控件添加事件
    [self.refresh addTarget:self action:@selector(refreshAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.collectionView addSubview:self.refresh];
    [self.refresh release];

}

- (void)like:(UIBarButtonItem *)item {
    item.image = [[UIImage imageNamed:@"icon_notifications_like@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    Album * album = [[Album alloc] init];
    album.album_name = self.title;
    album.album_id = self.blog_id;
    album.image = self.image;
    
    [[Manager sharedManager] insertAlbum:album];
    
    
    
}
- (void)refreshAction:(UIRefreshControl *)refresh {
    
    //执行网络数据请求
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    //开始进行网络数据请求
    if ([self.target_id containsString:@"filter_id"]) {

        NSString * url = [@"http://www.duitang.com/napi/blog/list/by_filter_id/?include_fields=sender%2Calbum%2Cicon_url%2Clike_count%2Creply_count&" stringByAppendingString:self.target_id];
        url = [url stringByAppendingString:@"&__dtac=%257B%2522_r%2522%253A%2520%2522811519%2522%257D&start=0&limit=24"];
        [request startNetWorkRequestWithURL:url method:nil parameters:nil kind:0 orContainChinese:YES];

        
        
    } else if ([self.target_id containsString:@"kw="]) {
        NSString * url = [@"http://www.duitang.com/napi/blog/list/by_search/?__dtac=%257B%2522_r%2522%253A%2520%2522597665%2522%257D&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&" stringByAppendingString:self.target_id];
        [request startNetWorkRequestWithURL:url method:nil parameters:nil kind:0 orContainChinese:YES];
        
        
        
    } else if ([self.target containsString:@"album/detail"]) {
        NSString *url1 = @"http://www.duitang.com/napi/blog/list/by_album/?include_fields=album%2Csender%2Ctop_comments%2Creply_count%2Ctop_like_users%2Clike_count%2Cicon_url&start=0&album_";
        NSRange range = [self.target rangeOfString:@"?"];
        NSString *url2 = [self.target substringFromIndex:range.location+1];
        NSString *url3 = [url2 stringByAppendingString:@"&limit=24"];
        NSString *url = [url1 stringByAppendingString:url3];
        [request startNetWorkRequestWithURL:url method:nil parameters:nil kind:0 orContainChinese:NO];
    } else if (self.blog_id != nil) {
        NSString * url = [NSString stringWithFormat:@"album_id=%@",self.blog_id];
        NSString * url1 = [@"http://www.duitang.com/napi/blog/list/by_album/?include_fields=album%2Csender%2Ctop_comments%2Creply_count%2Ctop_like_users%2Clike_count%2Cicon_url&__dtac=%257B%2522_r%2522%253A%2520%2522455547%2522%257D&start=0&" stringByAppendingString:url];
        url1 = [url1 stringByAppendingString:@"&limit=24"];
        [request startNetWorkRequestWithURL:url1 method:nil parameters:nil kind:0 orContainChinese:NO];
        
        
    } else if ([self.target containsString:@"topic"]) {
        
    }else if ([self.target containsString:@"urlopentype="]) {
        
    } else {
    
        [request startNetWorkRequestWithURL:[@"http://www.duitang.com/napi/blog/list/by_category/?include_fields=sender%2Calbum%2Cicon_url%2Creply_count%2Clike_count&path=&__dtac=%257B%2522_r%2522%253A%2520%2522378150%2522%257D&start=0&limit=24&cate_key=" stringByAppendingString:self.target_id] method:nil parameters:nil kind:0 orContainChinese:NO];
    }

    //设置代理
    request.delegate = self;
    [request release];
}

#pragma mark - NetWorkRequestDelegate
- (void)getDataSuccessWithObject:(id)object kind:(NSInteger)kind{
    
    if (kind == 0) {
        //停止刷新操作
        [self.refresh endRefreshing];
        //清空数组数据
        [self.dataArr removeAllObjects];
    }
    if (self.target_id == nil) {
        NSString * str = object[@"data"][@"data_src"][@"filter_id"];
        FoundModel * model = [FoundModel createFoundModelWithStr:str];
        self.target_id = model.filter_id;
    } else {
    
        NSArray *arr = object[@"data"][@"object_list"];
        //使用block遍历数组
        [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            HotModel *model = [HotModel createModelWithDic:obj];
            [self.dataArr addObject:model];
        }];
    }
    [self.collectionView reloadData];
}

- (void)getDataFail {

    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查当前网络是否连接" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertV show];
    [alertV release];
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
    
    [self.collectionView registerClass:[ClassificationViewCell class] forCellWithReuseIdentifier:@"cell"];
    
}
#pragma mark - UICollectionViewDataSource
//设置分区item的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataArr.count + 1 ;
}

//返回cell对象
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < self.dataArr.count) {
        ClassificationViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.model = self.dataArr[indexPath.row];
        
        cell.backgroundColor = [UIColor whiteColor];
        //    [collectionView reloadData];
        return cell;
    }else {
        
        RefreshCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"refresh" forIndexPath:indexPath];
        
        return cell;
        
    }
}

//cell将要展示到可视区域时触发
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row == self.dataArr.count) {
        RefreshCollectionViewCell *refreshCell = (RefreshCollectionViewCell *)cell;
        [refreshCell.activityIndicatorV startAnimating];
        //执行网络请求
        NetWorkRequest *request = [[NetWorkRequest alloc]init];
        
        self.loadCount = self.loadCount + 10;
        
        if (self.target_idHeader != nil) {
            if (self.target_id != nil) {
                NSString * url = [@"http://www.duitang.com/napi/blog/list/by_filter_id/?include_fields=sender%2Calbum%2Cicon_url%2Clike_count%2Creply_count&" stringByAppendingString:self.target_id];
                url = [url stringByAppendingString:@"&__dtac=%257B%2522_r%2522%253A%2520%2522811519%2522%257D&start="];
                NSString * url2 = [url stringByAppendingFormat:@"%lu&limit=24",(long)self.loadCount];
                //            url = [url stringByAppendingString:url2];
                [request startNetWorkRequestWithURL:url2 method:nil parameters:nil kind:1 orContainChinese:YES];
                
                
                
            } else {
                 [request startNetWorkRequestWithURL:self.target_idHeader method:nil parameters:nil kind:1 orContainChinese:YES];
                
                
            }
        } else if ([self.target_id containsString:@"kw="]) {
            
            NSString * url = [@"http://www.duitang.com/napi/blog/list/by_search/?__dtac=%257B%2522_r%2522%253A%2520%2522597665%2522%257D&include_fields=sender%2Cfavroite_count%2Calbum%2Cicon_url%2Creply_count%2Clike_count&" stringByAppendingString:self.target_id];
            NSString * url1 = [NSString stringWithFormat:@"&limit=0&start=%lu",(long)self.loadCount];
            url = [url stringByAppendingString:url1];
            [request startNetWorkRequestWithURL:url method:nil parameters:nil kind:1 orContainChinese:YES];
            
            
        } else if ([self.target containsString:@"album/detail"]) {
            NSString *url1 = @"http://www.duitang.com/napi/blog/list/by_album/?include_fields=album%2Csender%2Ctop_comments%2Creply_count%2Ctop_like_users%2Clike_count%2Cicon_url&";
            NSString * str = [NSString stringWithFormat:@"start=%lu&album_",(long)self.loadCount];
            url1 = [url1 stringByAppendingString:str];
            
            NSRange range = [self.target rangeOfString:@"?"];
            NSString *url2 = [self.target substringFromIndex:range.location+1];
            NSString *url3 = [url2 stringByAppendingString:@"&limit=24"];
            NSString *url = [url1 stringByAppendingString:url3];
            [request startNetWorkRequestWithURL:url method:nil parameters:nil kind:0 orContainChinese:NO];
        } else if (self.blog_id != nil) {
            NSString * url = [NSString stringWithFormat:@"&start=%lu&album_id=%@",(long)self.loadCount,self.blog_id];
            NSString * url1 = [@"http://www.duitang.com/napi/blog/list/by_album/?include_fields=album%2Csender%2Ctop_comments%2Creply_count%2Ctop_like_users%2Clike_count%2Cicon_url&__dtac=%257B%2522_r%2522%253A%2520%2522455547%2522%257D" stringByAppendingString:url];
            url1 = [url1 stringByAppendingString:@"&limit=24"];
            [request startNetWorkRequestWithURL:url1 method:nil parameters:nil kind:1 orContainChinese:NO];
            
            
        } else if ([self.target containsString:@"topic"]) {
            
        }else if ([self.target containsString:@"urlopentype="]) {
            
        }else {
            NSString *url1 = @"http://www.duitang.com/napi/blog/list/by_category/?include_fields=sender%2Calbum%2Cicon_url%2Creply_count%2Clike_count&path=&__dtac=%257B%2522_r%2522%253A%2520%2522378150%2522%257D&";
            NSString *url2 = [NSString stringWithFormat:@"start=%ld&limit=24&cate_key=",(long)self.loadCount];
            url2 = [url2 stringByAppendingString:self.target_id];
            NSString *url = [url1 stringByAppendingString:url2];
            
            //开始进行网络数据请求(kind来判断当前操作是加载还是刷新，0代表刷新，1代表加载)
            [request startNetWorkRequestWithURL:url method:nil parameters:nil kind:1 orContainChinese:NO];
           
        }
    

        request.delegate = self;
        [request release];
    }
}

#pragma mark - UICollectionViewDelegateWaterfallLayout
//动态返回每个item的高度
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewWaterfallLayout *)collectionViewLayout
 heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    //根据对应的Model对象, 动态计算出每个item的高度,
    //按比例进行缩放,得到最终缩放之后的高度,返回
    if (indexPath.row < self.dataArr.count) {
        
        HotModel *model = self.dataArr[indexPath.row ];
        
        CGRect rect = [model.msg boundingRectWithSize:CGSizeMake(300, 100) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
        
        return kItemWidth *model.photo_height.floatValue / model.photo_width.floatValue + rect.size.height + 80;
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

- (void)viewWillAppear:(BOOL)animated {

    
    self.hidesBottomBarWhenPushed = YES;
}
//- (void)viewDidDisappear:(BOOL)animated {
//    self.hidesBottomBarWhenPushed = NO;
//    
//}
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
