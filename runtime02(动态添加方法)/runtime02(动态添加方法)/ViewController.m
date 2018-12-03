//
//  ViewController.m
//  runtime02(动态添加方法)
//
//  Created by Cnw on 2018/9/20.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    person * p = [[person alloc] init];
    [p performSelector:@selector(eat:) withObject:@"苹果"];
    
}


@end
