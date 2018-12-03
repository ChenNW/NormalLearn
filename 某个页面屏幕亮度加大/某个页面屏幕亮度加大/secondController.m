
//
//  secondController.m
//  某个页面屏幕亮度加大
//
//  Created by Cnw on 2018/11/26.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "secondController.h"

@interface secondController ()
{
    CGFloat light;
}
@end

@implementation secondController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第二页";
    // 获取手机屏幕的亮度(0~1)
    light = [[UIScreen mainScreen] brightness];
    NSLog(@"手机亮度为==%f",light);
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 设置屏幕亮度
    [[UIScreen mainScreen] setBrightness:1];
    
}
-(void)viewDidDisappear:(BOOL)animated
{

    [super viewDidDisappear:animated];
    [[UIScreen mainScreen] setBrightness:light];
    
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
