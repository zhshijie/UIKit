//
//  DrawString.m
//  UILabel
//
//  Created by sky on 14/7/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "DrawString.h"

@implementation DrawString

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    //设置字体的大小
    UIFont *systemFont = [UIFont fontWithName:nil size:20];
    
    NSDictionary *dic =@{NSFontAttributeName:systemFont, NSStrokeColorAttributeName:[[UIColor greenColor] colorWithAlphaComponent:0.5]};
  
    //将string绘画在（0，200）处 ios 7.0后的绘制方法
    [self.message drawAtPoint:CGPointMake(0, 200) withAttributes:dic];
    
    //ios 7.0之前的绘制方法
    [self.message drawAtPoint:CGPointMake(0, 400) withFont:systemFont];
    

}


@end
