//
//  myTableViewController.m
//  UIScrollTable
//
//  Created by sky on 14/6/10.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "myTableViewController.h"

@interface myTableViewController ()

@end

@implementation myTableViewController

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
    
    UIScrollView *scrollView = [[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 250)]autorelease ];
    scrollView.contentSize = CGSizeMake(320*4, 250);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    //UIScrollView的代理
    scrollView.delegate = self;
    
    //添加图片
    int _x = 0;
    for (int index = 0; index < 4; index++) {
        UIImageView *imageView = [[[UIImageView alloc]initWithFrame:CGRectMake(_x, 0, 320, 250)] autorelease];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",index+1]];
        [scrollView addSubview:imageView];
        _x+=320;
    }
    
    self.tableView.tableHeaderView = scrollView;
    
    
    
    //添加UIPageView
    UIPageControl *pageControl = [[[UIPageControl alloc]initWithFrame:CGRectMake(0, 200, 320, 50)] autorelease];
    pageControl.numberOfPages = 4;
    pageControl.currentPage = 0;
    pageControl.tag = 101;
    [self.view addSubview:pageControl];
    
}

#pragma mark - UIScrollView Delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if([scrollView isKindOfClass:[UIScrollView class]])
    {
        UIPageControl *pageControl =(UIPageControl *)[self.view viewWithTag:101];
        pageControl.currentPage = scrollView.contentOffset.x/320;
    }
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
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    
   if(cell == nil)
   {
       cell =[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
   }
    
    cell.textLabel.text = [NSString stringWithFormat:@"row : %d",indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

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
