//
//  UNLockView.m
//  手势解锁
//
//  Created by Cnw on 2018/11/29.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "UNLockView.h"

@interface UNLockView ()

/** 记录已选择的按钮 */
@property(nonatomic ,strong)NSMutableArray *btnsArray;

@property(nonatomic , assign)CGPoint currentP;
/** 密码数组 */
@property(nonatomic ,strong)NSMutableArray *psArray;

@property(nonatomic , assign)NSInteger count;

@end

@implementation UNLockView

-(NSMutableArray *)btnsArray
{
    if (!_btnsArray) {
        _btnsArray = [NSMutableArray array];
    }
    return _btnsArray;
}
-(NSMutableArray *)psArray
{
    if (!_psArray) {
        _psArray = [NSMutableArray array];
    }
    return _psArray;
}


//加载完xib创建时候
-(void)awakeFromNib
{
    [super awakeFromNib];
    
    UIPanGestureRecognizer * gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:gesture];
    
    for (int i=0; i<9; i++) {
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button setImage:[UIImage imageNamed:@"手势密码"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"登录密码"] forState:UIControlStateSelected];
        
        [self addSubview:button];
        
    }
    
}

#pragma mark - 手势事件
-(void)pan:(UIPanGestureRecognizer *)gesture
{
    // 获取当前点
    CGPoint point = [gesture locationInView:self];
    self.currentP = point;
    // 判断点是否在按钮上并且按钮没有被选中
    for (UIButton * button in self.subviews) {
        
        if (CGRectContainsPoint(button.frame, point) && button.selected == NO) { // 判断按钮上是否包含这个点
            
            button.selected = YES;
            
            // 把选中的按钮添加到数组
            [self.btnsArray addObject:button];
            
           
        }
        
        
    };
    
    // 选中后重绘
    [self setNeedsDisplay];
    
    // 手指抬起后界面恢复
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        
        
        // 记录密码

        NSMutableArray * otherArray = [NSMutableArray array];
        //把所有按钮取消选中
        for (int i=0; i<self.btnsArray.count; i++) {
            
            UIButton * button = self.btnsArray[i];
            
            if (_count == 0) {
                 [self.psArray addObject:[NSString stringWithFormat:@"%ld",button.tag]];
            }else{
                
                 [otherArray addObject:[NSString stringWithFormat:@"%ld",button.tag]];
            }
           
            // 比较数组元素是否相等
            if (self.psArray == otherArray) {
                
                NSLog(@"密码一样");
                
            }else{
                
                NSLog(@"两次密码不一样");
            }
            
            
            
            
            button.selected = NO;
            
        }
        
        NSLog(@"%@------%@",self.psArray,otherArray
              );
        
        // 数组清空
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.75 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [self.btnsArray removeAllObjects];
            [self setNeedsDisplay];
        });
        

        _count ++;
    }
    
    
    
}


// 只要调用这个方法.表示父控件尺寸已确定
-(void)layoutSubviews
{
    CGFloat buttonW = 75;
    int buttonCount = 3;
    CGFloat margin = (self.frame.size.width - buttonW*buttonCount)/4;
    NSInteger count = self.subviews.count;
    
    for (int i=0; i<count; i++) {
        
        UIButton * button = self.subviews[i];
        button.userInteractionEnabled = NO;
        button.frame = CGRectMake(margin + (buttonW +margin)*(i%buttonCount), 10 + (buttonW +margin)*(i/buttonCount), buttonW, buttonW);
        
    }
    
}

#pragma mark - 绘制线
-(void)drawRect:(CGRect)rect
{
    
    if (self.btnsArray.count == 0) return;
    
    //绘制的是一条线
    UIBezierPath * path = [UIBezierPath bezierPath];
    
    for (int i=0; i<self.btnsArray.count; i++) {
        
        UIButton * button = self.btnsArray[i];
        
        if (i == 0) {
            
            [path moveToPoint:button.center];
            
        }else{
            
            [path addLineToPoint:button.center];
            
        }
        
        
    }
    
    //最后一个按钮选中后,在添加手势画线
    // 拿到当前手势
    
    [path addLineToPoint:self.currentP];
    
    // 设置线拐角连接出为圆角
    path.lineJoinStyle = kCGLineJoinRound;
    // 线两头的显示样式
    path.lineCapStyle =  kCGLineCapRound;
    path.lineWidth = 10;
    [[UIColor whiteColor] set];
    
    [path stroke];
    

    
    
    
    
    
}



@end
