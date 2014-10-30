//
//  HellowWorldViewController2.m
//  UIViewController3.1
//
//  Created by sky on 14-6-4.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "HellowWorldViewController2.h"

@interface HellowWorldViewController2 ()

@end

@implementation HellowWorldViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"你好";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //追加“嘿，你好”标签
    //字体是白色，背景是黑色
    
    UILabel *label = [[[UILabel alloc]initWithFrame:self.view.bounds] autorelease];
    label.text = @"嘿，你好";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:label];
    /*
     //追加按钮
    //按下时跳转的另一个画面
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"跳转画面" forState:UIControlStateNormal];
    [button sizeToFit];
    button.titleLabel.textColor = [UIColor whiteColor];
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    CGPoint newPoint = self.view.center;
    newPoint.y+=50;
    button.center = newPoint;
    button.autoresizingMask =UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin;
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
