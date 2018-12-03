//
//  ViewController.m
//  FMDB
//
//  Created by Cnw on 2018/9/28.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"
#import <FMDB.h>
@interface ViewController ()
/** 一个FMDatabase对象就代表一个单独的SQLite数据库 */
@property(nonatomic ,strong)FMDatabase *db;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取数据库文件的路径
    NSString * file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",file);
    // 创建数据库文件的名称
    NSString * fileName = [file stringByAppendingPathComponent:@"person.sqlite"];
    
    // 获得数据库
    FMDatabase * db = [FMDatabase databaseWithPath:fileName];
    NSLog(@"%@",file);
    
    // 打开数据库
    if ([db open]) {
        
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS p_person (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL, age integer NOT NULL);"];
        
        if (result) {
            NSLog(@"创表成功");
        }else{
            NSLog(@"打开失败");
        }
        
    }
    self.db = db;
}
#pragma mark - 插入数据
- (IBAction)insertData:(id)sender {

    for (int i= 1; i<11; i++) {
        
    NSString * name = [NSString stringWithFormat:@"jim-%u",arc4random_uniform(100)];
        
        // executeUpdate : 不确定的参数用?来占位
        BOOL result =  [self.db executeUpdate:@" INSERT INTO p_person (name, age) VALUES (?, ?);", name, @(arc4random_uniform(40))];
        
        if (result) {
            NSLog(@"插入成功");
        }else{
            NSLog(@"插入失败");
        }
    }
    

    
    
}
#pragma mark - 删除数据
- (IBAction)detateData:(id)sender {

    
    [self.db executeUpdate:@"DROP TABLE IF EXISTS p_person;"];
    [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS p_person (id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL, age integer NOT NULL);"];
    
}

#pragma mark - 查询数据
- (IBAction)queryData:(id)sender {

    //执行查询语句
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM p_person"];
    
    // 遍历
    while([resultSet next]) {
        
        int ID = [resultSet intForColumn:@"id"];
        NSString * name = [resultSet stringForColumn:@"name"];
        NSInteger age = [resultSet intForColumn:@"age"];
        NSLog(@"ID=%d------名字叫%@------年龄=%ld",ID,name,age);
        
    }
  
 }

@end
