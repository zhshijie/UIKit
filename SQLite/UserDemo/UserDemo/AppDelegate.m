//
//  AppDelegate.m
//  UserDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    MainViewController *main = [[MainViewController alloc]init];
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:main];
    self.window.rootViewController = navigation;
    
    return YES;
}
@end
