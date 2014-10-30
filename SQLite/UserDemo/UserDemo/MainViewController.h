//
//  MainViewController.h
//  UserDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,retain)NSArray *data;
@property(nonatomic,retain) UITableView *tableView ;

-(void)loadData;
@end
