//
//  AppDelegate.m
//  NSThread
//
//  Created by sky on 14/6/15.
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
    
    
    //第一种方法
//    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(timerThread:) object:@"test"];
//    [thread start];
    
    //第二种方法
//    [NSThread detachNewThreadSelector:@selector(timerThread:)toTarget: self withObject:NULL];
//    
 
    
    //第三种方法
//    [self performSelectorInBackground:@selector(timerThread) withObject:NULL];
    
    //第四种方法
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    [queue addOperationWithBlock:^{
//        for (int i=0; i<100; i++) {
//            NSLog(@"多线程 %d",i);
//        }
//    }];
    
    //第五种方法
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(timerThread) object:NULL];
//    [queue addOperation:operation];
    
    //----GCD-----
    dispatch_queue_t queue =dispatch_queue_create("text", NULL);
    dispatch_async(queue, ^{
        for (int i=0; i<100; i++) {
            NSLog(@"多线程 %d",i);
        }
        
        BOOL isMultiThread = [NSThread isMultiThreaded];
        if (isMultiThread) {
            NSLog(@"----------------isMultiThread");
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            BOOL isMainThread = [NSThread isMainThread];
            if (isMainThread) {
                NSLog(@"----------------isMainThread");
            }
            
        });
    });
    
    for (int i=0; i<100; i++) {
        NSLog(@"主线程 %d",i);
    }
    return YES;
}

-(void)timerThread
{
    for (int i=0; i<100; i++) {
        NSLog(@"多线程 %d",i);
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
