//
//  AppDelegate.m
//  8.12最精巧的全屏切换
//
//  Created by sky on 14/7/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"
#import "mainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
            

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    mainViewController *root = [[mainViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:root];
    nav.toolbarHidden = NO;
    self.window.rootViewController = nav;
    return YES;
}


@end
