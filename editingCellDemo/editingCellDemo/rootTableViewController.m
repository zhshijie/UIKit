//
//  rootTableViewController.m
//  editingCellDemo
//
//  Created by sky on 14-6-5.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "rootTableViewController.h"

@interface rootTableViewController ()

@end

@implementation rootTableViewController

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
    
    _font = [[NSMutableArray alloc]initWithArray:[UIFont familyNames]];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [_font count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *cellDentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDentifier];
    if(cell == nil){
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDentifier];
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 320, 44)];
        text.tag = 101;
        [cell.contentView addSubview:text];
        
    }
    
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:101];
    label.text = _font[indexPath.row];
    label.textColor = [UIColor blackColor];
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
 if(indexPath.row)
    return YES;
 else return NO;
}





// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_font removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
      NSString *newFont = @"newFont";
        [_font insertObject:newFont atIndex:indexPath.row+1];
        NSIndexPath *new = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:0];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:new] withRowAnimation:UITableViewRowAnimationBottom];
    }   
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0)
        return UITableViewCellEditingStyleNone;
    else if(indexPath.row ==1)
        return UITableViewCellEditingStyleInsert;
    else return UITableViewCellEditingStyleDelete;
        
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"%@",_font);
    NSLog(@"---------------");
    NSString *text = [_font[fromIndexPath.row]copy];
    [_font removeObject:text];
    [_font insertObject:text atIndex:toIndexPath.row];
     NSLog(@"%@",_font);
}


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
