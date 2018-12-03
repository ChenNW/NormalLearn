//
//  ViewController.m
//  线程安全-互斥锁
//
//  Created by Cnw on 2018/9/5.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 售票员01 */
@property(nonatomic ,strong)NSThread *thread01;
/** 售票员02 */
@property(nonatomic ,strong)NSThread *thread02;
/** 售票员03 */
@property(nonatomic ,strong)NSThread *thread03;
/** 售票员04 */
@property(nonatomic ,strong)NSThread *thread04;

@property(nonatomic , assign)NSInteger ticketCount;


@end



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ticketCount = 200;
    
    
    self.thread01 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickt) object:nil];
    self.thread01.name = @"售票员01";
    
    self.thread02 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickt) object:nil];
    self.thread02.name = @"售票员02";
    
    
    
    self.thread03 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTickt) object:nil];
    self.thread03.name = @"售票员03";
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.thread01 start];
    [self.thread02 start];
    [self.thread03 start];
    
}



-(void)saleTickt
{
       
    while (1) {
        
        // 加互斥锁
        @synchronized(self){
        
        NSInteger count = self.ticketCount;
        
        if (count >0) {
            
            self.ticketCount = count -1;
            NSLog(@"%@卖了一张票,还剩%ld张票",[NSThread currentThread].name,self.ticketCount);
            
        }else{
            
            NSLog(@"票买完了");
            break;
            
        }
            
        }
        
        
        
    }
    
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
