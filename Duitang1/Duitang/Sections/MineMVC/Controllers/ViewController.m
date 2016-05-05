//
//  ViewController.m
//  第三方登录
//
//  Created by lanouhn on 15/6/29.
//  Copyright (c) 2015年 李加奇. All rights reserved.
//

#import "ViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <Parse/Parse.h>

//#import "BACKViewController.h"
#import "MainViewController.h"

#import "HotViewController.h"
#import "LYBgImageView.h"
#import "LYMovePathView.h"
#import "LYFireworksView.h"
#import <zlib.h>
#import "Manager.h"
#define VIEWWIDTH self.view.bounds.size.width
#define VIEWHEIGHT self.view.bounds.size.height
@interface ViewController ()
@property (nonatomic, retain)UILabel *nameLabel;
@property (nonatomic, retain)UILabel *promptLabel;
@property (nonatomic, retain)UIButton *regButton;
@property (nonatomic, retain)UILabel *infoLabel;
@property (nonatomic, retain)UIButton *loginbutton;

@property (nonatomic, copy)NSString * userName;
@property (nonatomic, copy)NSString * icon;
@property (nonatomic, copy)NSString * url;
@property (nonatomic, copy)NSString * aboutMe;

@end

@implementation ViewController

- (void)dealloc {
    self.nameLabel = nil;
    self.promptLabel = nil;
    self.infoLabel = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"添加";
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"walkthroughs_bg.png"]];
    
    //梦幻星空背景
    do {
        LYBgImageView *animationView = [[LYBgImageView alloc] initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT)];
        [self.view addSubview:animationView];
    } while (0);
    //第一条星星闪烁
    do {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, 0, 0);
        CGPathAddCurveToPoint(path, NULL, 50.0, 100.0, 50.0, 120.0, 50.0, 275.0);
        CGPathAddCurveToPoint(path, NULL, 50, 275.0, 150.0, 275.0, 160.0, 160.0);
        LYMovePathView *animationView = [[LYMovePathView alloc]initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT) movePath:path];
        [self.view addSubview:animationView];
        
    } while (0);
    
    //第二条星星
    do {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathMoveToPoint(path, NULL, VIEWHEIGHT - 0, VIEWHEIGHT - 0);
        CGPathAddCurveToPoint(path, NULL, VIEWHEIGHT - 50.0, VIEWHEIGHT - 100.0, VIEWHEIGHT - 50.0, VIEWHEIGHT - 120.0, VIEWHEIGHT - 50.0, VIEWHEIGHT - 275.0);
        CGPathAddCurveToPoint(path, NULL, VIEWHEIGHT - 50.0, VIEWHEIGHT - 275.0, VIEWHEIGHT - 150.0, VIEWHEIGHT - 275.0, 160.0, 160.0);
        LYMovePathView *animationView = [[LYMovePathView alloc]initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT) movePath:path];
        [self.view addSubview:animationView];
    } while (0);
    //彩色炮竹
    do {
        LYFireworksView *animationView = [[LYFireworksView alloc]initWithFrame:CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT)];
        [self.view addSubview:animationView];
    } while (0);
    
    [self createView];
    
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"登录" style:(UIBarButtonItemStylePlain) target:self action:@selector(denglu:)];
    
   
}


- (void)createView {
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 100, 150, 200, 50)];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.font = [UIFont boldSystemFontOfSize:50];
    _nameLabel.text = @"指尖分享";
    _nameLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:self.nameLabel];
    
    self.promptLabel = [[UILabel alloc]initWithFrame:CGRectMake(VIEWWIDTH / 2 - 125, 260, 250, 30)];
    _promptLabel.textAlignment = NSTextAlignmentCenter;
    _promptLabel.font = [UIFont boldSystemFontOfSize:25];
    _promptLabel.text = @"快乐的分享停留在指尖";
    [self.view addSubview:self.promptLabel];
    
    self.regButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_regButton setTitle:@"登录" forState:UIControlStateNormal];
    [_regButton setTitleColor:[UIColor purpleColor] forState:(UIControlStateNormal)];
    [_regButton setTintColor:[UIColor blackColor]];
    _regButton.frame = CGRectMake(VIEWWIDTH / 2 - 40, 360, 80, 40);
    _regButton.titleLabel.font = [UIFont boldSystemFontOfSize:30];
    
    _regButton.layer.borderColor =[UIColor whiteColor].CGColor;
    _regButton.layer.borderWidth = 4;
    [_regButton addTarget:self action:@selector(reg:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.regButton];
    
//    self.infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(VIEWWIDTH / 2 - 100, 450, 100, 30)];
//    _infoLabel.text = @"已有账号？";
//    _infoLabel.textColor = [UIColor whiteColor];
//    _infoLabel.textAlignment = NSTextAlignmentCenter;
//    [self.view addSubview:self.infoLabel];
//    
//    self.loginbutton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [_loginbutton setTitle:@"直接登录" forState:UIControlStateNormal];
//    [_loginbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    _loginbutton.frame = CGRectMake(VIEWWIDTH / 2 , 450, 100, 30);
//    [_loginbutton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.loginbutton];
    
    
}


- (void)reg:(UIButton *)button {
    
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            NSLog(@"uid = %@",[userInfo uid]);
            NSLog(@"name = %@",[userInfo nickname]);
            NSLog(@"icon = %@",[userInfo profileImage]);
            NSLog(@"url = %@",[userInfo url]);
            self.userName = [userInfo nickname];
            self.icon = [userInfo profileImage];
            self.url = [userInfo url];
            self.aboutMe = [userInfo aboutMe];
            //
            PFQuery *query = [PFQuery queryWithClassName:@"UserInfo"];
            [query whereKey:@"uid" equalTo:[userInfo uid]];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                
                if ([objects count] == 0)
                {
                    PFObject *newUser = [PFObject objectWithClassName:@"UserInfo"];
                    [newUser setObject:[userInfo uid] forKey:@"uid"];
                    [newUser setObject:[userInfo nickname] forKey:@"name"];
                    [newUser setObject:[userInfo profileImage] forKey:@"icon"];
                    [newUser saveInBackground];
                    
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎注册" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
                    [alertView show];
                }
                else
                {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎回来" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
                    [alertView show];
                }
            }];
            MainViewController *back = [[MainViewController alloc]init];
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:back];
            back.userName = self.userName;
            back.icon = self.icon;
            back.url = self.url;
            back.aboutMe = self.aboutMe;
            [self presentViewController:nav animated:YES completion:nil];
        }
    }];
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    HotViewController *hot = [[HotViewController alloc]init];
    
    [self.navigationController pushViewController:hot.navigationController animated:YES];

}

- (void)denglu:(UIBarButtonItem *)item {
    [ShareSDK getUserInfoWithType:ShareTypeSinaWeibo authOptions:nil result:^(BOOL result, id<ISSPlatformUser> userInfo, id<ICMErrorInfo> error) {
        if (result) {
            NSLog(@"uid = %@",[userInfo uid]);
            NSLog(@"name = %@",[userInfo nickname]);
            NSLog(@"icon = %@",[userInfo profileImage]);
            //
            PFQuery *query = [PFQuery queryWithClassName:@"UserInfo"];
            [query whereKey:@"uid" equalTo:[userInfo uid]];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                
                if ([objects count] == 0)
                {
                    PFObject *newUser = [PFObject objectWithClassName:@"UserInfo"];
                    [newUser setObject:[userInfo uid] forKey:@"uid"];
                    [newUser setObject:[userInfo nickname] forKey:@"name"];
                    [newUser setObject:[userInfo profileImage] forKey:@"icon"];
                    [newUser saveInBackground];
                    
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎注册" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
                    [alertView show];
                }
                else
                {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"欢迎回来" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles: nil];
                    [alertView show];
                }
            }];
            MainViewController *back = [[MainViewController alloc]init];
//            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:back];
            
            [self presentViewController:back animated:YES completion:nil];
                }
    }];
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
