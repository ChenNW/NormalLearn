//
//  ViewController.m
//  hitTest2
//
//  Created by Cnw on 2018/8/27.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
   
    
    
    UIView * one = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 200)];
    one.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:one];
    one.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick:)];
    [one addGestureRecognizer:tap];

    
    UIView * two = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 200)];
    two.backgroundColor = [UIColor redColor];
    [self.view addSubview:two];
}

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    
    if (sel == @selector(viewClick:)) {
        
        class_addMethod(self, sel, (IMP)method, "v@:");
        
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
    
}

void method (id self,SEL _cmd){
    
    NSLog(@"点击了view");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
