//
//  ViewController.m
//  hitTest3带蒙层滚动
//
//  Created by Cnw on 2018/8/27.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"
#define kScreenW UIScreen.mainScreen.bounds.size.width
#define kScreenH UIScreen.mainScreen.bounds.size.height
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}
- (IBAction)buttonAction:(id)sender {
}

#pragma mark - 初始化界面
-(void)setUI{
    

    myView * myViews = [[myView alloc] init];
    [self.view addSubview:myViews];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
