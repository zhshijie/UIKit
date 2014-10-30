//
//  MyViewController.m
//  scrollView
//
//  Created by sky on 14-6-9.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

@synthesize number = number_;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//传入数值初始化MyViewController实例方法
+(MyViewController *)myViewControllerWithNumber:(NSInteger)number
{
    MyViewController *myViewController = [[MyViewController alloc]init];
    myViewController.number = number;
    return myViewController;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc]init];
    label.frame = self.view.bounds;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    label.backgroundColor = (self.number % 2)?[UIColor blackColor]:[UIColor whiteColor];
    label.textColor = (self.number % 2)?[UIColor whiteColor]:[UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:128];
    label.text =[NSString stringWithFormat:@"%ld",self.number];
    [self.view addSubview:label];
    
    
    // Do any additional setup after loading the view.
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
