//
//  ViewController.m
//  图片擦除
//
//  Created by Cnw on 2018/11/29.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
}

-(void)pan:(UIPanGestureRecognizer *)gesture
{
    // 设置擦除范围大小
    CGFloat w = 30;
    CGPoint point = [gesture locationInView:self.view];
    
    //擦除范围的位置
    CGRect rect = CGRectMake(point.x - w*0.5, point.y-w*0.5, w, w);
    
    // 先把图片渲染
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
    
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    [self.imageView.layer renderInContext:ref];
    
    
    CGContextClearRect(ref, rect);
    
    // d拿到图片
    self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    


}


@end
