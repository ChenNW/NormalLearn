//
//  ViewController.m
//  图片裁剪
//
//  Created by Cnw on 2018/11/29.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic , assign)CGPoint startP;
/** view */
@property(nonatomic ,strong)UIView *BGView;
@end

@implementation ViewController

-(UIView *)BGView
{
    
    if (_BGView == nil) {
        
        _BGView = [[UIView alloc] init];
        _BGView.backgroundColor = [UIColor blackColor];
        _BGView.alpha = 0.5;
        [self.view addSubview:_BGView];
        
    }
    
    return _BGView;
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer *)gesture
{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        // 记录起点位置
        self.startP = [gesture locationInView:self.view];
        
        
    }else if (gesture.state == UIGestureRecognizerStateChanged){
        
        CGPoint end = [gesture locationInView:self.view];
        // 移动时候就行画图
        self.BGView.frame = CGRectMake(self.startP.x, self.startP.y, end.x - self.startP.x, end.y - self.startP.y);
        
        
    }else if (gesture.state == UIGestureRecognizerStateEnded){
    
        // 手指停后裁剪
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
        
        // 裁剪区域
        UIBezierPath * path = [UIBezierPath bezierPathWithRect:self.BGView.frame];
        
        [path addClip];
        
        // 把裁剪的区域进行展示
        CGContextRef ref = UIGraphicsGetCurrentContext();
        [self.imageView.layer renderInContext:ref];
        
        // 拿到新图片
        _imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        
        [self.BGView removeFromSuperview];
        self.BGView = nil;
        
        
        
        
    }
    
    
}

@end
