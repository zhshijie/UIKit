//
//  MyNavigationViewController.m
//  MyDemo
//
//  Created by sky on 14/6/11.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MyNavigationViewController.h"
#import "MyTableViewController.h"

@interface MyNavigationViewController ()

@end

@implementation MyNavigationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    MyTableViewController *table = [[[MyTableViewController alloc]init]autorelease];
    [self pushViewController:table animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
