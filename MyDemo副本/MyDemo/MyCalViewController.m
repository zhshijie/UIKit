//
//  MyCalViewController.m
//  MyDemo
//
//  Created by sky on 14/6/11.
//  Copyright (c) 2014年 sky. All rights reserved.
//


//计算器

#import "MyCalViewController.h"

@interface MyCalViewController ()

@end

@implementation MyCalViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        current = 0;
        result = 0;
        _calAction = [[NSMutableArray alloc]initWithCapacity:10];
        _number = [[NSMutableArray alloc]initWithCapacity:10];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //view背景设置为黑色
    self.view.backgroundColor = [UIColor blackColor];
    
    
    self.navigationController.navigationBarHidden = YES;
    //加载显示屏
    _screen = [[UILabel alloc]initWithFrame:CGRectMake(0, 60, 320, 60)];
    _screen.text =@"0";
    _screen.textAlignment = NSTextAlignmentRight;
    _screen.font = [UIFont fontWithName:nil size:30];
    _screen.textColor = [UIColor whiteColor];
    _screen.adjustsFontSizeToFitWidth = YES;
    _screen.minimumScaleFactor = 20;
    
    //添加向右清扫删除
    UISwipeGestureRecognizer *swipe = [[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(backNum:)] autorelease];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    
    [self.view addSubview:_screen];
    
    //轻击显示／隐藏导航条
    UITapGestureRecognizer *tap = [[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidNavigation)] autorelease];
    [self.view addGestureRecognizer:tap];
    
    
    //加载数字按钮
    for(int row = 0; row< 3;row++)
    {
        for (int col = 1; col<=3; col++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            NSString *number = [NSString stringWithFormat:@"%d",row*3+col];
            [button setTitle:number forState:UIControlStateNormal];
            
            button.titleLabel.font = [UIFont fontWithName:nil size:30];
            button.frame = CGRectMake(0+80*(col-1),300-row*60, 80-1, 60-1);
            button.backgroundColor =[UIColor colorWithWhite:0.95 alpha:1.0];
            [button addTarget:self action:@selector(pressNumber:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
    }
    
    //数字0按钮
    UIButton *Zerobutton = [UIButton buttonWithType:UIButtonTypeSystem];
    [Zerobutton setTitle:@"0" forState:UIControlStateNormal];
    Zerobutton.titleLabel.font = [UIFont fontWithName:nil size:30];
    Zerobutton.frame = CGRectMake(0,360, 80+80-1, 60-1);
    Zerobutton.backgroundColor =[UIColor colorWithWhite:0.95 alpha:1.0];
    [Zerobutton addTarget:self action:@selector(pressNumber:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Zerobutton];
    
    //小数点按钮
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"." forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont fontWithName:nil size:30];
    button1.frame = CGRectMake(160,360, 80-1, 60-1);
    button1.backgroundColor =[UIColor colorWithWhite:0.95 alpha:1.0];
    [button1 addTarget:self action:@selector(pressNumber:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    
    //加载运算符“＋－＊／=”
    UIButton *Addbutton = [UIButton buttonWithType:UIButtonTypeSystem];
    [Addbutton setTitle:@"+" forState:UIControlStateNormal];
    Addbutton.titleLabel.font = [UIFont fontWithName:nil size:30];
    Addbutton.frame = CGRectMake(240,300, 80-1, 60-1);
    Addbutton.backgroundColor =[UIColor colorWithWhite:0.95 alpha:1.0];
    Addbutton.backgroundColor = [UIColor orangeColor];
    [Addbutton addTarget:self action:@selector(calAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Addbutton];
    
    
    UIButton *DeleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [DeleButton setTitle:@"-" forState:UIControlStateNormal];
    DeleButton.titleLabel.font = [UIFont fontWithName:nil size:30];
    DeleButton.frame = CGRectMake(240,240, 80-1, 60-1);
    DeleButton.backgroundColor = [UIColor orangeColor];
    [DeleButton addTarget:self action:@selector(calAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:DeleButton];
    
    
    UIButton *multiButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [multiButton setTitle:@"*" forState:UIControlStateNormal];
    multiButton.titleLabel.font = [UIFont fontWithName:nil size:30];
    multiButton.backgroundColor = [UIColor orangeColor];
    multiButton.frame = CGRectMake(240,180, 80-1, 60-1);
    [multiButton addTarget:self action:@selector(calAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:multiButton];
    
    
    UIButton *divisiButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [divisiButton setTitle:@"/"forState:UIControlStateNormal];
    divisiButton.titleLabel.font = [UIFont fontWithName:nil size:30];
    divisiButton.backgroundColor = [UIColor orangeColor];
    divisiButton.frame = CGRectMake(240,120, 80-1, 60-1);
    [divisiButton addTarget:self action:@selector(calAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:divisiButton];
    
    
    UIButton *equalityButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [equalityButton setTitle:@"="forState:UIControlStateNormal];
    equalityButton.titleLabel.font = [UIFont fontWithName:nil size:30];
    equalityButton.backgroundColor = [UIColor orangeColor];
    equalityButton.frame = CGRectMake(240,360, 80-1, 60-1);
    [equalityButton addTarget:self action:@selector(isequalAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:equalityButton];
    
    
    UIButton *escnumButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [escnumButton setTitle:@"AC"forState:UIControlStateNormal];
    escnumButton.titleLabel.font = [UIFont fontWithName:nil size:20];
    escnumButton.backgroundColor = [UIColor orangeColor];
    escnumButton.frame = CGRectMake(0,120, 80-1, 60-1);
    [escnumButton addTarget:self action:@selector(deleNum:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:escnumButton];
    
    
    //取反数按钮
    UIButton *unsigButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [unsigButton setTitle:@"+/-"forState:UIControlStateNormal];
    unsigButton.titleLabel.font = [UIFont fontWithName:nil size:20];
    unsigButton.backgroundColor = [UIColor orangeColor];
    unsigButton.frame = CGRectMake(80,120, 80-1, 60-1);
    [unsigButton addTarget:self action:@selector(uisingedAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:unsigButton];
    
    //取百分数按钮
    UIButton *precentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [precentButton setTitle:@"%"forState:UIControlStateNormal];
    precentButton.titleLabel.font = [UIFont fontWithName:nil size:20];
    precentButton.backgroundColor = [UIColor orangeColor];
    precentButton.frame = CGRectMake(160,120, 80-1, 60-1);
    [precentButton addTarget:self action:@selector(presentAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:precentButton];
    
    
}

int flag=0;//falg判断是否已经输入小数点
int calflog = 0;//判断应该执行那种算式
/*
 calflog =1 ----加法
 calflog =2 ----减法
 calflog =3 ----乘法
 calflog =4 ----除法
 */
int screenflag = 0;


//输入数字0——9和小数点
-(void)pressNumber:(UIButton *)sender
{
    
    NSMutableString *pre =[[[NSMutableString alloc]init] autorelease];
    
    //每次加减后，屏幕显示的是结果，不可修改该，但可以继续使用该结果进行计算。screenflag 判断本次输入是否发生在按下加减乘除键之后；
    if(screenflag == 0){
    [pre appendString:[NSString stringWithFormat:@"%g",current]];
        screenflag=1;
    }
    else if (screenflag==1)
        [pre appendString:_screen.text];
    
    NSString *add = sender.titleLabel.text;//此事显示屏的数字

    //若显示屏为零而且输入的不是小数点，删除掉0，显示第一个数字
    if([pre isEqualToString:@"0"]&&![add isEqualToString:@"."])
    {
        NSRange range = [pre rangeOfString:@"0"];
        [pre deleteCharactersInRange:range];
    }
    
    
    if(flag==0||![add isEqualToString:@"."])
    {
        [pre appendString:add];//将最后一次输入的数字添加到最后显示屏的最后一个
    }
    
    current = [pre doubleValue];
    _screen.text = pre;
    
    //判断之前是否使用了小数点
    if([add isEqualToString:@"."]&&flag==0)
        flag = 1;
}


//按一次是删除显示屏当前的数字，按2次等式归零。double判断点击次数
-(void)deleNum:(UIButton*)sender
{
    static int doule = 1;
    flag = 0;
    if (doule==1) {
        current = 0.0;
        _screen.text = @"0";
        doule++;
        return;
    }
    if(doule==2)
    {
        result=0;
        doule = 1;
        calflog = 0;
        return;
    }

}


//加减乘除运算
-(void)calAction:(UIButton *)sender
{
    flag = 0;
    screenflag = 0;
    if([sender.titleLabel.text isEqualToString:@"+"])
    {
        [self isequalAction:sender];//显示前一个算式的结果
        calflog = 1;
        current = 0;
    }
    else if([sender.titleLabel.text isEqualToString:@"-"])
    {
        [self isequalAction:sender];
        calflog = 2;
        current = 0;
    }
    else if([sender.titleLabel.text isEqualToString:@"*"])
    {
        [self isequalAction:sender];
        calflog = 3;
        current = 0;
    }
    else if([sender.titleLabel.text isEqualToString:@"/"])
    {
        [self isequalAction:sender];
        calflog = 4;
        current = 0;
    }
}


//结果，如果时按等号按钮，则显示整条等式
-(void)isequalAction:(UIButton *)sender
{
    flag = 0;
    screenflag=0;
    [_number addObject:[NSString stringWithFormat:@"%g",current]];//将数字储存
    if(calflog==0)
    {
        result+=current;
        calflog = 0;
    }
    else if (calflog == 1) {
        result+=current;
        calflog = 0;
        [_calAction addObject:@"+"];
    }
    else if(calflog == 2)
    {
        result-=current;
        calflog = 0;
        [_calAction addObject:@"-"];
    }
    else if(calflog == 3)
    {
        result*=current;
        calflog = 0;
        [_calAction addObject:@"*"];
    }
    else if(calflog == 4)
    {
        result/=current;
        calflog = 0;
        [_calAction addObject:@"/"];
    }
      current = 0;
    _screen.text = [NSString stringWithFormat:@"%g",result];
    
    if([sender.titleLabel.text isEqualToString:@"="])
    {
        [_calAction addObject:@"="];
        NSMutableString *new = [[[NSMutableString alloc]init]autorelease];
        for (int index = 0; index<[_number count]; index++) {
            [new appendString:[_number objectAtIndex:index]];
            [new appendString:[_calAction objectAtIndex:index]];
        }
        [new appendString:[NSString stringWithFormat:@"%g",result]];
        _screen.text = new;
        result = 0;
        [_calAction removeAllObjects];
        [_number removeAllObjects];//显示最后等式的结果，并将数组清零。result 也清零。
    }
}


//输入数值的正负
-(void)uisingedAction:(UIButton *)sender
{
    current = -current;
    _screen.text = [NSString stringWithFormat:@"%g",current];
}


//取当前数字的百分数
-(void)presentAction:(UIButton*)sender
{
    current/=100;
    _screen.text = [NSString stringWithFormat:@"%g",current];
}


//向右轻扫，删除掉最后一个数字
-(void)backNum:(UISwipeGestureRecognizer*)swipeGeser
{
    NSString *string = _screen.text;
    NSString *newValue = string;
    if([string length]==0)
        return;
    if(![string isEqualToString:@"0"]){
       newValue = [string substringToIndex:[string length]- 1];
    }
    current = [newValue doubleValue];
    _screen.text = newValue;
}


//显示或隐藏导航栏
-(void)hidNavigation
{
    if (self.navigationController.navigationBarHidden) {
        self.navigationController.navigationBarHidden = NO;
    }
    else{
        self.navigationController.navigationBarHidden = YES;
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)dealloc
{
    [_number release];
    _number = nil;
    [_calAction release];
    _calAction = nil;
    [_screen release];
    _screen = nil;
    [super dealloc];
}
@end
