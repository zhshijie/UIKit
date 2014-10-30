//
//  AppDelegate.m
//  ASIDemo
//
//  Created by sky on 14/6/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"
#import "AsiImage.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(200, 100, 100, 10);
    [button setTitle:@"test" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(load) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];
    
    return YES;
}

-(void)load
{
        AsiImage *image = [[AsiImage alloc]initWithFrame:CGRectMake(0, 150, 320, 320)];
        NSURL *url = [NSURL URLWithString:@"http://img.anzhuo.im/public/picture/2012122401/1348137920992.jpg"];
        [image setImageURL:url];
        [self.window addSubview:image];
}

@end
