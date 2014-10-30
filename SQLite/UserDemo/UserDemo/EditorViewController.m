//
//  EditorViewController.m
//  UserDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "EditorViewController.h"
#import "UserModel.h"
#import "UserDB.h"

@interface EditorViewController ()

@end

@implementation EditorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}


- (IBAction)addUser:(id)sender {
    NSString *username = self.usernameFiled.text;
    NSString *password = self.passwordFiled.text;
    NSString *age = self.ageFiled.text;
    
    UserModel *user = [[UserModel alloc]init];
    user.username = username;
    user.password = password;
    user.age = age;
    
    [[UserDB alloc]addUser:user];
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
