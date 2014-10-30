//
//  touch.m
//  UItouchDemo
//
//  Created by sky on 14/6/10.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "touch.h"

@implementation touch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        littleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        littleView.backgroundColor = [UIColor yellowColor];
        [self addSubview:littleView];
        self.multipleTouchEnabled = YES;
    }
    return self;
}


//触摸开始
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //单击和双击
    /*
//    NSLog(@"touchesBegan");
    
    UITouch *touch = [touches anyObject];
     NSInteger numOfTap = [touch tapCount];
//    NSLog(@"%d",numOfTap);
    
    if(numOfTap == 1)
    {
        [self performSelector:@selector(oneTap) withObject:nil afterDelay:0.5];
    }
    else if(numOfTap == 2)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(oneTap) object:nil];
        [self DoubleTap];
    }*/
    
    //两点间的距离，捏合
    if([touches count]==2){
    NSArray *touchArray = [touches allObjects];
    UITouch *firstTouch = [touchArray objectAtIndex:0];
    UITouch *secondTouch = [touchArray objectAtIndex:1];
    
    CGPoint point1 = [firstTouch locationInView:self];
    CGPoint point2 = [secondTouch locationInView:self];
    
    float distance = [self distancesPoint1:point1 Point2:point2];
    location = distance;
    }
}

//事件取消
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"touchesCancelled");
}
//触摸结束
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"touchesEnded");
}

//触摸移动
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"touchesMoved");
    //拖动小方格
    /*
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGRect   frame = littleView.frame;
    frame.origin = point;
    littleView.frame = frame;
     */
    
    //捏合
    if([touches count]==2){
    NSArray *touchArray = [touches allObjects];
    UITouch *firstTouch = [touchArray objectAtIndex:0];
    UITouch *secondTouch = [touchArray objectAtIndex:1];
    
    CGPoint point1 = [firstTouch locationInView:self];
    CGPoint point2 = [secondTouch locationInView:self];
    
    float distance = [self distancesPoint1:point1 Point2:point2];
    
    if(location>distance)
    {
        NSLog(@"捏合缩小");
    }else
    {
        NSLog(@"张开扩大");
    }
    location = distance;
    }
}

//计算两点间的距离
-(float)distancesPoint1:(CGPoint)p1 Point2:(CGPoint)p2
{
    return sqrtf(pow(p1.x-p2.x, 2)+pow(p1.y+p2.y, 2));
}

//单击与双击
/*
-(void)DoubleTap
{
    NSLog(@"双击");
}

-(void)oneTap
{
    NSLog(@"单击");
}
*/
@end
