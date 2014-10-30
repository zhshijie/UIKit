//
//  helloWorldController1.m
//  UIViewController3.1
//
//  Created by sky on 14-6-4.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "helloWorldController1.h"

@interface helloWorldController1 ()

@end

@implementation helloWorldController1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"Hello";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //追加“Hello World”标签
    //字体是黑色，背景是白色
    
    UILabel *label = [[[UILabel alloc]initWithFrame:self.view.bounds] autorelease];
    label.text = @"Hello World";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor blackColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:label];
    
    //追加按钮
    //按下时跳转的另一个画面
    /*
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"跳转画面" forState:UIControlStateNormal];
    [button sizeToFit];
    
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    CGPoint newPoint = self.view.center;
    newPoint.y+=50;
    button.center = newPoint;
    button.autoresizingMask =UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
     button.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:button];
    */
}

-(void)buttonDidPush
{
    [self.view.window sendSubviewToBack:self.view];
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
