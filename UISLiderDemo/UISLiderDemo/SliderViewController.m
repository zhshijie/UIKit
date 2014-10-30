//
//  SliderViewController.m
//  UISLiderDemo
//
//  Created by sky on 14-6-6.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()

@end

@implementation SliderViewController

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
    
    //追加标签，将通过滑块控制的标签文字大小
    _label = [[UILabel alloc]init];
    _label.frame = self.view.bounds;
    _label.autoresizesSubviews = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _label.text = @"标题";
    _label.font = [UIFont boldSystemFontOfSize:48];
    _label.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:_label];
    
    //创建并初始化滑块对象
    UISlider *slider = [[UISlider alloc]init];
    slider.frame = CGRectMake(0, 0, 250, 50);
    slider.minimumValue = 0.0;
    slider.maximumValue = 1.0;
    slider.value = 0.5;
    
    // 初始值设置
    slider.center = self.view.center;
    
    //读入左侧及右侧的图标图片，并设置到minimumValueImage及maximu ValueImage的属性中
    UIImage *imageForMin = [UIImage imageNamed:@"roope_small"];
    UIImage *imageForMax = [UIImage imageNamed:@"roope_big"];
    slider.minimumValueImage = imageForMin;
    slider.maximumValueImage = imageForMax;
    
    //滑块的定制
    UIImage *imageForThumb = [UIImage imageNamed:@"thumb"];
    UIImage *imageMinBase = [UIImage imageNamed:@"left"];
    UIImage *imageForMin2 = [imageMinBase stretchableImageWithLeftCapWidth:4 topCapHeight:0];
    [slider setThumbImage:imageForThumb forState:UIControlStateNormal];
    [slider setMinimumTrackImage:imageForMin2 forState:UIControlStateNormal];
    [self.view addSubview:slider];
    
    //注册滑块变化时的响应方法
    [slider addTarget:self action:@selector(sliderDidChange:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view.
}

//滑块变化时的响应方法，其中设置标签的文字字体
-(void)sliderDidChange:(id)sender{
    if([sender isKindOfClass:[UISlider class]]){
        UISlider *slider = sender;
        _label.font = [UIFont boldSystemFontOfSize:(96*slider.value)];
        
}
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
