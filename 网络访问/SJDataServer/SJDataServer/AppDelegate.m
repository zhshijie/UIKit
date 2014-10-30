//
//  AppDelegate.m
//  SJDataServer
//
//  Created by sky on 14/6/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"
#import "SJDataServer.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(200, 200, 100, 50);
    [button addTarget:self action:@selector(load) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"text" forState:UIControlStateNormal];
    [self.window addSubview:button];
    
    return YES;
}


-(void)load
{
    NSDictionary *cityCode = @{@"code":@"101010300"};
    [SJDataServer getWeatherData:cityCode block:^(id result){
        NSLog(@"%@",result);
    }];
}
@end
