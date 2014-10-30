//
//  AppDelegate.m
//  UIWebView
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"
#import "WebViewTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    WebViewTableViewController *web = [[WebViewTableViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:web];
    self.window.rootViewController = nav;

    return YES;
}

@end
