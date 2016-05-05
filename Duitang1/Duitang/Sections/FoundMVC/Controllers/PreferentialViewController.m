//
//  PreferentialViewController.m
//  Duitang
//
//  Created by lanouhn on 15/6/20.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "PreferentialViewController.h"
#import "PreferentialViewCell.h"
#import "FoundViewController.h"
#import "Manager.h"
#import "FoundModel.h"
#import "RefreshTableViewCell.h"
@interface PreferentialViewController ()

//存储新闻信息
@property (nonatomic, retain)NSMutableArray * dataSource;
@property (nonatomic, retain)UIRefreshControl * refresh;

@property (nonatomic, assign)NSInteger loadCount;
@end

@implementation PreferentialViewController
- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        self.dataSource = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataSource;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"特卖惠";

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    //[self.view addSubview:self.tableView];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 300, 30)];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 200, 30)];
    label.text = @"限时抢购";
    [view addSubview:label];
    [self.tableView setTableHeaderView:view];
    
    
    //进行网络数据的请求
    NetWorkRequest * requst = [[NetWorkRequest alloc] init];
    
    //开始进行网络数据
    [requst startNetWorkRequestWithURL:@"http://www.duitang.com/napi/shopping/preferential/list/?app_code=gandalf&from=app&app_version=4.6.2&limit=30&start=0" method:@"GET" parameters:nil kind:0 orContainChinese:
     NO];
    //设置代理人
    requst.delegate = self;
    [requst release];

    self.tableView.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
    
    [self.tableView registerClass:[PreferentialViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[RefreshTableViewCell class] forCellReuseIdentifier:@"load"];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"icon_back_dark.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(returnBack:)];
    
    //添加刷新控件（只能用于tableView表视图）
    UIRefreshControl * refresh = [[UIRefreshControl alloc] init];
    //设置刷新时的内容
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"正在为你刷新"];
    refresh.tintColor = [UIColor redColor];
    
    //为刷新控件添加事件
    [refresh addTarget:self action:@selector(refreshAction:) forControlEvents:UIControlEventValueChanged];
    self.refresh = refresh;
    [self.tableView addSubview:self.refresh];
    [self.refresh release];

}
- (void)refreshAction:(UIRefreshControl *)refrsh {
    
    //执行网络数据请求
    //进行网络数据的请求
    NetWorkRequest * requst = [[NetWorkRequest alloc] init];
    
    //开始进行网络数据
    [requst startNetWorkRequestWithURL:@"http://www.duitang.com/napi/shopping/preferential/list/?app_code=gandalf&from=app&app_version=4.6.2&limit=30&start=0" method:@"GET" parameters:nil kind:0 orContainChinese:NO];
    //设置代理人
    requst.delegate = self;
    [requst release];
    
    
}
- (void)getDataSuccessWithObject:(id)object kind:(NSInteger)kind {
    if (kind == 0) {
        
        [self.refresh endRefreshing];
        
        [self.dataSource removeAllObjects];
        
    }
    NSLog(@"数目---%lu",(unsigned long)self.dataSource.count);

    NSMutableArray * arr = object[@"data"][@"object_list"];
    for (NSDictionary * dic in arr) {
        FoundModel * model = [FoundModel createFoundModelWithDic:dic];
        [self.dataSource addObject:model];
       // [model release];
        
    }
    [self.tableView reloadData];
  
}
- (void)getDataFail {
    
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查当前网络是否连接" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertV show];
    [alertV release];
}

- (void)returnBack:(UIBarButtonItem *)item {
    
    
    UISearchBar * searchBar = (UISearchBar *)[[Manager sharedManager].navigationController.navigationBar viewWithTag:122];
    //    [searchBar removeFromSuperview];
    searchBar.alpha = 0;
    [[Manager sharedManager].navigationController popViewControllerAnimated:YES];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
   
//    return self.dataSource.count;
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    
        return self.dataSource.count + 1;
//    return 10;
}
- (CGRect)rectForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 170);
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.dataSource.count) {

        FoundModel * model = [self.dataSource objectAtIndex:indexPath.row];
        
        static NSString * identifier = @"cell";
        PreferentialViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        
        cell.foundModel = model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
         return cell;
        
    } else {
        static NSString * identifier = @"load";
        RefreshTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
        
        return cell;

    }
    // Configure the cell...

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.dataSource.count) {
        return 170;
    } else {
        return 0;
    }
    
}

//该代理方法在cell将要展示到我们的可视化区域的时候触发
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
   
    if (indexPath.row == self.dataSource.count) {
        RefreshTableViewCell * refresh = (RefreshTableViewCell *)cell;
//        [refresh.activityIndicator startAnimating];
        [refresh.activityIndicator startAnimating];
        
        //执行网络数据请求
        //进行网络数据的请求
        NetWorkRequest * requst = [[NetWorkRequest alloc] init];
        
        //开始进行网络数据请求(kind来判断当前操作是加载还是刷新，0代表刷新，1代表加载)
        self.loadCount = self.loadCount + 30;
        
        //开始进行网络数据
        self.URL = [NSString stringWithFormat:@"http://www.duitang.com/napi/shopping/preferential/list/?app_code=gandalf&from=app&app_version=4.6.2&limit=30&start=%lu",(long)self.loadCount];
        
        [requst startNetWorkRequestWithURL:self.URL method:@"GET" parameters:nil kind:1 orContainChinese:NO];
        //设置代理人
        requst.delegate = self;
        [requst release];
    }
    
    
}


- (void)viewWillAppear:(BOOL)animated {
    
    
    self.hidesBottomBarWhenPushed = YES;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
