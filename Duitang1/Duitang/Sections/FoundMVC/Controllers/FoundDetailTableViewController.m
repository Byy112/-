//
//  FoundDetailTableViewController.m
//  Duitang
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "FoundDetailTableViewController.h"
//#import "HotDetailCell.h"
#import "FoundDedatilTableViewCell.h"
#import "MsgCell.h"
#import "CommentCell.h"
#import "CommentCountCell.h"
#import "HotModel.h"
#import "ImageDetailViewController.h"
#import "CommentMoreViewCell.h"
#import "NetWorkRequest.h"
#import "User.h"
#import "Manager.h"

#import "UIImageView+WebCache.h"
#import "UMSocial.h"
#import "CommentObjectList.h"//评论的model
#import "ReplyViewController.h"

#define kItemWidth ([UIScreen mainScreen].bounds.size.width  - 20) //item的宽度
#define ImageHeight  (kItemWidth *cell.model.photo_height.floatValue / cell.model.photo_width.floatValue)


@interface FoundDetailTableViewController ()<NetWorkRequestDelegate>
@property (nonatomic, retain)NSMutableArray *dataArr; //存储详情数据
@property (nonatomic, retain)NSMutableArray *commentArr;//存储全部评论数据



@end

@implementation FoundDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    UIBarButtonItem *sharItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"detail_icon_star@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(sharItem:)];
    
    UIBarButtonItem *sharItem1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share:)];
    self.navigationItem.rightBarButtonItems = @[sharItem1, sharItem];
    

    
    self.view.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1.0];
    self.navigationItem.title = @"详情";
    
    [self.tableView registerClass:[FoundDedatilTableViewCell class] forCellReuseIdentifier:@"hotdetailcell"];
    [self.tableView registerClass:[MsgCell class] forCellReuseIdentifier:@"msgcell"];
    [self.tableView registerClass:[CommentCell class] forCellReuseIdentifier:@"commentcell"];
    [self.tableView registerClass:[CommentCountCell class] forCellReuseIdentifier:@"commentcount"];
    [self.tableView registerClass:[CommentMoreViewCell class] forCellReuseIdentifier:@"more"];
    
    //请求详情的数据
    NetWorkRequest *request = [[NetWorkRequest alloc]init];
    
    
    //美食详情的详情(苹果)
    NSString *url1 = @"http://www.duitang.com/napi/blog/detail/?__dtac=%257B%2522_r%2522%253A%2520%2522565967%2522%257D&";
    NSString *url2 = [NSString stringWithFormat:@"blog_id=%@",self.blog_id];
    NSString *url3 = @"&include_fields=tags%2Crelated_albums%2Crelated_albums.covers%2Croot_album%2Cshare_links_2%2Cextra_html%2Ctop_comments%2Ctop_like_users&top_comments_count=12&top_forward_users_count=8&top_like_users_count=8";
    NSString *url4 = [url1 stringByAppendingString:url2];
    NSString *url = [url4 stringByAppendingString:url3];
    
    
    [request startNetWorkRequestWithURL:url  method:nil parameters:nil kind:0 orContainChinese:NO];
    request.delegate = self;
    [request release];

    
}
- (void)sharItem:(UIBarButtonItem *)item {
    
    item.image = [[UIImage imageNamed:@"detail_icon_star_highlight@2x.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    User * user = [[User alloc] init];
    HotModel * model = [self.dataArr firstObject];
    user.image = model.photo_path;
    user.title = model.msg;
    user.comment_count = self.commentCount;
    user.blog_id = self.blog_id;
    [[Manager sharedManager] insertUser:user];

}
- (void)share:(UIBarButtonItem *)item {
    HotModel * model = [self.dataArr firstObject];
    NSString * str = [NSString stringWithFormat:@"%@",@"指尖分享APP ---生活良品推荐，让你的幸福感满满:\n"];
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:model.photo_path]];
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5587f7e067e58e97ab001e31"
                                      shareText:[NSString stringWithFormat:@"%@ %@",str,model.msg]
                                     shareImage:imageView.image
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,nil]delegate:nil];
 
}


#pragma mark - NetWorkRequestDelegate
- (void)getDataSuccessWithObject:(id)object kind:(NSInteger)kind {
    
    NSDictionary *dictionary = object[@"data"];
    HotModel *model = [HotModel createModelWithDic:dictionary];
    [self.dataArr addObject:model];
    
    NSArray *arr = object[@"data"][@"top_comments"][@"object_list"];
    for (NSDictionary *dic in arr) {
        CommentObjectList *comment = [CommentObjectList createModelWithDic:dic];
        [self.commentArr addObject:comment];
    }
    [self.tableView reloadData];
}

- (void)getDataFail {
    
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请检查当前网络是否连接" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alertV show];
    [alertV release];
}
- (NSMutableArray *)dataArr {
    
    if (!_dataArr) {
        self.dataArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArr;
}
- (NSMutableArray *)commentArr {
    
    if (!_commentArr) {
        self.commentArr = [NSMutableArray arrayWithCapacity:0];
    }
    return _commentArr;
}
- (void)dealloc {
    
    self.dataArr = nil;
    [super dealloc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return self.commentCount == 0 ? 1 : 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    
    if (section == 0) {
        return 2;
    }else {
        
        return self.commentArr.count > 3 ? 5 :self.commentCount + 1 ;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        FoundDedatilTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"hotdetailcell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = [self.dataArr firstObject];
        
        if (self.dataArr.count != 0) {
            cell.imgView.frame = CGRectMake(10, 10, self.view.frame.size.width - 20, kItemWidth *cell.model.photo_height.floatValue / cell.model.photo_width.floatValue);
            cell.customView.frame = CGRectMake(10, ImageHeight + 20, self.view.frame.size.width - 20, 55);
        }
        return cell;
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        
        MsgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"msgcell"];
        cell.model = [self.dataArr firstObject];
        return cell;
        
    }else if (indexPath.section == 1){
        
        if (self.commentArr.count > 3) {
            if (indexPath.row == 0) {
                
                CommentCountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentcount" forIndexPath:indexPath];
                cell.model = [self.dataArr firstObject];
                return cell;
            }else if (indexPath.row == 4){
                
                CommentMoreViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"more"forIndexPath:indexPath];
                return cell;
            }else {
                
                CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentcell"forIndexPath:indexPath];
                if (self.commentArr.count != 0) {
                    
                    cell.commentModel = self.commentArr[indexPath.row - 1];
                }
                return cell;
            }
        }else {
            
            if (indexPath.row == 0) {
                
                CommentCountCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentcount" forIndexPath:indexPath];
                return cell;
            }else {
                
                CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentcell"forIndexPath:indexPath];
                
                if (self.commentArr.count != 0) {
                    
                    cell.commentModel = self.commentArr[indexPath.row - 1];
                }
                return cell;
            }
        }
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        if (self.dataArr.count == 0) {
            return 0;
        }else {
            HotModel *model = [self.dataArr firstObject];
            return kItemWidth *model.photo_height.floatValue / model.photo_width.floatValue  + 75;
        }
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        
        HotModel *model = [self.dataArr firstObject];
        CGRect rect = [model.msg boundingRectWithSize:CGSizeMake(300, 1000000) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
        
        return rect.size.height + 20;
        
    }else if (indexPath.section == 1 && indexPath.row == 0){
        
        return 60;
        
    }else if (indexPath.section == 1 && indexPath.row == 4){
        
        return 60;
        
    }else  {
        if (self.commentArr.count != 0) {
            CommentObjectList *model = self.commentArr[indexPath.row - 1];
            CGRect contentRect = [model.content boundingRectWithSize:CGSizeMake(300, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
            return contentRect.size.height + 45;
            
        }else{
            
            return 0;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ImageDetailViewController *imageDetail = [[ImageDetailViewController alloc]init];
            //设置模态的方式
            imageDetail.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            
            HotModel *model = [self.dataArr firstObject];
            imageDetail.photo_path = model.photo_path;
            imageDetail.photo_height = model.photo_height;
            imageDetail.photo_width = model.photo_width;
            [self presentViewController:imageDetail animated:YES completion:nil];
            [imageDetail release];
            
        }
    } else if(indexPath.section == 1 && indexPath.row == 4){
        
        ReplyViewController *comment = [[ReplyViewController alloc] init];
        comment.blog_id = self.blog_id;
        [self.navigationController pushViewController:comment animated:YES];
    } else if(indexPath.section == 1 && indexPath.row == 4){
        
        ReplyViewController *comment = [[ReplyViewController alloc] init];
        comment.blog_id = self.blog_id;
        [self.navigationController pushViewController:comment animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 20;
}
- (void)viewWillAppear:(BOOL)animated {
    
    
    self.hidesBottomBarWhenPushed = YES;
}
- (void)viewDidDisappear:(BOOL)animated {
    self.hidesBottomBarWhenPushed = NO;
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
