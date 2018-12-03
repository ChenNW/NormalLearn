//
//  ViewController.m
//  block作为返回值
//
//  Created by Cnw on 2018/10/17.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "plusDemo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    plusDemo * demo = [[plusDemo alloc] init];
    
    demo.add(5).add(5);
    
    NSLog(@"%ld",demo.result);
    
    
    
}


@end
