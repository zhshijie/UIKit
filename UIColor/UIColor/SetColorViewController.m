//
//  SetColorViewController.m
//  UIColor
//
//  Created by sky on 14/7/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "SetColorViewController.h"
#import "SetColor.h"

@interface SetColorViewController ()

@end

@implementation SetColorViewController

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
    
    SetColor *newView = [[[SetColor alloc]init]autorelease];
    newView.frame = CGRectMake(40, 140, 240, 240);
    [self.view addSubview:newView];

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
