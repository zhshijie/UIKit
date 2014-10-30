//
//  WebViewTableViewController.m
//  UIWebView
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "WebViewTableViewController.h"
#import "WebViewController.h"
#import "MediaViewController.h"

@interface WebViewTableViewController ()

@end

@implementation WebViewTableViewController

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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if (indexPath.row==0) {
        [self.navigationController setToolbarHidden:NO];

        cell.textLabel.text = @"网页的显示";
    }if (indexPath.row==1) {
        cell.textLabel.text = @"多媒体数据显示";
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row ==0) {
        WebViewController *web=  [[WebViewController alloc]init];
        [self.navigationController pushViewController:web animated:YES];
    }
    if (indexPath.row==1) {
        MediaViewController *media = [[MediaViewController alloc]init];
        [self.navigationController pushViewController:media animated:YES];
    }
}

@end
