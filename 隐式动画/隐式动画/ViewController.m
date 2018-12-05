//
//  ViewController.m
//  隐式动画
//
//  Created by Cnw on 2018/12/5.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/**  */
@property(nonatomic ,strong)CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 只有非根层layer才有隐式动画
    CALayer * layer = [CALayer layer];
    self.layer = layer;
    _layer.bounds = CGRectMake(100, 100, 100, 100);
    layer.backgroundColor = [self arcdomColor].CGColor;
    //设置位置
    layer.position = CGPointMake(100, 100);
    
    // 设置锚点
//    layer.anchorPoint = CGPointMake(0, 0);
    [self.view.layer addSublayer:layer];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _layer.backgroundColor = [self arcdomColor].CGColor;
    _layer.cornerRadius = arc4random_uniform(80);
    
    //设置位置
//    _layer.position = CGPointMake(arc4random_uniform(375), arc4random_uniform(500));
    
    // 随机弧度
    CGFloat angle = (arc4random_uniform(360) + 1 )/180.0 * M_PI;
    // 设置旋转
    _layer.transform = CATransform3DMakeRotation(angle, 0,0 , 1);
    
}
-(UIColor *)arcdomColor
{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}


@end
