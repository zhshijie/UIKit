//
//  AsiImage.m
//  ASIDemo
//
//  Created by sky on 14/6/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AsiImage.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "ASIDownloadCache.h"

@implementation AsiImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setImageURL:(NSURL*)url
{
    //同步网络访问
//    [self Synchronous:url];
    
    //异步网络访问
    [self Asynchronous:url];
}

-(void)Synchronous:(NSURL*)url
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc]initWithURL:url];
    [request setTimeOutSeconds:60];
    [request setRequestMethod:@"GET"];
    [request startSynchronous];

    NSError *error = request.error;
    if (error) {
        NSLog(@"网络访问出错");
    }
    else
    {
        NSData *data = request.responseData;
        UIImage *image= [UIImage imageWithData:data];
        self.image = image;
    }
    
}

-(void)Asynchronous:(NSURL*)url
{
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc]initWithURL:url];
    [request setTimeOutSeconds:60];
    [request setRequestMethod:@"GET"];
    
    //设置缓存
    //缓存路径
    NSString *cachePatch = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    
    ASIDownloadCache *cache = [[ASIDownloadCache alloc]init];
    [cache setStoragePath:cachePatch];
    cache.defaultCachePolicy = ASIOnlyLoadIfNotCachedCachePolicy;
    
    //设置缓存策略
    request.cacheStoragePolicy =ASICachePermanentlyCacheStoragePolicy;
    [request setDownloadCache:cache];
    
    //使用代理监听
//    request.delegate = self;
    
    //使用block监听
    [request setCompletionBlock:^{
       
        
        NSError *error = request.error;
        if (error) {
            NSLog(@"网络访问出错");
        }
        else
        {
            NSData *data = request.responseData;
            UIImage *image= [UIImage imageWithData:data];
            self.image = image;
        }
    }];
    
    
    [request startAsynchronous];
  
    
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
        NSData *data = request.responseData;
        UIImage *image= [UIImage imageWithData:data];
        self.image = image;
}
- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSLog(@"访问网络错误");
}

@end
