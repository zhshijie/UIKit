//
//  DrawImage.m
//  UIImageVIew
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "DrawImage.h"

@implementation DrawImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithImage:(UIImage *)image
{
    if (self=[super init]) {
        _image = image;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //在drawAtPoint:和drawInRect:之间切换
    
    //将图片的起点定在rect.origin处
    [_image drawAtPoint:rect.origin];
    
    //将图片的显示范围限制在rect中
//    [_image drawInRect:rect];
    
    //blendMode 的指定
//    [_image drawInRect:rect
//             blendMode:kCGBlendModeNormal
//                 alpha:1.0];
    
}
- (void)dealloc
{
    [super dealloc];
    [_image release];
}


@end
