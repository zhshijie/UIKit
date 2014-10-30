//
//  UserDB.h
//  UserDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "SQLDB.h"

@class UserModel;
@interface UserDB : SQLDB

-(void)creatTable;

-(NSArray *)findedUser;

-(BOOL)addUser:(UserModel *)user;

@end
