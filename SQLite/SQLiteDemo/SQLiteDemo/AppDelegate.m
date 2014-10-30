//
//  AppDelegate.m
//  SQLiteDemo
//
//  Created by sky on 14/6/18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"
#import "UserData.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    UserData *user = [[UserData alloc]init];
//    [user creatsqlite];
    [user insertsqlite];
//    [user selectsqlite];
    
    return YES;
}

@end
