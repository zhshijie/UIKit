//
//  UserDB.m
//  UserDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "UserDB.h"
#import "UserModel.h"

@implementation UserDB

-(void)creatTable
{
    NSString*sql = @"CREATE TABLE IF NOT EXISTS User (username TEXT primary key,password TEXT,age TEXT)";
    [self creatTable:sql];
}


-(NSArray *)findedUser
{
    NSString *sql = @"SELECT username,password,age FROM User";
   NSMutableArray *data = [self selectData:sql columns:3];
    
    NSMutableArray *users = [[NSMutableArray alloc]init];
    for (NSArray *row in data) {
        NSString *username = [row objectAtIndex:0];
        NSString *password = [row objectAtIndex:1];
        NSString *age = [row objectAtIndex:2];
        
        UserModel *user = [[UserModel alloc]init];
        user.username = username;
        user.password = password;
        user.age = age;
        [users addObject:user];
    }
    return users;
}

-(BOOL)addUser:(UserModel *)user
{
    NSString *sql = @"INSERT OR REPLACE INTO User (username,password,age) VALUES (?,?,?)";
    NSArray *params = @[user.username,user.password,user.age];
   return  [self dealData:sql paramsarray:params];
}
@end
