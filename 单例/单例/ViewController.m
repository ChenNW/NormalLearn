//
//  ViewController.m
//  单例
//
//  Created by Cnw on 2018/9/7.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@---%@-----%@",[Person sharePerson],[Person sharePerson],[Person sharePerson]);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
