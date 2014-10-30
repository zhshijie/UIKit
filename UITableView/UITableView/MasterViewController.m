//
//  MasterViewController.m
//  UITableView
//
//  Created by sky on 14/7/16.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()
{
    NSDictionary *_dataSoure;
    NSArray *_keys;
}

@property NSMutableArray *objects;
@end

@implementation MasterViewController
            
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _keys = @[@"哺乳类",@"爬虫类",@"两栖类",@"鱼类"];
    NSArray *object1 = @[@"Monkey",@"Dog",@"Lion",@"Elephant"];
    NSArray *object2 = @[@"Snake",@"Gecko"];
    NSArray *object3 = @[@"Frog",@"Newts"];
    NSArray *object4 = @[@"Shark",@"Salmon"];
    
    NSArray *objects = @[object1,object2,object3,object4];
   _dataSoure= [[NSDictionary alloc] initWithObjects:objects forKeys:_keys];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    id key = [_keys objectAtIndex:section];
    return [[_dataSoure objectForKey:key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    id key = [_keys objectAtIndex:indexPath.section];
    NSArray *object = [_dataSoure objectForKey:key];
    cell.textLabel.text = object[indexPath.row];
    return cell;
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_keys objectAtIndex:section];
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return [_keys objectAtIndex:section];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

-(NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}


@end
