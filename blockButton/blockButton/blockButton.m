//
//  blockButton.m
//  blockButton
//
//  Created by sky on 14/6/12.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "blockButton.h"

@implementation blockButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

-(void)click:(blockButton*)button
{
    _block(self);
}
@end
