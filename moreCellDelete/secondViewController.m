//
//  secondViewController.m
//  moreCellDelete
//
//  Created by Cnw on 2018/8/20.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"secondVC";
    
    CGFloat r = arc4random() % 256;
    CGFloat g = arc4random() % 256;
    CGFloat b = arc4random() % 256;
    self.view.backgroundColor = [UIColor colorWithRed:r/256 green:g/256 blue:b/256 alpha:1];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
