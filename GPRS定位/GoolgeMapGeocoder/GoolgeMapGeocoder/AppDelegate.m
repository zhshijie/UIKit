//
//  AppDelegate.m
//  GoolgeMapGeocoder
//
//  Created by sky on 14/6/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"
#import  "GoogleMacGeocoder.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
     self.locationManager= [[[CLLocationManager alloc]init] autorelease];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
    
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
 
    return YES;
}


- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    GoogleMacGeocoder *mac = [[GoogleMacGeocoder alloc]init];
    for (CLLocation *place in locations) {
        [mac setGoogleMacGeocoderLocation:place block:^(id Address){
            NSLog(@"%@",Address);
        }];
    }
    [manager stopUpdatingLocation];
}

-(void)dealloc{
    [_locationManager release];
    [_window release];
    [super dealloc];
}
@end
