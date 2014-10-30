//
//  Imabe.h
//  UIOpreationDemo
//
//  Created by sky on 14/6/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//







#import <UIKit/UIKit.h>

@interface Imabe : UIImageView

@property (retain)NSMutableData *data;
-(void)setImageUrl:(NSURL *)url;
@end
