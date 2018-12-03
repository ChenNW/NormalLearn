
//
//  BGView.m
//  贝塞尔之下载进度条
//
//  Created by Cnw on 2018/11/22.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "BGView.h"

@implementation BGView

-(void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    
    [self setNeedsDisplay];
}


-(void)drawRect:(CGRect)rect
{
    //这个方法只会走一次,不能h手动调用此方法,只有系统能l开启图形上下文
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:center radius:rect.size.width/2 -5 startAngle:-M_PI_2 endAngle:-M_PI_2 + self.progressValue *M_PI*2 clockwise:YES];
    
    path.lineWidth = 2;
    
    [[UIColor redColor] setStroke];
    
    [path stroke];
    
    
    
}


@end
