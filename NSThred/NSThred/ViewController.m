//
//  ViewController.m
//  NSThred
//
//  Created by Cnw on 2018/9/5.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "MyThread.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",[NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self createThread2];
}




-(void)createThread2{
    
    // 创建线程的另一种方式(隐式创建)
    [self performSelectorInBackground:@selector(run:) withObject:@"jack"];
    
    
}


-(void)createThread1{
    
    // 创建线程的另一种方式(自动开启)
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"rose"];
    

}


-(void)createThread
{
    
    
    MyThread * thread = [[MyThread alloc] initWithTarget:self selector:@selector(run:) object:@"哈哈哈"];
    thread.name = @"my_thread";
    [thread start];
    
}
-(void)run:(NSString *)params
{
    
    NSLog(@"%@---",params);
    
    for (int i=0; i<2000; i++) {
        
        NSLog(@"%@ -------%@----",[NSThread currentThread]  ,params);
        
    }
    

    
}

@end
