//
//  GoogleMacGeocoder.h
//  GoolgeMapGeocoder
//
//  Created by sky on 14/6/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^GoogleAddress)(id Address);
@interface GoogleMacGeocoder : NSObject

@property(retain,nonatomic) CLLocation *location;
@property (copy,nonatomic)GoogleAddress block;
@property(retain,nonatomic)NSData *AddressData;
-(void)setGoogleMacGeocoderLocation:(CLLocation*)location block:(GoogleAddress)block;
-(void)startAsynchronous:(NSURL *)googleGeocoderUrl block:(GoogleAddress)block;
@end
