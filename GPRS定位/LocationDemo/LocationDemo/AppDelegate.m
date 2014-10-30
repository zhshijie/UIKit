//
//  AppDelegate.m
//  LocationDemo
//
//  Created by sky on 14/6/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //CLLocationManager创建和初始化
    self.lacationManager = [[CLLocationManager alloc]init];
    
    //设置地图的精确度
    [self.lacationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    //设置调用定位代理的间隔时间
    
//    [self.lacationManager setDistanceFilter:CLLocationDistanceMax];
    
    self.lacationManager.delegate = self;
    
    [self.lacationManager startUpdatingLocation];
    
    return YES;
}


- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations {
    NSLog(@"-------locations:%@",locations);
    [manager stopUpdatingLocation];
    CLLocation *newlocation = [locations objectAtIndex:0];
    CLLocationCoordinate2D coordinate = newlocation.coordinate;
    NSLog(@"纬度：%f,经度:%f",coordinate.latitude,coordinate.longitude);
    //位置反编码
    self.geocoder = [[CLGeocoder alloc]init];
    [self.geocoder reverseGeocodeLocation:newlocation completionHandler:^(NSArray *placemarks, NSError *error){
        NSLog(@"placemarks:%@",placemarks);
        NSLog(@"error :%@",error);
        for (CLPlacemark *place in placemarks) {
            NSLog(@"%@",place);
            NSLog(@"name:%@",place.name);
            NSLog(@"thoroughfare:%@",place.thoroughfare);
            NSLog(@"subThoroughfare:%@",place.subThoroughfare);
            NSLog(@"locality:%@",place.locality);
            NSLog(@"subLocality:%@",place.subLocality);
            NSLog(@"country:%@",place.country);
            
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    CLLocationCoordinate2D coordinate = newLocation.coordinate;
    NSLog(@"经度：%f,纬度:%f",coordinate.latitude,coordinate.longitude);
    //位置反编码
    NSLog(@"%@",newLocation);
    self.geocoder = [[CLGeocoder alloc]init];
    [self.geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error){
        NSLog(@"placemarks:%@",placemarks);
        NSLog(@"error :%@",error);
        for (CLPlacemark *place in placemarks) {
            NSLog(@"%@",place);
            NSLog(@"name:%@",place.name);
            NSLog(@"thoroughfare:%@",place.thoroughfare);
            NSLog(@"subThoroughfare:%@",place.subThoroughfare);
            NSLog(@"locality:%@",place.locality);
            NSLog(@"subLocality:%@",place.subLocality);
            NSLog(@"country:%@",place.country);
            
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    NSLog(@"定位失败:%@",error);
}
@end
