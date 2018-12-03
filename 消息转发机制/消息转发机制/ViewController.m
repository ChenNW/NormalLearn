//
//  ViewController.m
//  消息转发机制
//
//  Created by Cnw on 2018/10/25.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "runtimeObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    runtimeObject * obj = [[runtimeObject alloc] init];
    [obj test];
    
}


@end
