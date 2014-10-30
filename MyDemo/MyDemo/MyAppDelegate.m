//
//  MyAppDelegate.m
//  MyDemo
//
//  Created by sky on 14/6/11.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MyAppDelegate.h"
#import "MyNavigationViewController.h"
#import "MyNameViewController.h"
#import "MyTableViewController.h"

@implementation MyAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
 
    
    MyTableViewController *tableView = [[[MyTableViewController alloc]init]autorelease];
    
    MyNavigationViewController *navigation = [[[MyNavigationViewController alloc]initWithRootViewController:tableView]autorelease];
    navigation.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"考核内容" image:[UIImage imageNamed:@"document"] selectedImage:nil];
    
    MyNameViewController *name = [[[MyNameViewController alloc]init]autorelease];
    name.tabBarItem =  [[UITabBarItem alloc]initWithTitle:@"作者" image:[UIImage imageNamed:@"contact"] tag:101];
    NSArray *alltab = @[navigation,name];
    
       UITabBarController *rootViewController = [[[UITabBarController alloc] init] autorelease];
    rootViewController.viewControllers =alltab;

    self.window.rootViewController = rootViewController;
    return YES;
}

@end
