//
//  ViewController.m
//  GCD-01
//
//  Created by Cnw on 2018/9/5.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
/** uiimage */
@property(nonatomic ,strong)UIImage *image1,*image2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    NSLog(@"点击了");
    
    [self demo6];

    
}
#pragma mark - 队列组
-(void)demo6{
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0 );
    dispatch_group_async(group, queue, ^{
       
        self.image1 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://f.hiphotos.baidu.com/image/pic/item/d043ad4bd11373f067aca6bca90f4bfbfbed0406.jpg"]]];
        
    });
    
    
    dispatch_group_async(group, queue, ^{
        
        self.image2 = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://e.hiphotos.baidu.com/image/pic/item/728da9773912b31b549fe00b8b18367adab4e125.jpg"]]];
        
    });
    
    dispatch_group_notify(group, queue, ^{
       
        
        // 开启图形上下文
        UIGraphicsBeginImageContext(CGSizeMake(375, 375));
        
        //绘图
        [self.image1 drawInRect:CGRectMake(0, 0, 375/2, 647)];
        [self.image2 drawInRect:CGRectMake(375/2, 0, 375/2, 647)];
        
        
        // 拿到新的图形
        UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
        
        // 结束绘制
        
        UIGraphicsEndImageContext();
        
        // 回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
           
            self.imageView.image  = newImage;
            
        });
        
        NSLog(@"%@----%@",self.image1,self.image2);
        
        
        
        
    });
    
    
    
    
}

#pragma mark- 快速迭代
-(void)demo5
{
    
    NSArray * array = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    
    //普通的for循环(有顺序的执行)
    
//    NSDate * begin = [NSDate date];
    
    CFTimeInterval begin = CFAbsoluteTimeGetCurrent();
    
    
//    for (int i=0; i<10000; i++) {
//        NSLog(@"%d",i);
//    }
    
    
    // 使用GCD进行迭代遍历
    dispatch_apply(7, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
       
        NSLog(@"%zu-----%@",index,[NSThread currentThread]);
        
    });
    
    
    
    
//    NSDate * end = [NSDate date];
//    NSLog(@"%f",[end timeIntervalSinceDate:begin]);
    
     CFTimeInterval end = CFAbsoluteTimeGetCurrent();

    
    NSLog(@"%f",end-begin);
    
    
}

#pragma mark- 延时操作
-(void)demo4
{
    // 第一种方法
//    [self performSelector:@selector(runWithString:) withObject:@"开始" afterDelay:2.0];
    //第二种
//    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(runWithString:) userInfo:@"哈哈哈" repeats:NO];
    //第三种(GCD)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self runWithString:@"哈哈"];
        
    });


}

#pragma mark - 栅栏函数
-(void)demo3
{
    // 不能使用全局队列
    dispatch_queue_t queue = dispatch_queue_create("cnw.queue", DISPATCH_QUEUE_CONCURRENT);
    
    
    dispatch_async(queue, ^{
        NSLog(@"-------1--------%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"-------2--------%@",[NSThread currentThread]);
    });
    
    
    dispatch_barrier_async(queue, ^{
        
        NSLog(@"5=======%@=========",[NSThread currentThread]);
        
    });
    
    
    dispatch_async(queue, ^{
        NSLog(@"-------3--------%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"-------4--------%@",[NSThread currentThread]);
    });
    
}

#pragma mark -线程间通信
-(void)demo2
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL * url = [NSURL URLWithString:@"http://f.hiphotos.baidu.com/image/pic/item/d043ad4bd11373f067aca6bca90f4bfbfbed0406.jpg"];
        
        NSData * data = [NSData dataWithContentsOfURL:url];
        
        UIImage * image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageView.image = image;
        });
        
        
    });
}

#pragma mark - 并发队列
-(void)demo1
{
    
    // 并发队列
    dispatch_queue_t queue = dispatch_queue_create("cnw.queue", DISPATCH_QUEUE_CONCURRENT);
    
    // 异步
    dispatch_async(queue, ^{
        
        NSLog(@"%@====1",[NSThread currentThread]);
        
    });
    dispatch_async(queue, ^{
        
        NSLog(@"%@====2",[NSThread currentThread]);
        
    });
    dispatch_async(queue, ^{
        
        NSLog(@"%@====3",[NSThread currentThread]);
        
    });
    
    dispatch_async(queue, ^{
        
        NSLog(@"%@====4",[NSThread currentThread]);
        
    });
}

-(void)runWithString:(NSString *)params
{
    NSLog(@"进入方法----%@",params);
    
    
}
@end
