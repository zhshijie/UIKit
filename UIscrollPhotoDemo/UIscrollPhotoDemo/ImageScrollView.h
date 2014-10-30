//
//  ImageScrollView.h
//  UIscrollPhotoDemo
//
//  Created by sky on 14/6/10.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScrollView : UIScrollView<UIScrollViewDelegate>
{
    @private
    UIImageView *_imageView;
}

@property (assign,nonatomic) UIImageView *imageView;
@end
