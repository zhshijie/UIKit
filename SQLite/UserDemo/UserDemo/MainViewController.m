//
//  MainViewController.m
//  UserDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MainViewController.h"
#import "UserModel.h"
#import "UserDB.h"
#import "EditorViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UserDB *userDb = [[UserDB alloc]init];
//    [userDb creatTable];
   self.tableView= [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addUserAction)];
    self.navigationItem.rightBarButtonItem = addItem;

}

-(void)addUserAction
{
    EditorViewController *editor = [[EditorViewController alloc]init];
    [self.navigationController pushViewController:editor animated:YES];
}

-(void)loadData
{
    UserDB *userDb=[[UserDB alloc]init];
    self.data = [userDb findedUser];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    UserModel *user =[[UserModel alloc]init];
    user = [self.data objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    cell.detailTextLabel.text = user.age;
    return cell;
}


@end
