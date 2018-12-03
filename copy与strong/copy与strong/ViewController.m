//
//  ViewController.m
//  copy与strong
//
//  Created by Cnw on 2018/11/1.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** <#name#> */
@property(nonatomic ,strong)NSString *strongStr;
@property(nonatomic ,copy)NSString *CopyStr;
/** <#name#> */
@property(nonatomic ,copy)NSArray *dataArray1;
@property(nonatomic ,strong)NSArray *dataArray2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
}

#pragma mark - 不可变字符串
-(void)test
{
    
    NSString * str = @"aaa";
    
    
    self.strongStr = str;
    self.CopyStr = str;
    
    str = @"bbb";
    
    NSLog(@"%@,内存地址= %p,指针地址= %p", str ,str ,&str);
    NSLog(@"%@,内存地址= %p,指针地址= %p", self.strongStr ,self.strongStr ,&_strongStr);
    NSLog(@"%@,内存地址= %p,指针地址= %p", self.CopyStr ,self.CopyStr,&_CopyStr);

    /**
     
     对于源对象为不可变字符串而言,不管是copy,strong,所对应的值不变,内存地址不变,没有开辟新的内存空间,并不是深拷贝.此时copy或strong,对数据并没有影响
     
     */
}
#pragma mark - 可变字符串
-(void)test1
{
    NSMutableString * attr = [[NSMutableString alloc] initWithString:@"cnw"];
    self.strongStr = attr;
    self.CopyStr = attr;
    
    
    // 对可变字符串操作
    [attr appendString:@"qlt"];
    
    NSLog(@"%@,内存地址= %p,指针地址= %p", attr ,attr ,&attr);
    NSLog(@"%@,strong 内存地址= %p,指针地址= %p", self.strongStr ,self.strongStr ,&_strongStr);
    NSLog(@"%@,copy   内存地址= %p,指针地址= %p", self.CopyStr ,self.CopyStr,&_CopyStr);
    /**
     
     源数据为可变字符串时,使用copy,会开辟一块新的内存空间存放值,源数据不管怎样变,都不会影响copy属性的值,属于深拷贝,使用strong,不会开辟新的内存空间,只会引用到源数据的内存地址,所以源数据改变,它申明的属性值就改变,属于浅拷贝
     
     
     */
    
}
#pragma mark - 使用copy与strong修饰的s可变数组
-(void)test2{
    
    
//    self.dataArray = [NSMutableArray arrayWithCapacity:3];
//
//    NSLog(@"%@,",[self.dataArray class]);
    
    NSMutableArray * array1 = [NSMutableArray array];
    [array1 addObject:@(1)];
    
    self.dataArray1 = array1;
    self.dataArray2 = array1;
    
//    [self.dataArray2 removeAllObjects];
//    [self.dataArray1 removeAllObjects];
    
    NSLog(@"copy = %@\n----strong = %@" ,[self.dataArray1 class],[self.dataArray2 class]);
    /**
     
     self.dataArray1,self.dataArray2
     self.dataArray1 实际为不变数组,实现了copy操作
     self.dataArray2 为可变数组
     */
    
}
@end
