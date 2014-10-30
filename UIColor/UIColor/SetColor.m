//
//  SetColor.m
//  UIColor
//
//  Created by sky on 14/7/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "SetColor.h"

@implementation SetColor

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"bk2.png"];
    UIColor *patternColor = [UIColor colorWithPatternImage:image];
    
    //绘制四变形
    CGContextRef context= UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextAddRect(context, rect);
    CGContextClosePath(context);
    [[UIColor blackColor]set];
    
    //边框设置的颜色为灰色
    [patternColor setFill];
    
    //将背景颜色设置为图片
    CGContextDrawPath(context, kCGPathEOFillStroke);
    
    //绘制字符
    
    [[UIColor redColor]set];
    //将字体颜色设置为红色
    
    [@"PRETTY DOGS" drawInRect:rect withFont:[UIFont boldSystemFontOfSize:24] lineBreakMode:UILineBreakModeClip alignment:NSTextAlignmentCenter];
}


@end
