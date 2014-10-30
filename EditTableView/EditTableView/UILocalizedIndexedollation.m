//
//  UILocalizedIndexedollation.m
//  EditTableView
//
//  Created by sky on 14/7/17.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "UILocalizedIndexedollation.h"
#import "Character.h"

@interface UILocalizedIndexedollation ()

@end

@implementation UILocalizedIndexedollation

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSMutableArray *dataSourceTemp = [self _getDataSource:22];
    [self randDataSoure:dataSourceTemp];
    
}

//获得测试数据
-(NSMutableArray*)_getDataSource:(NSInteger )capacity
{
    NSMutableArray *dataSourceTemp = [NSMutableArray arrayWithCapacity:capacity];
    for (int i=0; i<20; i++) {
        Character* dummy = [[Character alloc]init];
        dummy.name = (i%2)?@"Dummy":@"测试";
        dummy.job = @"自由职业";
        [dataSourceTemp addObject:dummy];
    }
    
    Character *character1 = [[Character alloc]init];
    character1.name = @"王五";
    character1.job = @"教授";
    [dataSourceTemp addObject:character1];
    Character *character2 = [[Character alloc]init];
    character2.name = @"张三";
    character2.job = @"导游";
    [dataSourceTemp addObject:character2];
    return  dataSourceTemp;
}


//对数据进行排列
/*
 *参数：dataSourceTemp
 *需要进行排列的数据源
 */
-(void)randDataSoure:(NSMutableArray *)dataSourceTemp
{
    UILocalizedIndexedCollation *theCollation = [UILocalizedIndexedCollation currentCollation];
    //创建于Section数目相同的空数组
    NSInteger sectionCount = [[theCollation sectionTitles]count];
    NSMutableArray *sectionArrays =[NSMutableArray arrayWithCapacity:sectionCount];
    NSLog(@"%d",sectionCount);
    for (int i=0; i<sectionCount; i++) {
        [sectionArrays addObject:[NSMutableArray arrayWithCapacity:1]];
    }
    
    
    //将数据放入上面的数组中
    for(Character *chara in dataSourceTemp){
        NSInteger sect = [theCollation sectionForObject:chara collationStringSelector:@selector(name)];
        [[sectionArrays objectAtIndex:sect] addObject:chara];
    }
    
    //将section中的数据追加到表格用数组中
    self.dataSoure = [NSMutableArray arrayWithCapacity:sectionCount];
    for (NSMutableArray *sectionArray in sectionArrays) {
        NSArray *sortedSection = [theCollation sortedArrayFromArray:sectionArray collationStringSelector:@selector(name)];
        [self.dataSoure addObject:sortedSection];
    }
}

-(NSArray*)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [[UILocalizedIndexedCollation currentCollation]sectionTitles];
}

-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ([[self.dataSoure objectAtIndex:section] count]) {
        return [[[UILocalizedIndexedCollation currentCollation]sectionTitles]objectAtIndex:section];;
    }
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    return [[UILocalizedIndexedCollation currentCollation]sectionForSectionIndexTitleAtIndex:index];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self.dataSoure count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[self.dataSoure objectAtIndex:section]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    Character *charater= [[self.dataSoure objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = charater.name;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
