//
//  PickerViewController.h
//  PickerViewDemo
//
//  Created by sky on 14-6-7.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIPickerView *picker_;
    NSArray *dataSource_;
}
@end
