//
//  GoogleMacGeocoder.m
//  GoolgeMapGeocoder
//
//  Created by sky on 14/6/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "GoogleMacGeocoder.h"
#import "ASIHTTPRequest.h"

#define BASE_WEB @"http://maps.googleapis.com/maps/api/geocode/json?latlng="
@implementation GoogleMacGeocoder



-(void)setGoogleMacGeocoderLocation:(CLLocation *)location block:(GoogleAddress)block
{
    CLLocationCoordinate2D coordinate = location.coordinate;
    NSString *coordinateString = [NSString stringWithFormat:@"%lf,%lf&sensor=ture",coordinate.latitude,coordinate.longitude];
    NSString *gooleGeocoderString = [BASE_WEB stringByAppendingPathComponent:coordinateString];
    NSURL *googleGeocoderUrl = [NSURL URLWithString:gooleGeocoderString];
    
    [self startAsynchronous:googleGeocoderUrl block:block];

}


-(void)startAsynchronous:(NSURL *)googleGeocoderUrl block:(GoogleAddress)block
{
    NSURL *url= [NSURL URLWithString:@"http://maps.googleapis.com/maps/api/geocode/json?latlng=39.904299,116.22169&sensor=true"];
    ASIHTTPRequest *macRequestv = [ASIHTTPRequest requestWithURL:url];
    
    [macRequestv setRequestMethod:@"GET"];
    [macRequestv setTimeOutSeconds:600];
    [macRequestv setCompletionBlock:^{
       
        NSData *data = macRequestv.responseData;
        self.AddressData = data;
        id address = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
        NSLog(@"%@",address);
        block(address);
    }];
    
    [macRequestv setFailedBlock:^{
        NSLog(@"%@",macRequestv.error);
    }];
    [macRequestv startAsynchronous];
}


- (void)dealloc
{
    Block_release(_block);
    [_location release];
    [_AddressData release];
    [super dealloc];
}
@end
