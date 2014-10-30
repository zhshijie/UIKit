//
//  UserData.m
//  SQLiteDemo
//
//  Created by sky on 14/6/18.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "UserData.h"
#import <sqlite3.h>

@implementation UserData

-(void)creatsqlite
{
    sqlite3 *sqlite = nil;
    
    NSString *sqlitePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/data.sqlite"];
    int result = sqlite3_open([sqlitePath UTF8String], &sqlite);
    if (result!=SQLITE_OK) {
        NSLog(@"数据库打开失败");
        return;
    }
    
    NSString *creatString = @"CREATE TABLE IF NOT EXISTS User (username TEXT primary key,password TEXT,email TEXT)";
    char *error;
    result = sqlite3_exec(sqlite,[creatString UTF8String] , NULL, NULL, &error);
    
    if (result!=SQLITE_OK) {
        NSLog(@"表创建失败");
        return;
    }
    sqlite3_close(sqlite);
    NSLog(@"数据库创建成功");
}

-(void)insertsqlite
{
    
    sqlite3 *sqlite = nil;
    sqlite3_stmt *stmt = nil;
    
    NSString *sqlitePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/data.sqlite"];
    int result = sqlite3_open([sqlitePath UTF8String], &sqlite);
    if (result!=SQLITE_OK) {
        NSLog(@"数据库打开失败");
        return;
    }
    
    //编辑SQL语句
    NSString *sql = @"INSERT INTO User (username,password,email) VALUES (?,?,?)";
    sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL);
    
    NSString *userName = @"mike";
    NSString *userPassword = @"666666";
    NSString *userEmail = @"mike@qq.com";
    
    sqlite3_bind_text(stmt, 1, [userName UTF8String], -1, NULL);
    sqlite3_bind_text(stmt, 2, [userPassword UTF8String], -1, NULL);
    sqlite3_bind_text(stmt, 3, [userEmail UTF8String], -1, NULL);
    
    result = sqlite3_step(stmt);
    
    if (result==SQLITE_ERROR||result==SQLITE_MISUSE) {
        NSLog(@"插入数据失败");
        return;
    }
    
    //关闭SQL编辑句柄
    sqlite3_finalize(stmt);
    //关闭数据库
    sqlite3_close(sqlite);
    
    NSLog(@"插入数据成功");
}

-(void)selectsqlite
{
    sqlite3 *sqlite = nil;
    sqlite3_stmt *stmt = nil;
    
    NSString *sqlitePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/data.sqlite"];
    sqlite3_open([sqlitePath UTF8String], &sqlite);
    
    
    NSString *sql = @"SELECT username,password,email FROM User WHERE username = ?";
    
//     NSString *sql = @"SELECT username,password,email FROM User";
    //提取全部的User中数据
    
    sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL);
    
    //输入取位符的内容
    NSString *selectName = @"long";
    sqlite3_bind_text(stmt, 1, [selectName UTF8String], -1, NULL);
    int result = sqlite3_step(stmt);
    
    //遍历符合条件的数据
    while (result==SQLITE_ROW) {
        char *username = (char *)sqlite3_column_text(stmt, 0);
        char *password =(char *) sqlite3_column_text(stmt, 1);
        char *email = (char *)sqlite3_column_text(stmt, 2);
        
        NSString*usernameString = [NSString stringWithCString:username encoding:NSUTF8StringEncoding];
        NSString*passwordString = [NSString stringWithCString:password encoding:NSUTF8StringEncoding];
        NSString*emailString = [NSString stringWithCString:email encoding:NSUTF8StringEncoding];
        
        NSLog(@"--------name:%@,password:%@,email:%@----------",usernameString,passwordString,emailString);
        
        result = sqlite3_step(stmt);
    };
    
    
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    
}
@end
