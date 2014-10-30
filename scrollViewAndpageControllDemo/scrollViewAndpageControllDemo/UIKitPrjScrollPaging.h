//
//  UIKitPrjScrollPaging.h
//  scrollViewAndpageControllDemo
//
//  Created by sky on 14-6-9.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIKitPrjScrollPaging : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *page;
    //定义滚动标志
    BOOL pageControlIsChangingPage;
    //定义图片数组
    NSArray *images;
}
//UIPageControll的响应方法
-(void)changePage:(id)sender;

//内部方法，导入图片并进行UIScrollView的相关设置
-(void)setupPage;

@end
