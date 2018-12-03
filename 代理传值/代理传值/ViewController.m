//
//  ViewController.m
//  代理传值
//
//  Created by Cnw on 2018/10/10.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
@interface ViewController ()
//<secondViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我是第一个控制器";

    UIButton * button = [UIButton buttonWithType:UIButtonTypeInfoLight];
    button.center = self.view.center;
    [self.view addSubview:button];
    
    secondViewController * secondVC = [[secondViewController alloc] init];
//    secondVC.delegate = self;
    [button addAction:^(UIButton * _Nonnull button) {
 
        [self.navigationController pushViewController:secondVC animated:YES];
        secondVC.block = ^(NSString * _Nonnull value) {
            self.title = value;
        };
        
    }];
    
}
-(void)popVcWithValue:(NSString *)value
{
    self.title = value;
}




@end
