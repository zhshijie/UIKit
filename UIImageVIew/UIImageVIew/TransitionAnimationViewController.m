//
//  TransitionAnimationViewController.m
//  UIImageVIew
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "TransitionAnimationViewController.h"

#define kTag 10
@interface TransitionAnimationViewController ()

-(UIView*)_nextView;
@end

@implementation TransitionAnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:[self _nextView]];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //如果非动画可运行状态就返回
    if (![UIView areAnimationsEnabled]) {
        [self.nextResponder touchesEnded:touches withEvent:event];
        return;
    }
    
    //过渡动画的初始设置
    static UIViewAnimationTransition transition = UIViewAnimationTransitionFlipFromLeft;
    
    UIView *nextView = [self _nextView];
    
    //创建下一个画面
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [[self.view viewWithTag:kTag] removeFromSuperview];
    [self.view addSubview:nextView];
    
    //暂时件动画置于无效状态
    [UIView commitAnimations];
    //切换到过渡动画效果
    
    if (UIViewAnimationTransitionCurlDown<++transition) {
        transition = UIViewAnimationTransitionFlipFromLeft;
    }
    
}

-(UIView*)_nextView
{
    static BOOL isFront = YES;

    UIImage *image1;
    if (isFront) {
        image1 = [UIImage imageNamed:@"1.jpg"];
    }else
    {
        image1 = [UIImage imageNamed:@"12.jpg"];
    }
    isFront = (YES!=isFront);
    UIView *view = [[[UIImageView alloc]initWithImage:image1]autorelease];
    view.tag = kTag;
    view.frame = self.view.frame;
    view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    view.contentMode = UIViewContentModeScaleAspectFill;
    return view;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
