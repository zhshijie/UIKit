//
//  AlertBlock.h
//  AlertBlockDemo
//
//  Created by sky on 14/6/12.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Block) (NSInteger);

@interface AlertBlock : UIAlertView

@property (copy,nonatomic) Block block;

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
        ButtonBlock:(Block)block;
@end
