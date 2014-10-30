//
//  GestureRecognizer.m
//  UIGestureRecognizerDemo
//
//  Created by sky on 14/6/10.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "GestureRecognizer.h"

@implementation GestureRecognizer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self gestureDemo];
    }
    return self;
}

-(void)gestureDemo
{
    
    /*---------------单击--------------*/
    UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)] autorelease];
    [self addGestureRecognizer:tap];
    
    
    /*---------------双击--------------*/
    UITapGestureRecognizer *doubleTap = [[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doubleTapAction:)] autorelease];
    doubleTap.numberOfTapsRequired = 2;
    [self addGestureRecognizer:doubleTap];
    
    //区分单，双击
    [tap requireGestureRecognizerToFail:doubleTap];
    
    /*---------------轻扫--------------*/
    //一个触摸识别器只能控制一个方向
    UISwipeGestureRecognizer *swipe = [[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)] autorelease];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipe];
    
      /*---------------捏合--------------*/
    UIPinchGestureRecognizer *pinch = [[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)]autorelease];
    [self addGestureRecognizer:pinch];
    
     /*---------------平移--------------*/
    UIPanGestureRecognizer *pan = [[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)]autorelease];
    [self addGestureRecognizer:pan];
    
    /*---------------旋转--------------*/
    UIRotationGestureRecognizer *rotation = [[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationAction:)] autorelease];
    [self addGestureRecognizer:rotation];
    
     /*---------------长按--------------*/
    UILongPressGestureRecognizer *longPress = [[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)]autorelease];
    longPress.minimumPressDuration = 2.0;
    [self addGestureRecognizer:longPress];
}

-(void)tapAction:(UITapGestureRecognizer*)tapGesture
{
    NSLog(@"单击");
}

-(void)doubleTapAction:(UITapGestureRecognizer*)tapGesture
{
    NSLog(@"双击");
}

-(void)swipeAction:(UISwipeGestureRecognizer*)tapGesture
{
    NSLog(@"轻扫");
}

-(void)pinchAction:(UIPinchGestureRecognizer *)pinchGesture
{
    NSLog(@"捏合");
}

-(void)panAction:(UIPanGestureRecognizer *)panGesture
{
    
    CGPoint point = [panGesture locationInView:self];
    NSLog(@"平移 : %@",NSStringFromCGPoint(point));
}

-(void)rotationAction:(UIRotationGestureRecognizer *)rotationGesture
{
    NSLog(@"%f",rotationGesture.rotation);
}


-(void)longPressAction:(UILongPressGestureRecognizer*)longPressGesture
{if(longPressGesture.state ==UIGestureRecognizerStateEnded )
{
    
}else
    NSLog(@"长按");
}
@end
