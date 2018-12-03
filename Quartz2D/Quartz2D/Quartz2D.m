//
//  Quartz2D.m
//  Quartz2D
//
//  Created by Cnw on 2018/11/6.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "Quartz2D.h"

@implementation Quartz2D


/**
 rect 是当前控件的bounds
 */
- (void)drawRect:(CGRect)rect {

    
    [self addLine4];
}
#pragma mark - 画扇形
-(void)addLine4
{
    /**
     画圆弧
     CGPoint 中心点
     radius 半径
     startAngle 开始弧度
     endAngle 结束弧度
     clockwise YES 顺时针 NO逆时针
     
     
     */
    
    CGPoint center = CGPointMake(100, 100);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:80 startAngle:0 endAngle:M_PI_2 clockwise:YES];
    //画扇形
    [path addLineToPoint:center];
    
    // 封闭图形
    //    [path closePath];
    
    
    // 渲染
    //    [path stroke];
    
    // 填充的话默认就封闭图形
    [path fill];
    

}
#pragma mark - 圆角长方形,椭圆
-(void)circleLine
{
    //圆角长方形
    //    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(20, 20, 150, 150) cornerRadius:75];
    //    [path stroke];
    
    // 椭圆
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 20, 180, 100)];
    [path fill];
    
    
}


#pragma mark - 画曲线
-(void)addCurve
{
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ref, 0, 50);
    /**
     CGFloat cpx // 控制点的X
     CGFloat cpy // 控制点的Y
     */
    CGContextAddQuadCurveToPoint(ref, 50, 5 , 100, 50);
    
    CGContextStrokePath(ref);

}


#pragma mark - 两条线
-(void)addtwoLine
{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(100, 100)];
    path.lineWidth = 10;
    [[UIColor redColor] setStroke];
    [path stroke];
    
    //画i第二条线
    UIBezierPath * path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(50, 80)];
    [path1 addLineToPoint:CGPointMake(100, 130)];
    path1.lineWidth = 8;
    [[UIColor purpleColor] setStroke];
    [path1 stroke];
    
    
    
}



#pragma mark - 折线
-(void)addline3
{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ref, 50, 50);
    CGContextAddLineToPoint(ref, 100, 50);
    CGContextAddLineToPoint(ref, 100, 200);
    CGContextAddLineToPoint(ref, 200, 100);
    //设置颜色
    [[UIColor redColor] setStroke];
    // 设置线宽
    CGContextSetLineWidth(ref, 6);
    // 设置角的连接样式
    CGContextSetLineJoin(ref, kCGLineJoinBevel);
    // 设置顶角样式
    CGContextSetLineCap(ref, kCGLineCapRound);
    // 渲染
    CGContextStrokePath(ref);
}





#pragma mark - UIBezierPath曲线画直线
-(void)addline2{
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(200, 200)];
    [path stroke];
    
}

#pragma mark - 默认底层封装了路径
-(void)addline1
{
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ref, 50, 50);
    CGContextAddLineToPoint(ref, 200, 200);
    CGContextStrokePath(ref);
    
}

#pragma mark - 正常方法
-(void)addline
{
    // 1.获取图形上下文
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 2.描述路径
    // 创建路径
    CGMutablePathRef path = CGPathCreateMutable();
    //在路径上添加起点
    CGPathMoveToPoint(path, NULL, 50, 50);
    // 添加一条线(另一点坐标)
    CGPathAddLineToPoint(path, NULL, 200, 200);
    
    // 3.把路径添加到图形上下文
    CGContextAddPath(ref, path);
    // 4.渲染上下文
    CGContextStrokePath(ref);
    
}
@end
