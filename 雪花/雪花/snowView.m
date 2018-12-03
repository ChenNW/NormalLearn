//
//  snowView.m
//  雪花
//
//  Created by Cnw on 2018/11/23.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "snowView.h"

static CGFloat Y = 0;

@implementation snowView

-(void)drawRect:(CGRect)rect
{
    
    UIImage * image = [UIImage imageNamed:@"雪花"];
    
    [image drawAtPoint:CGPointMake(rect.size.width/2 -22.5, Y)];
    
    Y += 10;
    
    
    if (Y > rect.size.height) {
        
        Y = 0;
        
    }
    
}

#pragma mark - 定时器
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    //这个方法是屏幕每次刷新的时候就会调用(屏幕y一般一秒刷新60次)
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(snowBegin)];
    
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    
}
-(void)snowBegin
{
    
    NSLog(@"123");
    
    // 这个方法并不会马上调用,只是给控件添加刷新的标记,也是在屏幕刷新的时候才会调用
    [self setNeedsDisplay];
    
    
}



@end
