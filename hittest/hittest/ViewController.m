//
//  ViewController.m
//  hittest
//
//  Created by Cnw on 2018/8/23.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "testView.h"
#import "secondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
 
   
    
    // 从导航栏下边开始计算y值
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
    
   //view就不会延伸到导航栏和状态栏里
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    
    if (@available (iOS 11,*)) {
        UIScrollView.appearance.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    testView * view = [[testView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:view];
    
    __weak typeof(view) weakView = view;
    __weak typeof(self) weakSelf = self;
    view.buttonClick = ^{
      
        NSLog(@"按钮穿透点击");
//        [weakView removeFromSuperview];
        
        [weakSelf.navigationController pushViewController:[secondViewController new] animated:YES];
    };
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
