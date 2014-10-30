//
//  MyAppDelegate.m
//  UIViewController3.1
//
//  Created by sky on 14-6-4.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MyAppDelegate.h"
#import "helloWorldController1.h"
#import "HellowWorldViewController2.h"
@implementation MyAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    _rootController = [[UITabBarController alloc]init];
    
    UIViewController *_helloWorldViewController1;
    UIViewController *_helloWorldViewController2;
    _helloWorldViewController1 = [[[helloWorldController1 alloc]init]autorelease];
    _helloWorldViewController2 = [[[HellowWorldViewController2 alloc]init]autorelease];
    
    NSArray *tabs = [NSArray arrayWithObjects:_helloWorldViewController1,_helloWorldViewController2, nil];
    [_rootController setViewControllers:tabs animated:NO];
    [self.window addSubview:_rootController.view];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)dealloc
{
    [_rootController release],_rootController = nil;
    [_window release];
    [super dealloc];
}
@end
