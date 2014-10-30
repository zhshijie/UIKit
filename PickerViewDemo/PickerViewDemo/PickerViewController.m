//
//  PickerViewController.m
//  PickerViewDemo
//
//  Created by sky on 14-6-7.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@end

@implementation PickerViewController

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
    /*
    //UIPickerView的创建与初始化
    UIPickerView *picker = [[UIPickerView alloc]init];
    //将delegate设置成自己
    picker.delegate = self;
    
    //将dataSource设置成自己
    picker.dataSource = self;
    
    [self.view addSubview:picker];
    
    //获取选择行的信息
    NSInteger component0 = [picker selectedRowInComponent:0];//获得第0列的选址信息
    */

    //向选择框中追加UIView
    //创建并初始化
    picker_ = [[UIPickerView alloc]init];
    picker_.delegate = self;
    picker_.showsSelectionIndicator = YES;
    [self.view addSubview:picker_];
    
    
    //导入用的图片
    UIImage *image1 = [UIImage imageNamed:@"1"];
    UIImage *image2 = [UIImage imageNamed:@"2"];
    UIImage *image3 = [UIImage imageNamed:@"3"];
    UIImage *image4 = [UIImage imageNamed:@"4"];
    
    NSArray *components1 = [NSArray arrayWithObjects:image1,image2,image3,image4, nil];
    NSArray *components2 = [NSArray arrayWithObjects:image1,image2,image3,image4, nil];
    NSArray *components3 = [NSArray arrayWithObjects:image1,image2,image3,image4, nil];
    
    dataSource_ = [[[NSArray alloc]initWithObjects:components1,components2,components3, nil]copy];
    
    //追加信息显示按钮，当触摸此按钮是，选中选项图片显示在工具条上
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"信息显示" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y+=50;
    button.center = newPoint;
    
    //注册按钮单击后的显示方法
    [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}
#define mark - deleagate

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return  3;
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}

//以UIView作为选项是必须实现此方法
-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    //如果view已经初始化，则直接显示（再利用）
    UIImageView *imageView = (UIImageView*)view;
    if(!imageView)
    {
        //否则创建并初始化
        UIImage *image = [[dataSource_ objectAtIndex:component] objectAtIndex:row];
        imageView = [[UIImageView alloc]initWithImage:image];
    }
    return imageView;
}

//按钮“信息显示”被触摸时的响应方法

-(void)buttonDidPush
{

    static const int kNumbersOfComponent = 3;
    NSMutableArray *items = [[NSMutableArray alloc]initWithCapacity:3];
    for (int i=0; i<kNumbersOfComponent; ++i) {
        //调用viewForRow:forComponent:方法取得选择行每列中的UIView对象
        UIImageView *imageView = (UIImageView*)[picker_ viewForRow:[picker_ selectedRowInComponent:i] forComponent:i];
        UIImageView *newImageView = [[UIImageView alloc]initWithImage:imageView.image];
        
        //以取得的UIView对象为基础创建UIBarButton对象
        UIBarButtonItem *barButton = [[UIBarButtonItem alloc]initWithCustomView:newImageView];
        [items addObject:barButton];
    }
    
    //将上述的UIBarButtonItem对象数组设置到工具条中
    [self setToolbarItems:items];
}
/*
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d-%d",row,component];
}
*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//控制行与列的尺寸

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    if(0 == component)
        return 30;
    else
        return 60;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if (0==component) {
        return 50;
    }
    else
        return 250;
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
