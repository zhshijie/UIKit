//
//  SQLDB.m
//  PackageSQLDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import "SQLDB.h"

#define kfileName @"data.sqlite"

@implementation SQLDB


//数据库文件路径
-(NSString *)filePath
{
    NSString *filePath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",kfileName];
    return filePath;
}


/*
 * 接口描述：创建数据表格
 * 参数：sql：创建表格的SQL语句
 */
-(void)creatTable:(NSString *)sql
{
    sqlite3 *sqlite = nil;
    
    //打开数据库
    if (sqlite3_open([self.filePath UTF8String],&sqlite)!=SQLITE_OK) {
        NSLog(@"打开数据库失败");
        sqlite3_close(sqlite);
        return;
    }
    
    //创建表格
    char *error;
    if(sqlite3_exec(sqlite, [sql UTF8String], nil, nil, &error)!=SQLITE_OK)
    {
        NSLog(@"创建表格失败:%s",error);
        sqlite3_close(sqlite);
        return;
    }
    
    //关闭数据库
    sqlite3_close(sqlite);
}

/*
 * 接口描述：插入数据，删除数据，修改数据
 * 参数：sql：SQL语句
 *      params：占为符的具体内容
 * 返回：执行成功返回YES
 */
-(BOOL)dealData:(NSString*)sql paramsarray:(NSArray *)params
{
    sqlite3 *sqlite = nil;
    sqlite3_stmt *stmt = nil;
    
    //打开数据库
    if (sqlite3_open([self.filePath UTF8String],&sqlite)!=SQLITE_OK) {
        NSLog(@"打开数据库失败");
        sqlite3_close(sqlite);
        return NO;
    }
    
    //编译SQL语句
    if(sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL)==SQLITE_ERROR)
    {
        NSLog(@"编译SQL语句失败");
        sqlite3_close(sqlite);
        return NO;
    }
    
    //绑定数据
    for (int i=0; i<params.count; i++) {
        NSString *value = [params objectAtIndex:i];
        sqlite3_bind_text(stmt, i+1,[value UTF8String] , -1, NULL);
    }
    
    //执行SQL语句
    if(sqlite3_step(stmt)==SQLITE_ERROR)
    {
        NSLog(@"执行SQL语句失败");
        sqlite3_finalize(stmt);
        sqlite3_close(sqlite);
        return NO;

    }
    
    //关闭数据库
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    NSLog(@"插入成功");
    return YES;
}
/*
 * 接口描述：查询数据
 * 参数：sql：SQL语句
 *      numbers:查询的字段数量
 * 返回：[
 *   ["字段1"，“字段2”，“字段3”],
 *   ["字段1"，“字段2”，“字段3”],
 *   ["字段1"，“字段2”，“字段3”],
 *      ]
 */
-(NSMutableArray *)selectData:(NSString *)sql columns:(int)numbers
{
    sqlite3 *sqlite = nil;
    sqlite3_stmt *stmt = nil;
    
    //打开数据库
    if (sqlite3_open([self.filePath UTF8String],&sqlite)!=SQLITE_OK) {
        NSLog(@"打开数据库失败");
        sqlite3_close(sqlite);
        return NULL;
    }
    
    //编译SQL语句
    if(sqlite3_prepare_v2(sqlite, [sql UTF8String], -1, &stmt, NULL)==SQLITE_ERROR)
    {
        NSLog(@"编译SQL语句失败");
        sqlite3_close(sqlite);
        return NULL;
    }
    
    //执行SQL语句
    int result = sqlite3_step(stmt);
    if(result==SQLITE_ERROR)
    {
        NSLog(@"执行SQL语句失败");
        sqlite3_finalize(stmt);
        sqlite3_close(sqlite);
        return NULL;
    }
    
    //查询数据
    NSMutableArray *data = [[NSMutableArray alloc]init];
    while (result==SQLITE_ROW) {
        NSMutableArray *row = [[NSMutableArray alloc]initWithCapacity:numbers];
        for (int i=0; i<numbers; i++) {
           char *columnText = (char*)sqlite3_column_blob(stmt, i);
            NSString *columnString= [NSString stringWithCString:columnText encoding:NSUTF8StringEncoding];
            [row addObject:columnString];
        }
        [data addObject:row];
        result = sqlite3_step(stmt);
    }
    //关闭数据库
    sqlite3_finalize(stmt);
    sqlite3_close(sqlite);
    return data;
}
@end
