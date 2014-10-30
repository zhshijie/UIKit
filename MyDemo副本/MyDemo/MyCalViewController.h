//
//  MyCalViewController.h
//  MyDemo
//
//  Created by sky on 14/6/11.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCalViewController : UIViewController
{
    UILabel *_screen;
    double result;//储存等式的最后的结果
    double current;//显示屏当前的数值
    NSMutableArray *_calAction;//保存等式的符号
    NSMutableArray *_number;//保存等式的数字
}

//输入数字0——9和小数点
-(void)pressNumber:(UIButton *)sender;
//按一次是删除显示屏当前的数字，按2次等式归零。double判断点击次数
-(void)deleNum:(UIButton*)sender;
//加减乘除运算
-(void)calAction:(UIButton *)sender;
//结果，如果时按等号按钮，则显示整条等式
-(void)isequalAction:(UIButton *)sender;
//输入数值的正负
-(void)uisingedAction:(UIButton *)sender;
//取当前数字的百分数
-(void)presentAction:(UIButton*)sender;
//向右轻扫，删除掉最后一个数字
-(void)backNum:(UISwipeGestureRecognizer*)swipeGeser;
//显示或隐藏导航栏
-(void)hidNavigation;
@end
