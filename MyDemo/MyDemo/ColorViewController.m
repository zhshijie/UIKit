//
//  ColorViewController.m
//  MyDemo
//
//  Created by sky on 14/6/11.
//  Copyright (c) 2014年 sky. All rights reserved.
//


//不同颜色画面的切换

#import "ColorViewController.h"

@interface ColorViewController ()

@end

@implementation ColorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithColor:(UIColor* )color
{
    if(self = [super init])
    {
        _color=[color retain];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = _color;

    fatherView= [[UIView alloc]initWithFrame:CGRectMake(0, 60, 320, 300)];
    [self.view addSubview:fatherView];
    
    //初始化红，蓝，黄三个界面
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    redView.backgroundColor = [UIColor redColor];
    UILabel *redTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    redTitle.text = @"RED";
    redTitle.textAlignment =NSTextAlignmentCenter;
    [redView addSubview:redTitle];
    redView.tag = 101;
    
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    blueView.tag = 102;
    blueView.backgroundColor = [UIColor blueColor];
    UILabel *blueTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    blueTitle.text = @"BLUE";
    blueTitle.textAlignment =NSTextAlignmentCenter;
    [blueView addSubview:blueTitle];
    
    UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    yellowView.backgroundColor = [UIColor yellowColor];
    yellowView.tag = 103;
    
    UILabel *yellowTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 300)];
    yellowTitle.text = @"YELLOW";
    yellowTitle.textAlignment =NSTextAlignmentCenter;
    [yellowView addSubview:yellowTitle];
    
    
    [fatherView addSubview:redView];
    [fatherView addSubview:blueView];
    [fatherView addSubview:yellowView];
    
    //三种颜色切换按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    button1.frame = CGRectMake(6, 360+10, 100, 50);
    button2.frame = CGRectMake(100+6, 360+10, 100, 50);
    button3.frame = CGRectMake(200+6, 360+10, 100, 50);
    
    button1.backgroundColor = [UIColor redColor];
    button2.backgroundColor = [UIColor blueColor];
    button3.backgroundColor = [UIColor yellowColor];
    
    button1.titleLabel.textColor = [UIColor whiteColor];
    button2.titleLabel.textColor = [UIColor whiteColor];
    button3.titleLabel.textColor = [UIColor whiteColor];
    
    [button1 setTitle:@"Red" forState:UIControlStateNormal];
    [button2 setTitle:@"Blue" forState:UIControlStateNormal];
    [button3 setTitle:@"Yellow" forState:UIControlStateNormal];
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    
    [button1 addTarget:self action:@selector(ColorDidChange:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(ColorDidChange:) forControlEvents:UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(ColorDidChange:) forControlEvents:UIControlEventTouchUpInside];
}


//按到哪个颜色按钮，切换到该颜色的界面
-(void)ColorDidChange:(UIButton *)sender
{
    if(sender.backgroundColor ==[UIColor redColor])
    {
    
//        [UIView animateWithDuration:1 animations:^{
//            UIView *view = [self.view viewWithTag:101];
//            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:fatherView cache:YES];
//            [fatherView bringSubviewToFront:view];
        
        [UIView transitionWithView:fatherView duration:1 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            UIView *view = [self.view viewWithTag:101];
            [fatherView bringSubviewToFront:view];
        }completion:NULL
        ];
   
    }
    else if(sender.backgroundColor ==[UIColor blueColor])
    {
        [UIView animateWithDuration:1 animations:^{
            
            UIView *view = [self.view viewWithTag:102];
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:fatherView cache:YES];
      [fatherView bringSubviewToFront:view];
        }];
       
    }
    else if(sender.backgroundColor == [UIColor yellowColor])
    {
        [UIView transitionWithView:fatherView duration:1 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            UIView *view = [self.view viewWithTag:103];
            [fatherView bringSubviewToFront:view];
        }completion:NULL
         ];
    }
    
}

-(void)dealloc
{
    [_color release];
    _color = nil;
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
