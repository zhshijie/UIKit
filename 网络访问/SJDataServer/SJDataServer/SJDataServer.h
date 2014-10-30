//
//  SJDataServer.h
//  SJDataServer
//
//  Created by sky on 14/6/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^Completion) (id result);

@interface SJDataServer : NSObject

@property(copy,nonatomic)Completion block;

//访问天气预报接口
+(void)getWeatherData:(NSDictionary*)params block:(Completion)block;
+(void)startRequest:(NSDictionary*)params
          urlString:(NSString*)urlString
              isGet:(BOOL)get
              block:(Completion)blcok;
@end
