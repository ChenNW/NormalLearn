//
//  secondViewController.m
//  代理传值
//
//  Created by Cnw on 2018/10/10.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第二个控制器";
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    button.backgroundColor = [UIColor brownColor];
    button.center = self.view.center;
    [button setTitle:@"点击传值" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addAction:^(UIButton * _Nonnull button) {
       
        [self.navigationController popViewControllerAnimated:YES];
        if (self.block) {
            
            self.block(@"我的标题改变成现在的样子了");
            
        }
//        if ([self.delegate respondsToSelector:@selector(popVcWithValue:)]) {
//
//            [self.delegate popVcWithValue:@"我的标题改变成现在的样子了"];
//
//        }
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
