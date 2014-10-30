//
//  ImageTableViewController.m
//  UIImageVIew
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "ImageTableViewController.h"
#import "DrawImageViewController.h"
#import "StretchableImageViewController.h"
#import "AnimationViewController.h"
#import "DealAnimationViewController.h"
#import "TransitionAnimationViewController.h"

@interface ImageTableViewController ()

@end

@implementation ImageTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[[UITableViewCell alloc]init]autorelease];
    if (indexPath.row ==0) {
        cell.textLabel.text = @"绘制图片";
    }
    if (indexPath.row ==1) {
        cell.textLabel.text = @"扩大｜缩小限制";
    }
    if (indexPath.row ==2) {
        cell.textLabel.text = @"动画实现";
    }
    if (indexPath.row==3) {
        cell.textLabel.text = @"动画处理";
    }
    if (indexPath.row ==4) {
        cell.textLabel.text = @"过渡动画";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        DrawImageViewController *dra = [[[DrawImageViewController alloc]init]autorelease];
        [self.navigationController pushViewController:dra animated:YES];
    }
    if (indexPath.row==1) {
        StretchableImageViewController *stre = [[[StretchableImageViewController alloc]init]autorelease];
        [self.navigationController pushViewController:stre animated:YES];
    }
    if (indexPath.row ==2) {
        AnimationViewController *animation = [[[AnimationViewController alloc]init]autorelease];
        [self.navigationController pushViewController:animation animated:YES];
    }
    if(indexPath.row ==3)
    {
        DealAnimationViewController *dealAnimation = [[[DealAnimationViewController alloc]init]autorelease];
        [self.navigationController pushViewController:dealAnimation animated:YES];
    }
    
    if (indexPath.row==4) {
        TransitionAnimationViewController *tran = [[[TransitionAnimationViewController alloc]init]autorelease];
        [self.navigationController pushViewController:tran animated:YES];
    }
}

@end
