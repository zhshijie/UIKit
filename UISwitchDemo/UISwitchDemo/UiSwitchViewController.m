//
//  UiSwitchViewController.m
//  UISwitchDemo
//
//  Created by sky on 14-6-5.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "UiSwitchViewController.h"

@interface UiSwitchViewController ()

@end

@implementation UiSwitchViewController

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //UISwitch对象的创建与初始化
    
    switch1_ = [[UISwitch alloc]init];
    switch1_.center = CGPointMake(100, 150);
    
    //默认设置为NO
    switch1_.on = YES;
    
    //开关变化时，调用swithcDidChange方法
    [switch1_ addTarget:self action:@selector(switchDidChange) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:switch1_];
    
    //创建第二各UiSwitch对象
    switch2_ = [[UISwitch alloc]init];
    switch2_.center = CGPointMake(100, 200);
    
    //默认设置为OFF
    switch2_.on = NO;
    [self.view addSubview:switch2_];
  
      
    
    // Do any additional setup after loading the view.
}

-(void)switchDidChange
{
    //switch1_变化后switch2_也一起改变
    [switch2_ setOn:!switch2_.on animated:YES];
}

- (void)dealloc
{
    [switch1_ release];
    [switch2_ release];
    switch2_ = nil;
    switch1_ = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
