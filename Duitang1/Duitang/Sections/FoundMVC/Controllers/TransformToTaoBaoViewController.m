//
//  TransformToTaoBaoViewController.m
//  Duitang
//
//  Created by lanouhn on 15/6/22.
//  Copyright (c) 2015年 lanouhn. All rights reserved.
//

#import "TransformToTaoBaoViewController.h"

@interface TransformToTaoBaoViewController ()

@end

@implementation TransformToTaoBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.tabBarController.tabBar.layer.hidden = YES;
    
    //创建UIWebView；
    UIWebView * web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
//    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[@"http://www.duitang.com/redirect/?to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fspm%3Da1z10.3-c.w4002-9004276593.106.Jliz3n%26id%3D45289488959&spm=2014.12553688.110.0&mk=mbd_385047596&app_code=gandalf" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];

    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[self.source_link stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]]];

    web.delegate = self;
    [self.view addSubview:web];
    
    [web release];

    
}
#pragma UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView {

    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {

    
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {

    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    //根据requst进行判断是否允许加载
    
    if ([request.URL.absoluteString isEqualToString:@"http://tieba.baidu.com/f?kw=%E7%BE%8E%E5%A5%B3&mo_device=1"]) {
        return NO;
    }
    
    
    return YES;
    
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
