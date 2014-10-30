//
//  MyViewController.m
//  UINavigationController3.4
//
//  Created by sky on 14-6-5.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController()

-(void)sliderDidChange;

@end

@implementation MyViewController

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
    
    self.navigationItem.prompt = @"移动滑块颜色将改变";
    
    //设置滑块的属性
    _slider = [[UISlider alloc]init];
    _slider.frame = self.navigationController.navigationBar.bounds;
    _slider.minimumValue = 0.0;
    _slider.maximumValue = 1.0;
    _slider.value =_slider.maximumValue/2.0;
    [_slider addTarget:self action:@selector(sliderDidChange) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setTitleView:_slider];
    
    
    //设置label的属性
    _label = [[UILabel alloc]init];
    _label.frame = CGRectInset(self.view.bounds, 10, 10);
    _label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    _label.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_label];
    // Do any additional setup after loading the view.
}

-(void)sliderDidChange
{
    UIColor *color = [[UIColor alloc]initWithRed:_slider.value/2.0 green:_slider.value/2.0 blue:_slider.value/2.0 alpha:1];
    _label.backgroundColor = color;
    
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
