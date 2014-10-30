//
//  DealAnimationViewController.m
//  UIImageVIew
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "DealAnimationViewController.h"

@interface DealAnimationViewController ()

@end

@implementation DealAnimationViewController

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
    
    self.view.backgroundColor = [UIColor blackColor];
    _image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"test1.png"]];
    _image.center = CGPointMake(160, 100);
    [self.view addSubview:_image];
    
    UIButton *button1=  [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"消融" forState:UIControlStateNormal];
    button1.frame = CGRectMake(20, 410, 100, 50);
    [button1 addTarget:self action:@selector(alphaAction:) forControlEvents:UIControlEventTouchUpInside];
    button1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button1];

    
    UIButton *button2=  [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setTitle:@"旋转" forState:UIControlStateNormal];
    button2.frame = CGRectMake(180, 410, 100, 50);
    [button2 addTarget:self action:@selector(transformAction:) forControlEvents:UIControlEventTouchUpInside];
    button2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:button2];
}

-(void)alphaAction:(UIButton*)button
{
    
    static UIViewAnimationCurve animationMode = UIViewAnimationCurveEaseIn;
    //下落先慢后快
    
    _image.center = CGPointMake(160, 100);
    //图片开始的位置
    
    [UIView beginAnimations:nil context:nil];
    //动画开始
    [UIView setAnimationDuration:2.0];
    //动画持续时间为1秒
    
    [UIView setAnimationDelay:1];
    //停顿3秒后动画开始
    
    [UIView setAnimationRepeatCount:10.0];
    //动画重复次数为10回
    
    [UIView setAnimationCurve:animationMode];
    //设置动画弧
    
    _image.center = CGPointMake(160, 400);
    //动画移动的终点位置
    
    _image.alpha = 0.0;
    //动画的最终透明度
    
    [UIView commitAnimations];
    //动画结束
}
-(void)transformAction:(UIButton*)button
{
    
    _image.transform = CGAffineTransformIdentity;
    
    static UIViewAnimationCurve animationcurve = UIViewAnimationCurveEaseInOut;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDelay:1.0];
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationCurve:animationcurve];
    [UIView setAnimationRepeatAutoreverses:YES];//设置反转
    
    //下面混合扩大与旋转
    CGAffineTransform transformScale = CGAffineTransformScale(CGAffineTransformIdentity, 2, 2);
    CGAffineTransform transformRotate = CGAffineTransformRotate(CGAffineTransformIdentity, M_PI);
    
    _image.transform = CGAffineTransformConcat(transformScale, transformRotate);
    [UIView commitAnimations];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag) {
        //当动画结束时调用
        NSLog(@"animationDidStop");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
