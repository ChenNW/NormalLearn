//
//  ViewController.m
//  加密
//
//  Created by Cnw on 2018/8/21.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()
/** <#name#> */
@property(nonatomic ,strong)UIButton *myButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:btn];
    self.myButton = btn;
    btn.backgroundColor = [UIColor purpleColor];
    [btn setTitle:@"你好" forState:UIControlStateNormal];
//    [btn performSelector:@selector(click) withObject:nil withObject:nil];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)function1{
    
    NSLog(@"哈哈哈哈哈");
}

-(void)function2
{
    
    NSLog(@"嘿嘿");
    
}
-(void)buttonClick
{
    NSLog(@"按钮的点击");
}


//// 按钮点击的时候会调用这个方法进行检测代码中有没有这个方法
//+(BOOL)resolveInstanceMethod:(SEL)sel
//{
//    if (sel == @selector(buttonClick)) {
//
//
//        class_addMethod(self, sel, (IMP)fuck, nil);
//
//        return YES;
//
//    }
//
//
//    return [super resolveInstanceMethod:sel];
//
//}
//
//void fuck (id self ,SEL _cmd, NSString*str){
//
//    NSLog(@"哈哈哈");
//
//
//}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
