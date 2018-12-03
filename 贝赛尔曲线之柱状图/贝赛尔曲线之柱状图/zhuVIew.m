//
//  bgVIew.m
//  贝赛尔曲线之柱状图
//
//  Created by Cnw on 2018/11/23.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "zhuVIew.h"

@implementation zhuVIew

-(void)drawRect:(CGRect)rect
{
    NSArray * array = @[@32,@23,@45];
    
    CGFloat x =0;
    CGFloat y =0;
    CGFloat w =0;
    CGFloat h =0;
    
    for (int i=0; i<array.count; i++) {
        
        w = rect.size.width/(2*array.count -1);
        x = 2 * w*i;
        h = [array[i] floatValue]/100.0 * rect.size.height;
        y = rect.size.height - h;
        
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w, h)];
        
        [[self randomColor] set];
        
        [path fill];
        
    }
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}

#pragma mark - 随机色
-(UIColor *)randomColor
{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}
@end
