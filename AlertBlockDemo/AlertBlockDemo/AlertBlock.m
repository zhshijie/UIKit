//
//  AlertBlock.m
//  AlertBlockDemo
//
//  Created by sky on 14/6/12.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "AlertBlock.h"

@implementation AlertBlock

- (id)initWithTitle:(NSString *)title
            message:(NSString *)message
  cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles
        ButtonBlock:(Block)block
{
    if (self= [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles, nil]) {
        self.block = block;
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.block(buttonIndex);
}
@end
