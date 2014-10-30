//
//  SQLDB.h
//  PackageSQLDemo
//
//  Created by sky on 14/6/19.
//  Copyright (c) 2014年 sky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLDB : NSObject

//数据库文件路径
-(NSString *)filePath;


/*   
 * 接口描述：创建数据表格
 * 参数：sql：创建表格的SQL语句
 */
-(void)creatTable:(NSString *)sql;


/*
 * 接口描述：插入数据，删除数据，修改数据
 * 参数：sql：SQL语句
 *      params：占为符的具体内容
 * 返回：执行成功返回YES
 */
-(BOOL)dealData:(NSString*)sql paramsarray:(NSArray *)params;


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
-(NSMutableArray *)selectData:(NSString *)sql columns:(int)numbers;
@end
