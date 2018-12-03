//
//  ViewController.m
//  runtime03(动态添加属性)
//
//  Created by Cnw on 2018/9/21.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+property.h"
@interface ViewController ()
//给系统的类添加属性
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSObject * obj = [[NSObject alloc] init];
    obj.name = @"123";
    
    NSLog(@"%@",obj.name);
}


@end
