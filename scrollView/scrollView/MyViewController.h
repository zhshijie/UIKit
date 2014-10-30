//
//  MyViewController.h
//  scrollView
//
//  Created by sky on 14-6-9.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyViewController : UIViewController
{
    @private
    NSInteger number_;
}

@property (nonatomic , assign)NSInteger number;
//传入数值初始化MyViewController
+(MyViewController *)myViewControllerWithNumber:(NSInteger)number;
@end
