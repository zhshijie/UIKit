//
//  sizeOfFontViewController.m
//  UILabel
//
//  Created by sky on 14/7/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "sizeOfFontViewController.h"
#import "SizeOfFont.h"

@interface sizeOfFontViewController ()

@end

@implementation sizeOfFontViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    self.navigationController.edgesForExtendedLayout = UIRectEdgeNone;
    SizeOfFont *size = [[SizeOfFont alloc]init];
    size.frame = self.view.bounds;
    size.backgroundColor = [UIColor whiteColor];
    size.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:size];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
