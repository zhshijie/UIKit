//
//  SizeOfFont.m
//  UILabel
//
//  Created by sky on 14/7/15.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "SizeOfFont.h"

@implementation SizeOfFont

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSString *message = @"sizeWithFont:方法中计算绘制字符串的字符大小--sizeWithFont:forWidth:lineBreakMode:的运算结果";
    UIFont *systemFont = [UIFont systemFontOfSize:20];
//    CGFloat actualFontSize;
//    [message drawAtPoint:rect.origin
//                forWidth:rect.size.width
//                withFont:systemFont
//             minFontSize:6
//          actualFontSize:&actualFontSize
//           lineBreakMode:NSLineBreakByWordWrapping
//      baselineAdjustment:UIBaselineAdjustmentAlignBaselines];
//    
//    
    CGSize size;
//    //计算各种情况下字符串的大小
//    
//    //计算指定字体在1行中进行绘制时需要的空间
//    size = [message sizeWithFont:systemFont];
//    NSLog(@"--sizeWithFont:的运算结果");
//    NSLog(@"size = %f,%f",size.width,size.height);
//    
//    //设置横向宽度的限制值的情况下（不支持多行）
//    size = [message sizeWithFont:systemFont forWidth:rect.size.width lineBreakMode:UILineBreakModeMiddleTruncation];
//    NSLog(@"--sizeWithFont:forWidth:lineBreakMode:的运算结果");
//    NSLog(@"size = %f,%f",size.width,size.height);
//    
//    
//
//    
////    //设置横行与纵向宽度方法情况如下：（支持多行）
//    size = [message sizeWithFont:systemFont constrainedToSize:rect.size];
//    
//    NSLog(@"--sizeWithFont:constrainedToSize:的运算结果");
//    NSLog(@"size = %f,%f",size.width,size.height);
//
//    //设置横行与纵向宽度，且指定换行／变换的方法情况如下：
//    
//    size = [message sizeWithFont:systemFont constrainedToSize:rect.size lineBreakMode:NSLineBreakByWordWrapping];
//    NSLog(@"--sizeWithFont:constrainedToSize:lineBreakMode:的运算结果");
//    NSLog(@"size = %f,%f",size.width,size.height);
//
//    //字体自动缩小时设置
//    size = [message sizeWithFont:systemFont
//                     minFontSize:6
//                  actualFontSize:&actualFontSize
//                        forWidth:rect.size.width
//                   lineBreakMode:UILineBreakModeCharacterWrap];
//    NSLog(@"--sizeWithFont:minFontSize:actualFontSize:forWidth:lineBreakMode:的运算结果");
////    NSLog(@"size = %f,%f",size.width,size.height);
//
//    
//    
    //使用ios7.0的方法进行字体宽度自适应
//    
    
    //设置字体
    size = [UIScreen mainScreen].bounds.size;
//    NSDictionary *dic =@{NSFontAttributeName:systemFont, NSStrokeColorAttributeName:[[UIColor greenColor] colorWithAlphaComponent:0.5]};
    
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:message];
    NSRange range = NSMakeRange(0, message.length);
    [attString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:30] range:range];
    NSDictionary *dic = [attString attributesAtIndex:0 effectiveRange:&range];
    NSLog(@"%@",dic);
    
    CGRect rect3 = [message boundingRectWithSize:size
                          options:NSStringDrawingUsesLineFragmentOrigin
                       attributes:dic
                          context:nil];
    
    rect3.origin.y+=100;
    NSLog(@"%@",NSStringFromCGRect(rect3));
//    dic = @{NSFontAttributeName:systemFont};
    [message drawInRect:rect3 withAttributes:dic];
}


@end
