//
//  ImageScrollView.m
//  UIscrollPhotoDemo
//
//  Created by sky on 14/6/10.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "ImageScrollView.h"

@implementation ImageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //设置扩大或缩小倍数
        self.maximumZoomScale = 2.5;
        self.minimumZoomScale = 1.0;
        //设置代理
        self.delegate = self;
        
        //初始化图片
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        //隐藏滑块
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        
        [self addSubview:_imageView];
        
        //添加双击事件
        self.doubleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoomInOrOut:)];
        self.doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:self.doubleTap];
        
    }
    return self;
}

#pragma mark - ScrollView Delegate

-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}


#pragma mark - Double Event

//双击画面是放大接触点附近的画面
- (void)zoomInOrOut:(UITapGestureRecognizer *)tapGesture
{
    if (self.zoomScale >= 2.5) {
        [self setZoomScale:1 animated:YES];
    }else {
        CGPoint point = [tapGesture locationInView:self];
        [self zoomToRect:CGRectMake(point.x - 40, point.y - 40, 80, 80) animated:YES];
    }
}

- (void)dealloc
{
    [_imageView release];
    _imageView = nil;
    [_doubleTap release];
    [super dealloc];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
