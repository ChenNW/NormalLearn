//
//  ViewController.m
//  runLoop
//
//  Created by Cnw on 2018/9/13.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "mythread.h"
@interface ViewController ()
/** <#name#> */
@property(nonatomic ,strong)mythread *myThread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test1 ];
    self.myThread = [[mythread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [self.myThread start];
    
}
-(void)run
{
    NSLog(@"--------");
     NSLog(@"%@",[NSThread currentThread]);
    NSTimer * timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(test) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
    
}

-(void)test
{
    
    NSLog(@"%@",[NSThread currentThread]);
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(test1) onThread:self.myThread withObject:nil waitUntilDone:NO];

    
}

-(void)test1
{

    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    [self.view performSelector:@selector(setBackgroundColor:) withObject:[UIColor  colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1] afterDelay:0 inModes:@[NSDefaultRunLoopMode]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
