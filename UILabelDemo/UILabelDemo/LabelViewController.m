//
//  LabelViewController.m
//  UILabelDemo
//
//  Created by sky on 14-6-5.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "LabelViewController.h"
#import "drawDemo.h"

@interface LabelViewController ()

@end

@implementation LabelViewController

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
    
    UILabel *label = [[[UILabel alloc]init] autorelease];
    
    //将标签的大小设置成与画面相同的尺寸
    label.frame = self.view.bounds;
    
    //设置画面与标签的自动调整属性
    label.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Hello.";
    
    //标签的背景颜色和文本颜色
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    
    //改变字体
    label.font = [UIFont fontWithName:@"Zapfino" size:48];
    [self.view addSubview:label];
    
    //字体尺寸的自动调整
    label.adjustsFontSizeToFitWidth = NO;
    //label.minimumFontSize = 0;//设置字体最小尺寸
    
    //多行字符串
    label.numberOfLines = 1;//设置为一行，若为0，则没有限制行数，自动换行
    
    //高亮时的文本颜色
    label.highlightedTextColor = [UIColor redColor];
    
    //阴影显示
    /*
    UILabel *label0 = [[[UILabel alloc]initWithFrame:CGRectMake(0, 60, 320, 40)]autorelease];
    UILabel *label1 = [[[UILabel alloc]initWithFrame:CGRectMake(0, 110, 320, 40)]autorelease];
    UILabel *label2 = [[[UILabel alloc]initWithFrame:CGRectMake(0, 160, 320, 40)]autorelease];
    UILabel *label3 = [[[UILabel alloc]initWithFrame:CGRectMake(0, 210, 320, 40)]autorelease];
    
    label0.textAlignment = NSTextAlignmentCenter;
    label1.textAlignment = NSTextAlignmentCenter;
    label2.textAlignment = NSTextAlignmentCenter;
    label3.textAlignment = NSTextAlignmentCenter;
    
   
     label0.backgroundColor = [UIColor whiteColor];
     label1.backgroundColor = [UIColor whiteColor];
     label2.backgroundColor = [UIColor whiteColor];
     label3.backgroundColor = [UIColor whiteColor];
    
    
    label1.shadowColor = [UIColor grayColor];
    label2.shadowColor = [UIColor grayColor];
    label3.shadowColor = [UIColor grayColor];
    label1.shadowOffset = CGSizeMake(1, 1);
    label2.shadowOffset = CGSizeMake(1, 1);
    label3.shadowOffset = CGSizeMake(1, 1);
    
    label0.text = @"无阴影";
    label1.text = @"默认的shadowOffset";
    label2.text = @"shadowOffset = CGSizeMake(1,1)";
    label3.text = @"shadowOffset = CGSizeMake(3,0)";
    [self.view addSubview:label0];
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    
    */
    
    //绘制方法的定制
    
    drawDemo *drawLabel = [[drawDemo alloc]init];
    drawLabel.textColor = [UIColor whiteColor];
    drawLabel.frame = self.view.bounds;
    drawLabel.textAlignment = NSTextAlignmentCenter;
    drawLabel.text = @"普通文本";
    
    [self.view addSubview:drawLabel];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pra
 gma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
