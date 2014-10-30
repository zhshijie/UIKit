//
//  SJRequest.h
//  SJDataServer
//
//  Created by sky on 14/6/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^FinishLoadBlock) (NSData *data);

@interface SJRequest : NSMutableURLRequest

@property (retain,nonatomic)NSMutableData *data;
@property(retain,nonatomic)NSURLConnection *connection;
@property(copy,nonatomic)FinishLoadBlock block;

//开始异步访问网络
-(void)stratAsynrc;

//结束异步访问网络
-(void)cancel;

//+(void)
@end
