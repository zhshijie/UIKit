//
//  EditTableViewController.m
//  EditTableView
//
//  Created by sky on 14/7/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "EditTableViewController.h"

@interface EditTableViewController ()

@end

@implementation EditTableViewController


-(void)loadView
{
    [super loadView];
    _dataSoure = [[NSMutableArray alloc]initWithObjects:@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"21",@"22",@"23",@"24",@"25",@"追加新的单元格", nil];
    NSLog(@"%d",_dataSoure.count);

}
- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setEditing:YES animated:YES];
    self.navigationItem.rightBarButtonItem = [self editButtonItem];
    self.tableView.rowHeight = 120;
    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.backgroundColor = [UIColor blackColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _dataSoure.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *Identifier =@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:Identifier];
    }
    NSLog(@"%@",_dataSoure[indexPath.row]);
    cell.textLabel.text = _dataSoure[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.textLabel.font = [UIFont systemFontOfSize:50];
    cell.imageView.image = [UIImage imageNamed:@"1.jpg"];
    cell.detailTextLabel.text = @"detail";
    cell.detailTextLabel.textColor  = [UIColor greenColor];
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.editingAccessoryType  = UITableViewCellAccessoryDetailDisclosureButton;
    return cell;
}





-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *view = [[UIViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(void)tableView:(UITableView *)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSLog(@"%@",indexPath);
        [_dataSoure removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [_dataSoure insertObject:@"New Item" atIndex:_dataSoure.count-1];
        
        [tableView insertRowsAtIndexPaths: @[indexPath]withRowAnimation:UITableViewRowAnimationFade];
    }   
}


-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing&&_dataSoure.count<=indexPath.row+1) {
        return UITableViewCellEditingStyleInsert;
    }
    else
        return UITableViewCellEditingStyleDelete;
}


- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSUInteger fromRow = fromIndexPath.row;
    NSUInteger toRow = toIndexPath.row;
    
    while (toRow >fromRow) {
        [_dataSoure exchangeObjectAtIndex:fromRow withObjectAtIndex:toRow];
        fromRow++;
    }
    while (fromRow>toRow) {
        [_dataSoure exchangeObjectAtIndex:fromRow withObjectAtIndex:toRow];
        fromRow--;
    }
}



- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return _dataSoure.count>indexPath.row+1;
}

-(NSIndexPath*)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (_dataSoure.count>proposedDestinationIndexPath.row+1) {
        return proposedDestinationIndexPath;
    }
    else{
        return sourceIndexPath;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
