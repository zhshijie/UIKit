//
//  StretchableImageViewController.m
//  UIImageVIew
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "StretchableImageViewController.h"

@interface StretchableImageViewController ()

@end

@implementation StretchableImageViewController

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
    
    //读入图片
    UIImage *image = [UIImage imageNamed:@"test1.png"];
    
    //限制图片的伸缩区域创建标题用的图片(仅仅使用在边框宽度的限制)
    UIImage *imageWithCap = [image stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    
    //没有获取图片做为背景按钮
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 100,100, 50);
    [button setTitle:@"没有图片" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    //将imagewithCap图片作为按钮的背景
    UIButton *button1  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setBackgroundImage:imageWithCap forState:UIControlStateNormal];
    [button1 sizeToFit];
    button1.center = CGPointMake(200, 300);
    [self.view addSubview:button1];
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
