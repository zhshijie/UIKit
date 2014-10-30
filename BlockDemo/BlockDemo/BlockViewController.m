//
//  BlockViewController.m
//  BlockDemo
//
//  Created by sky on 14/6/11.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "BlockViewController.h"

typedef int (^MyBlock)(int);
@interface BlockViewController ()

@end

@implementation BlockViewController

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
    
    //block 声明
    /*
    int (^myBlock)(int);
    
    myBlock = ^(int a){
        NSLog(@"%d",a);
        return 10;
    };
    
    
    myBlock(20);
     */
    
    MyBlock myblock = ^(int a)
    {
        NSLog(@"%d",a);
        return 10;
    };
    
    myblock(20);
    [self text:myblock];
    // Do any additional setup after loading the view.
}

-(void)text:(MyBlock)myblock
{
    myblock(40);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
