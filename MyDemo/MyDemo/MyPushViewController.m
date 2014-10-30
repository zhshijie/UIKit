//
//  MyPushViewController.m
//  MyDemo
//
//  Created by sky on 14/6/11.
//  Copyright (c) 2014年 sky. All rights reserved.
//
//栈是实际应用


#import "MyPushViewController.h"

@interface MyPushViewController ()

@end

@implementation MyPushViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.page = 0;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    
    //导航条不隐藏
    self.navigationController.navigationBarHidden = NO;
    button1.frame = CGRectMake(160-50, 100, 100, 50);
    button2.frame = CGRectMake(160-50, 200, 100, 50);

    [button1 setTitle:@"Push" forState:UIControlStateNormal];
    [button2 setTitle:@"Top" forState:UIControlStateNormal];

    [self.view addSubview:button1];
    [self.view addSubview:button2];
    
    [button1 addTarget:self action:@selector(Push:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(Top:) forControlEvents:UIControlEventTouchUpInside];
    if(self.page!=0)
    self.navigationItem.title  = [NSString stringWithFormat:@"第%d个页面",self.page];

    
}
-(void)Push:(UIButton *)sender
{
    MyPushViewController *push = [[[MyPushViewController alloc]init]autorelease];
    push.page = self.page +1;
    [self.navigationController pushViewController:push animated:YES];
}

-(void)Top:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
