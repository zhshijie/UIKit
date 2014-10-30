//
//  AnimationViewController.m
//  UIImageVIew
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_imageView startAnimating];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    

    NSMutableArray *array = [[NSMutableArray alloc]initWithCapacity:12];
    for (int index=0; index<12; index++) {
        NSString *imageString = [[NSString alloc]initWithFormat:@"%d.jpg",index+1];
        UIImage *image = [UIImage imageNamed:imageString];
        [array addObject:image];
        [image release];
        [imageString release];
        
    }
//    UIImage *image= [UIImage imageNamed:@"1.jpg"];
    
    
    _imageView = [[[UIImageView alloc]init]autorelease];
    _imageView.frame = CGRectMake(100, 100, 100, 100);
    
    //在NSArray中设置动画素材的图片
    _imageView.animationImages = array;
//    [array release];
    
    //将动画素材设置每隔0.5秒改变一次
    _imageView.animationDuration = 1;
//    _imageView.alpha = 0.5;
    _imageView.center = self.view.center;
    _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleTopMargin;
    
    [self.view addSubview:_imageView];
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
