//
//  AppDelegate.m
//  backRuningDemo
//
//  Created by sky on 14/6/13.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
            

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerss:) userInfo:nil repeats:YES];
    
    if (counts==500) {
        [[UIApplication alloc]endBackgroundTask:tasKId];
        tasKId = [[UIApplication alloc]beginBackgroundTaskWithExpirationHandler:NULL];
        counts=0;
    }
    return YES;
}

-(void)timerss:(NSTimer *)timer
{
    counts++;
    NSLog(@"%d",counts);
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    tasKId = [application beginBackgroundTaskWithExpirationHandler:^{
        [application endBackgroundTask:tasKId];
    }];
}

@end
