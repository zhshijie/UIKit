//
//  DrawImage.h
//  UIImageVIew

//使用UIView进行图片绘制

//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawImage : UIView
{
    @private
    UIImage *_image;
}
-(id)initWithImage:(UIImage*)image;
@end
