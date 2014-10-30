//
//  Imabe.m
//  UIOpreationDemo
//
//  Created by sky on 14/6/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "Imabe.h"

@implementation Imabe

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setImageUrl:(NSURL *)url
{
    @autoreleasepool {
        dispatch_queue_t queue = dispatch_queue_create("image", NULL);
        dispatch_async(queue, ^{
            NSData *imageData = [NSData dataWithContentsOfURL:url];
            UIImage *image = [UIImage imageWithData:imageData];
            dispatch_sync(dispatch_get_main_queue(), ^{
                self.image = image;
            });
        });
    }
}


@end
