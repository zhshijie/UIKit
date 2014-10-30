//
//  ViewController.m
//  touch
//
//  Created by sky on 14/7/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    BOOL _singleTap;
}
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - touch Event

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSInteger touchCount = [[touches anyObject]tapCount];
    if (touchCount<3) {
        _singleTap = YES;
        [self performSelector:@selector(singeTouch) withObject:nil afterDelay:0.5f];
    }
    else{
        [self performSelector:@selector(doubleTouch)];
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _singleTap = NO;
}


-(void)doubleTouch
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Double" message:@"Touch" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];
}

-(void)singeTouch
{
    
    if (!_singleTap) {
        return;
    }
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"singe" message:@"Touch" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [alert show];
}
@end
