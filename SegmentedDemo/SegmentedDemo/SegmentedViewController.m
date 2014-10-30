//
//  SegmentedViewController.m
//  SegmentedDemo
//
//  Created by sky on 14-6-5.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()

@end

@implementation SegmentedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
    
    self.view.backgroundColor = [UIColor blackColor];
    
    //创建两选项的字符串数组
    _items = [[NSArray arrayWithObjects:@"Black",@"White",@"Red",nil] retain];
    
    _image = [[NSArray arrayWithObjects:[UIImage imageNamed:@"1"],[UIImage imageNamed:@"2"],[UIImage imageNamed:@"3"] ,nil] retain];
    
    //以NSArray为初始化选择控件
    UISegmentedControl *segment = [[[UISegmentedControl alloc]initWithItems:_items]autorelease];
    
    //左侧第一选项默认被选择
    segment.selectedSegmentIndex = 0;
    segment.frame = CGRectMake(0, 0, 130, 30);
    
    //注册选项被选择时调用
    [segment addTarget:self action:@selector(segmentDidChange:) forControlEvents:UIControlEventValueChanged];
    
    //将选择控件对象追加到导航栏
    UIBarButtonItem *barButton = [[[UIBarButtonItem alloc]initWithCustomView:segment] autorelease];
    
    //选择控件的种类 只适合7.0以下
    //segment.segmentedControlStyle ＝ UISegmentedControlStylePlain;
    
    //不显示选择状态
    //segment.momentary = YES;
    
    //选择控件的颜色变更
    segment.tintColor = [UIColor redColor];
    
    //修改选项内容的显示位置
    [segment setContentOffset:CGSizeMake(0, -7) forSegmentAtIndex:0];
    
    //设置选项的非活性,几不可选择
    [segment setEnabled:NO forSegmentAtIndex:0];
    
    //插入选项
    [segment insertSegmentWithImage:[UIImage imageNamed:@"3"] atIndex:3 animated:YES];
    
    //删除选项
    [segment removeSegmentAtIndex:3 animated:YES];

    
    self.navigationItem.rightBarButtonItem = barButton;
    
    // Do any additional setup after loading the view.
}

-(void)segmentDidChange:(id)sender{
    
    if([sender isKindOfClass:[UISegmentedControl class]])
    {
        UISegmentedControl *segment = sender;
        
        for (int i=0; i<3; i++)
        {
        if(segment.selectedSegmentIndex == i){
            
            //第一个选项被选择后将画面背景设置为黑色
            //self.view.backgroundColor = [UIColor blackColor];
            [segment setImage:[_image objectAtIndex:i]forSegmentAtIndex:i];
        }
        else {
            // 第二个选项被选择后将画面背景设置为白色
            //self.view.backgroundColor = [UIColor whiteColor];
            [segment setTitle:[_items objectAtIndex:i] forSegmentAtIndex:i];
             }
        }
    }
}

- (void)dealloc
{
    [_items release],_items = nil;
    [_image release],_image = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
