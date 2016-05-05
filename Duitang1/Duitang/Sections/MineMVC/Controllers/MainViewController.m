//
//  MainViewController.m
//  shiyan
//
//  Created by lanouhn on 15/6/27.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewCell.h"
#import "AlbumViewController.h"
#import "MainModel.h"
#import "CollectionViewController.h"
#import "Manager.h"
#import "UIImageView+WebCache.h"
#import "PictureViewController.h"
#import "SETViewController.h"
#import  <ShareSDK/ShareSDK.h>
#import "HotViewController.h"
#import "UIImageView+WebCache.h"
#import "RootViewController.h"
#import "APPStrodeViewController.h"


#define NavigationBarHight 44.0f
#define ImageHeight [UIScreen mainScreen].bounds.size.width * 4 / 5

@interface MainViewController ()
@property (nonatomic, retain)NSMutableArray *dataArr;
@property (nonatomic, retain)Manager * manager;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
    self.navigationItem.title = @"个人中心";
 
    self.view.frame = [UIScreen mainScreen].bounds;
    [Manager sharedManager].navigationController = self.navigationController;

//    UIBarButtonItem * mine = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"detail_action_icon_edit.png"] style:UIBarButtonItemStylePlain target:self action:@selector(action:)];
//     UIBarButtonItem * cancle = [[UIBarButtonItem alloc]initWithTitle:@"注销" style:(UIBarButtonItemStylePlain) target:self action:@selector(back:)];
//    self.navigationItem.rightBarButtonItems = @[cancle,mine];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"首页" style:(UIBarButtonItemStylePlain) target:self action:@selector(return:)];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.contentInset = UIEdgeInsetsMake(ImageHeight, 0, 0, 0);
    [self.view addSubview:self.tableView];
    
    self.tableView.tableFooterView = [UIView new];
    [self createZoomImageView];
    
    [self.tableView registerClass:[MainViewCell class] forCellReuseIdentifier:@"main"];

}

- (void)back:(UIBarButtonItem *)item {
    [ShareSDK cancelAuthWithType:ShareTypeSinaWeibo];
    [self dismissViewControllerAnimated:YES completion:^{
   
    }];
}
- (void)return:(UIBarButtonItem *)item {
   
    RootViewController * rootVc = [[RootViewController alloc] init];
    [self presentViewController:rootVc animated:YES completion:^{
        
    }];
    
}
- (void)createZoomImageView {

//    self.sender_avatarView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2.jpeg"]];
//    [self.sender_avatarView sd_setImageWithURL:[NSURL URLWithString:self.icon]];
//    self.sender_avatarView.frame = CGRectMake(self.view.frame.size.width / 2 - 35, 65, 70, 70);
//    self.sender_avatarView.layer.cornerRadius = 35;
//    self.sender_avatarView.clipsToBounds = YES;
//  
//    
//    self.sender_avatarView.backgroundColor = [UIColor redColor];
//    if (self.sender_avatarView.image == nil) {
//        self.sender_avatarView.image = [UIImage imageNamed:@"2.jpeg"];
//    }
//
//    self.usernameLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 3, 135, 130, 40)];
//    self.usernameLabel.font = [UIFont systemFontOfSize:15];
////    self.usernameLabel.backgroundColor = [UIColor whiteColor];
//    self.usernameLabel.textColor = [UIColor blueColor];
//    self.usernameLabel.text = self.userName;
    
    self.zoomImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    self.zoomImageView.frame = CGRectMake(0, -ImageHeight, self.view.frame.size.width, ImageHeight);
    self.zoomImageView.contentMode = UIViewContentModeScaleAspectFill; //(不设置那将只会被纵向拉伸)
    
    
    [self.zoomImageView addSubview:self.sender_avatarView];
    [self.zoomImageView addSubview:self.usernameLabel];
    [self.tableView addSubview:self.zoomImageView];
    self.zoomImageView.autoresizesSubviews = YES; //让子类自动布局

}
- (void)action:(UIBarButtonItem *)item {
    if ([self.aboutMe isEqualToString:@""]) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"该用户简介为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    } else {
    
        APPStrodeViewController *appVC = [[APPStrodeViewController alloc] init];
        appVC.url = self.aboutMe;
        [self.navigationController pushViewController:appVC animated:YES];
    }
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat y = scrollView.contentOffset.y + NavigationBarHight;
    if (y < -ImageHeight) {
        CGRect frame = self.zoomImageView.frame;
        frame.origin.y = y;
        frame.size.height = -y;
        self.zoomImageView.frame = frame;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    } else {
        return 1;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"main" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
                cell.nameLabel.text = @"我的收藏";
                break;
            case 1:
                cell.nameLabel.text = @"我的图片";
                break;
            case 2:
                cell.nameLabel.text = @"喜欢的专辑";
                break;
            default:
                break;
        }
    
    } else {
        cell.nameLabel.text = @"设置";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 10;
//}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

     if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            CollectionViewController *collec = [[CollectionViewController alloc]init];
            [self.navigationController pushViewController:collec animated:YES];
            
        }if (indexPath.row == 1) {
            PictureViewController * imageVC = [[PictureViewController alloc] init];
            [self.navigationController pushViewController:imageVC animated:YES];
           
            
        }else if (indexPath.row == 2) {
            
            AlbumViewController *album = [[AlbumViewController alloc]init];
            [self.navigationController pushViewController:album animated:YES];
        }
    
    } else if(indexPath.section == 1) {
        SETViewController * SETVC = [[SETViewController alloc] init];
        [self.navigationController pushViewController:SETVC animated:YES];
        
    }
    
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
