//
//  EditorViewController.h
//  UserDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditorViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *usernameFiled;
@property (strong, nonatomic) IBOutlet UITextField *passwordFiled;
@property (strong, nonatomic) IBOutlet UITextField *ageFiled;
- (IBAction)addUser:(id)sender;

@end
