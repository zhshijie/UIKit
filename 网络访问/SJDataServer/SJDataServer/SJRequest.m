//
//  SJRequest.m
//  SJDataServer
//
//  Created by sky on 14/6/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "SJRequest.h"

@implementation SJRequest

//开始异步访问网络
-(void)stratAsynrc{
    
    self.data = [[NSMutableData alloc]init];
    self.connection = [NSURLConnection connectionWithRequest:self delegate:self];
}

//结束异步访问网络
-(void)cancel
{
    [self.connection cancel];
}


#pragma mark -NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connectio
{
    self.block(self.data);
}

#pragma mark -NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"网络访问失败:%@",error);
}
@end
