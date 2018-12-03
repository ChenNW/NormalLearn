//
//  testView.m
//  hittest
//
//  Created by Cnw on 2018/8/23.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "testView.h"

@interface testView()

{
    UIButton * testButton;
    UIView * bgView;
    
}

@end

@implementation testView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {

        [self seUI];
        
    }
    
    return self;
    
}
-(void)seUI
{
    
    testButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    testButton.backgroundColor = [UIColor redColor];
    [testButton setTitle:@"点击" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(myButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:testButton];
    
    bgView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:bgView];
    bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
}


#pragma mark - 重写view的hitTest方法
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    if (self.hidden == YES || self.alpha < 0.05 || self.userInteractionEnabled == NO) {
        return nil;
    }
    
    // 把当前viewde 坐标转移到按钮身上
    CGPoint newP = [self convertPoint:point toView:testButton];
    // 判断点是不是在按钮范围内
    if ([testButton pointInside:newP withEvent:event]) {
        
        return testButton;
    }
    
    
    return [super hitTest:point withEvent:event];
    
    
}

-(void)myButtonClick
{
    if (self.buttonClick) {
        self.buttonClick();
    }
    
}



@end
