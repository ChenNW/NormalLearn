
//
//  myView.m
//  贝赛尔曲线之饼状图
//
//  Created by Cnw on 2018/11/22.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "myView.h"

@implementation myView

-(void)drawRect:(CGRect)rect
{
    NSArray * array = [self randomArray];

    CGFloat radius = rect.size.width/2;
    CGPoint center = CGPointMake(radius, radius);
    CGFloat start =0;
    CGFloat end =0;
    CGFloat angle =0;
    
    for (int i=0; i<array.count; i++) {
        
         start = end;
         angle = [array[i] doubleValue]/100.0 * M_PI *2;
         end = start + angle;
        UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:center radius:radius-6 startAngle:start endAngle:end clockwise:YES];
        [path addLineToPoint:center];
        [[self randomColor] set];
        [path fill];
        
        
        
    }
    
}

#pragma mark - 随机数组
-(NSArray *)randomArray
{
    
    NSMutableArray * array = [NSMutableArray array];
    
    int random = 0;
    int totlal = 100;
    for (int i=0; i<arc4random_uniform(10)+1; i++) {
        
        random = arc4random_uniform(totlal);
        
        [array addObject:@(random)];
        
        totlal -= random;
    }
    
    if (totlal) {
        [array addObject:@(totlal)];
    }
    return array;
    
    
}

#pragma mark - 随机色
-(UIColor *)randomColor
{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}
@end
