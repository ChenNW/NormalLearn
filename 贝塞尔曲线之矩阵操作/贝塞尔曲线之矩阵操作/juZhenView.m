

//
//  juZhenView.m
//  贝塞尔曲线之矩阵操作
//
//  Created by Cnw on 2018/11/26.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "juZhenView.h"

@implementation juZhenView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    // 获取x上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    
    // 描述路径
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-100, -50, 200, 100)];
    
    
    // 矩阵操作
    
    // 平移
    CGContextTranslateCTM(ref, 100, 50);
    //缩放
    CGContextScaleCTM(ref, 0.5, 0.5);
    
    //旋转
    CGContextRotateCTM(ref, M_PI_2/3); 
    
    
    // 添加路径
    CGContextAddPath(ref, path.CGPath);
    [[UIColor redColor] set];
    
    // 渲染
    CGContextFillPath(ref);
    
    
}

@end
