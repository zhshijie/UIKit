//
//  SJDataServer.m
//  SJDataServer
//
//  Created by sky on 14/6/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "SJDataServer.h"
#import "SJRequest.h"

#define BASE_URL @"http://www.weather.com.cn/data/sk/"

@implementation SJDataServer


//访问天气预报接口
+(void)getWeatherData:(NSDictionary*)params block:(Completion)block
{
    
    NSString *cityCode = [params objectForKey:@"code"];
    NSString *cityString = [BASE_URL stringByAppendingFormat:@"%@.html",cityCode];
    
    [self startRequest:params urlString:cityString isGet:YES block:block];
  
    
}

+(void)startRequest:(NSDictionary*)params
          urlString:(NSString*)urlString
              isGet:(BOOL)get
              block:(Completion)block{
    
    SJRequest *request = [SJRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setTimeoutInterval:600];
    if (get) {
        [request setHTTPMethod:@"GET"];
    }
    else
    {
        [request setHTTPMethod:@"POST"];
    }
    
    request.block = ^(NSData *data)
    {
        
        NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"data:%@",dataString);
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        block(result);
    };
    
    [request stratAsynrc];
}

@end
