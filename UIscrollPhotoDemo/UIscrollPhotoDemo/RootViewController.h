//
//  RootViewController.h
//  UIscrollPhotoDemo
//
//  Created by sky on 14/6/10.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UIScrollViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIScrollView *_scrollView;
    int kPage;
    NSMutableArray *imageArray;
    
}
@end
