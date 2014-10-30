//
//  ViewController.m
//  滚球效果
//
//  Created by sky on 14/7/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //添加球体的UIImageView
    UIImage *image = [UIImage imageNamed:@"metal.png"];
    _imageView = [[UIImageView alloc]initWithImage:image];
    _imageView.center = self.view.center;
    _imageView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin|
    UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
    [self.view addSubview:_imageView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIAccelerometer *acclermeter = [UIAccelerometer sharedAccelerometer];
    acclermeter.updateInterval = 1.0/60;
    acclermeter.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _speedX = _speedY = 0.0;
    UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.delegate = nil;
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    _speedX+=acceleration.x;
    _speedY+=acceleration.y;
    CGFloat posX = _imageView.center.x+_speedX;
    CGFloat posY = _imageView.center.y+_speedY;

    if (posX<0.0) {
        _speedX *=-0.4;
    }else if(posX>self.view.bounds.size.width)
    {
        posX = self.view.bounds.size.width;
        _speedX*=-0.4;
    }
    if (posY<0.0) {
        posY = 0.0;
        _speedY *=0.0;
    }else if(posY>self.view.bounds.size.height)
    {
        posY = self.view.bounds.size.height;
        _speedY*=-1.5;
    }
    _imageView.center = CGPointMake(posX, posY);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
