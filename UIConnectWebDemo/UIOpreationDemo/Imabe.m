//
//  Imabe.m
//  UIOpreationDemo
//
//  Created by sky on 14/6/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "Imabe.h"

@implementation Imabe

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setImageUrl:(NSURL *)url
{
//    @autoreleasepool {
//        dispatch_queue_t queue = dispatch_queue_create("image", NULL);
//        dispatch_async(queue, ^{
//            NSData *imageData = [NSData dataWithContentsOfURL:url];
//            UIImage *image = [UIImage imageWithData:imageData];
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                self.image = image;
//            });
//        });
//    }
    
    //-----------NSMutableURLRequest同步请求网络数据
    /*
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"GET"];
    [request setURL:url];
    [request setTimeoutInterval:60];
    NSURLResponse *response;
    NSData *responData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:NULL];
    self.image = [UIImage imageWithData:responData];
    */
    //-----------NSMutableURLRequest异步请求网络数据---方法一
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]init];
    [request setHTTPMethod:@"GET"];
    [request setURL:url];
    [request setTimeoutInterval:60];
    self.data = [[NSMutableData alloc]init];
    //方法一
    /*
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError){
        dispatch_sync(dispatch_get_main_queue(), ^{
         self.image = [UIImage imageWithData:data];
        });
        
    }];*/
    [NSURLConnection connectionWithRequest:request delegate:self ];
}


#pragma mark - NSURLConnectionDelegate 

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
//    NSLog(@"%@",self.data);
    self.image = [UIImage imageWithData:self.data];
}

@end
