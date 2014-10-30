//
//  blockButton.h
//  blockButton
//
//  Created by sky on 14/6/12.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@class blockButton;

typedef void(^BlockButton) (blockButton*);

@interface blockButton : UIButton

@property(nonatomic,copy) BlockButton block;
@end
