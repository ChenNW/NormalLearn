//
//  ViewController.m
//  runLoop01
//
//  Created by Cnw on 2018/8/28.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(200, 400, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    btn.center = CGPointMake(200, 300);
    [btn addTarget:self action:@selector(run) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     kCFRunLoopEntry = (1UL << 0),//进入 1
     kCFRunLoopBeforeTimers = (1UL << 1), // 时间 2
     kCFRunLoopBeforeSources = (1UL << 2), // source 4
     kCFRunLoopBeforeWaiting = (1UL << 5), // 睡眠前 32
     kCFRunLoopAfterWaiting = (1UL << 6), // 唤醒钱 64
     kCFRunLoopExit = (1UL << 7), // 退出
     kCFRunLoopAllActivities = 0x0FFFFFFFU // 所有
     
     */
    
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopBeforeSources, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        NSLog(@"状态的改变 ====%zd",activity);
        if (activity == 4) {
            
//            btn.backgroundColor = [UIColor purpleColor];
        }
        
    });
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    

}
-(void)setUI
{
    UITextView * textView = [[UITextView alloc] initWithFrame:CGRectMake(80, 100, 200, 150)];
    textView.text = @"一位年老的猎人就能在大森林中看明白什么地方有猎物，而一般人却看不出来一个有远见的年轻人，就可以在百万年薪和出国深造间毫不犹豫作出选择，而普通人总是后悔当初。    我们一般会认为更厉害的人，是拥有东西更多的人，更有钱，更高职务，更有知识。但这却是我们心智模式还很初级的表现 而真正厉害的人，其实是追逐方方面面更确定的人。为了这个目标，他们反而会去繁从简，通常更喜欢过着简朴的生活，也追逐着更简洁的目标。心智模式不同决定着我们的路径的不同，当然也决定着最终的结果的不同";
    textView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:textView];
    
    
  
    
}

-(void)timer1
{
    //这种模式需要手动添加到runloop中
    NSTimer * timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    // NSDefaultRunLoopMode默认的模式,
    // UITrackingRunLoopMode滚动时候的mode
    // NSRunLoopCommonModes两种模式都可以实现的效果(并不是同时存在两种模式)
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}
-(void)timer2{
    
    //这种写法,不需要添加到runloop中,也是默认mode.当然也可以手动设置模式
    
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:1.2 target:self selector:@selector(run) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}


-(void)run{
    NSLog(@"run");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
