//
//  MyMainViewController.m
//  AnimaDemo
//
//  Created by sky on 14/6/12.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MyMainViewController.h"

@interface MyMainViewController ()

@end

@implementation MyMainViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)StateAction:(UIButton *)sender {
    
    [UIView animateWithDuration:0.7 animations:^{
        CGRect frame = self.myView.frame;
        frame.origin.y +=200;
        self.myView.frame = frame;
    } completion:^(BOOL finish){
        if (finish) {
            [UIView animateWithDuration:0.7 animations:^{
                CGRect frame = self.myView.frame;
                frame.origin.y -=200;
                self.myView.frame = frame;
            }];
        }
    }];
}
@end
