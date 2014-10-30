//
//  AppDelegate.m
//  PackageSQLDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"
#import "SQLDB.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    SQLDB *sqlite = [[SQLDB alloc]init];
    NSMutableArray *data = [[NSMutableArray alloc]init];
    data = [sqlite selectData:@"SELECT username,password,email FROM User WHERE username = 'Jone'" columns:3];
    
    NSLog(@"%@",data);
    return YES;
}

@end
