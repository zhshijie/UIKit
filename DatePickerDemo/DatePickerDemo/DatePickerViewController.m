//
//  DatePickerViewController.m
//  DatePickerDemo
//
//  Created by sky on 14-6-6.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController

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
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    //检测值变化
    [datePicker addTarget:self action:@selector(pickerDidChange:) forControlEvents:UIControlStateNormal];
    
    //获取date属性
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy/MM/dd HH:mm"];
    NSString *dateString = [formatter stringFromDate:datePicker.date];
    
    UIAlertView *alert = [[UIAlertView alloc]init];
    alert.message  = dateString;
    [alert addButtonWithTitle:@"OK"];
    [alert show];
    
    
    //设置间隔及最小／最大值
    datePicker.minuteInterval = 30;
    datePicker.minimumDate = [NSDate date];
    datePicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:60*60*24*31];
    
    //日期选择框的种类
    //显示剩余时间
    datePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    //指定时刻
    //datePicker.datePickerMode = UIDatePickerModeTime;
    //指定年 月 日
    //datePicker.datePickerMode = UIDatePickerModeDate;
    //指定时刻与日期
    //datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    
    
    
    [self.view addSubview:datePicker];
    
    // Do any additional setup after loading the view.
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
