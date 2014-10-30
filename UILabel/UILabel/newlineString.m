//
//  newlineString.m
//  UILabel
//
//  Created by sky on 14/7/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "newlineString.h"

@implementation newlineString

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    //设置字体的大小
    UIFont *systemFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:systemFont forKey:@"fonts"];
    
    //字符串自动换行
//    [self.message drawInRect:CGRectMake(100, 200, 100, 100) withAttributes:dic];
    
    //最后一行不能完全显示的情况下，在最后一行的开头进行截断处理
    [self.message drawInRect:CGRectMake(100, 200, 100,50) withFont:systemFont lineBreakMode:NSLineBreakByTruncatingHead];
    /*
    NSLineBreakByWordWrapping = 0,单词中间不能中断
    NSLineBreakByCharWrapping,    单词中间可以中断
    NSLineBreakByClipping,        最后一行不能完全显示是，进行截断到能显示最后一行的字符
    NSLineBreakByTruncatingHead,最后一行不能完全显示的情况下，在最后一行的开头进行截断处理
    NSLineBreakByTruncatingTail,最后一行不能完全显示的情况下，在最后一行的末尾进行截断处理
    NSLineBreakByTruncatingMiddle最后一行不能完全显示的情况下，在最后一行的中间进行截断处理
     */
    
    
}

@end
