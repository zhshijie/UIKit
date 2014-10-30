//
//  AppDelegate.h
//  backRuningDemo
//
//  Created by sky on 14/6/13.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    int counts;
    UIBackgroundTaskIdentifier tasKId;
}

@property (strong, nonatomic) UIWindow *window;


@end

