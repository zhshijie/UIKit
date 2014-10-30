//
//  AppDelegate.m
//  UIOpreationDemo
//
//  Created by sky on 14/6/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"
#import "Imabe.h"



@interface AppDelegate ()
            

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    for (int i=0; i<10; i++) {
        Imabe *image = [[Imabe alloc]initWithFrame:CGRectMake(0, i*30, 100, 20)];
        [image setImageUrl:[NSURL URLWithString:@"http://img.anzhuo.im/public/picture/2012122401/1348137920992.jpg"]];
        [self.window addSubview:image];
    }
    return YES;
}

@end
