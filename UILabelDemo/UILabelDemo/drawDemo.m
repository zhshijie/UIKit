//
//  drawDemo.m
//  UILabelDemo
//
//  Created by sky on 14-6-5.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "drawDemo.h"

@implementation drawDemo

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    for(int y = -2; y < 4 ; ++y){
        for(int x = -2; x <= 4; ++x)
        {
            CGRect drawRect = CGRectMake(rect.origin.x+x, rect.origin.y+y, rect.size.width, rect.size.height);
            [self.text drawInRect:drawRect withFont:self.font lineBreakMode:self.lineBreakMode alignment:self.textAlignment];
        }
    }
}


@end
