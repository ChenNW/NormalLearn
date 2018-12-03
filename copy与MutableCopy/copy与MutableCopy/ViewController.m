//
//  ViewController.m
//  copy与MutableCopy
//
//  Created by Cnw on 2018/11/2.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test2];
}

- (IBAction)processSlideAction:(UISlider *)sender {
}
#pragma mark - 非集合类copy操作源数据为不可变
-(void)test
{
    NSString * str = @"cnw";
    NSString * copyStr = [str copy];
    
    NSString * StrMutableCopy = [str mutableCopy];
    
    NSMutableString * copyMutableStr = [str copy];
    NSMutableString * mutableStrMutableCopy = [str mutableCopy];
    NSLog(@" \n %p \n %p \n %p \n %p \n %p",
          str,
          copyStr,
          StrMutableCopy,
          copyMutableStr,
          mutableStrMutableCopy);
    
    // 源数据为不可变时 ,是否生成新的对象,如果等号右边是mutableCopy,就回开辟新的内存地址,生成新的s对象
    
    /**
     0x104b2b068
     0x104b2b068
     0x60000176e760
     0x104b2b068
     0x60000176eac0
     */
    
}
#pragma mark - 非集合类copy操作源数据为可变的
-(void)test2
{
    NSMutableString * attr = [[NSMutableString alloc] initWithString:@"cnw"];
    
    NSString * copyStr = [attr copy];
    
    NSString * StrMutableCopy = [attr mutableCopy];
    
    NSMutableString * copyMutableStr = [attr copy];
    NSMutableString * mutableStrMutableCopy = [attr mutableCopy];
    NSLog(@" \n %p \n %p \n %p \n %p \n %p",
          attr,
          copyStr,
          StrMutableCopy,
          copyMutableStr,
          mutableStrMutableCopy);
   //无论原对象是否含有NSMutable，copy返回的对象都是不可变的
    /**
     0x600001198000
     0x850031e9420fbbbe
     0x600001198090
     0x850031e9420fbbbe
     0x6000011980c0
     */
    
}


@end

