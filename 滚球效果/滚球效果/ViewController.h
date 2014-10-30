//
//  ViewController.h
//  滚球效果
//
//  Created by sky on 14/7/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAccelerometerDelegate>
{
    @private
    UIImageView *_imageView;
    UIAccelerationValue _speedX;
    UIAccelerationValue _speedY;
}

@end

