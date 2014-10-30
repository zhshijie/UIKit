//
//  MyTableViewController.m
//  MyDemo
//
//  Created by sky on 14/6/11.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MyTableViewController.h"
#import "ColorViewController.h"
#import "MyPushViewController.h"
#import "MyCalViewController.h"

@interface MyTableViewController ()

@end

@implementation MyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
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
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[[UITableViewCell alloc]init]autorelease];
    
    if(indexPath.row==0)
    {
        cell.textLabel.text = @"View的切换";
    }
    else if(indexPath.row == 1)
    {
        cell.textLabel.text = @"栈的实际应用";
    }
    else if(indexPath.row ==2)
    {
        cell.textLabel.text = @"计算器";
    }
    else if(indexPath.row == 3)
    {
        cell.textLabel.text = @"简单相册功能";
    }
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row ==0)
    {
        ColorViewController *colorView = [[[ColorViewController alloc]init]autorelease];
        [self.navigationController pushViewController:colorView animated:YES];
    }
    else if(indexPath.row==1)
    {
        MyPushViewController *push = [[[MyPushViewController alloc]init]autorelease];
        push.page = 1;
        [self.navigationController pushViewController:push animated:YES];
    }
    else if(indexPath.row ==2)
    {
        MyCalViewController *cal = [[[MyCalViewController alloc]init] autorelease];
        self.tabBarController.hidesBottomBarWhenPushed =YES;
        [self.navigationController pushViewController:cal animated:YES];
    }
}

@end
