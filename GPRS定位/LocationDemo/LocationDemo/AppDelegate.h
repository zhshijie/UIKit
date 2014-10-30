//
//  AppDelegate.h
//  LocationDemo
//
//  Created by sky on 14/6/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong,nonatomic) CLLocationManager *lacationManager;
@property(strong,nonatomic)CLGeocoder *geocoder;
@end
