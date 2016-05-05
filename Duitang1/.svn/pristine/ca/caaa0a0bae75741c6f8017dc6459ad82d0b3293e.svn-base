//
//  NetWorkRequest.m
//  NetWorkRequest
//
//  Created by lanouhn on 15/6/3.
//  Copyright (c) 2015年 李加奇. All rights reserved.
//

#import "NetWorkRequest.h"

@interface NetWorkRequest ()
@property (nonatomic, retain)NSMutableData *netWorkData;
@property (nonatomic, assign)NSInteger kindcc;
//存储网络链接对象
@property (nonatomic, retain)NSURLConnection *connection;
@end

@implementation NetWorkRequest
//开始进行网络请求
- (void)startNetWorkRequestWithURL:(NSString *)urlstr method:(NSString *)method parameters:(NSMutableDictionary *)parameters kind:(NSInteger)kind orContainChinese:(BOOL)orContain {
    self.kindcc = kind;
    //判断当前网址中是否含有中文
    if (orContain) {
        urlstr = [urlstr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    //创建网址对象
    NSURL *url = [NSURL URLWithString:urlstr];
    
    //设置请求对象
    NSMutableURLRequest *request = [[[NSMutableURLRequest alloc]initWithURL:url]autorelease];
    if ([method isEqualToString:@"POST"]) {
       //设置请求方式
        request.HTTPMethod = method;
        //设置请求体
        NSString *parameter = [self dealWithParameters:parameters];
        [request setHTTPBody:[parameter dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    //进行网络请求
  self.connection = [NSURLConnection connectionWithRequest:request delegate:self];
    
    
}

//取消当前的网络请求
- (void)cancleNetWorkRequest {
    [self.connection cancel];
}

//处理 POST 参数
- (NSString *)dealWithParameters:(NSMutableDictionary *)parameters {
    //创建数组存储固定格式的参数和参数对应的值
    NSMutableArray *parametersStrs = [NSMutableArray arrayWithCapacity:0];
    for (NSString *key in [parameters allKeys]) {
        //将参数和对应的值拼接成固定的格式
        NSString *parameterStr = [NSString stringWithFormat:@"%@=%@",key,parameters[key]];
        [parametersStrs addObject:parameterStr];
    }
    return [parametersStrs componentsJoinedByString:@"&"];
}

#pragma ConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    self.netWorkData = [NSMutableData dataWithCapacity:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.netWorkData appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    //数据解析
    id object = [NSJSONSerialization JSONObjectWithData:self.netWorkData options:NSJSONReadingMutableContainers error:nil];
    
    //将网络请求到得数据传给指定的界面
    
   // self.successblock(object);
        if (self.delegate && [self.delegate respondsToSelector:@selector(getDataSuccessWithObject:kind:)]) {
            [self.delegate getDataSuccessWithObject:object kind:self.kindcc];
        }

    
//    if ([self.delegate respondsToSelector:@selector(getDataSuccessWithObject:kind:)]) {
//        [self.delegate getDataSuccessWithObject:object kind:self.kindcc ];
//    }
}

- (void)dealloc {
    self.netWorkData = nil;
    self.connection = nil;
    [super dealloc];
}

@end
