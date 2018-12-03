//
//  ViewController.m
//  图片水印
//
//  Created by Cnw on 2018/11/28.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self getAllScreen];
    
    
    
    
}

#pragma mark - 截屏
-(void)getAllScreen
{
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 把控件上的图层,渲染到上下文,layer只能渲染
    [self.view.layer renderInContext:ref];
    
    
    // 生成新的图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    NSData * data = UIImagePNGRepresentation(newImage);
    
    [data writeToFile:@"/Users/chenningwei/Desktop/demo/demo.png" atomically:YES];
    
    
    
    
    
    
}



#pragma mark - 圆环
-(void)yuanhuan
{
    
    //圆环
    UIImage * image = [UIImage imageNamed:@"timg"];
    
    CGFloat margin = 2;
    CGFloat allW = image.size.width + 2*margin;
    
    // 背景圆
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(allW, allW), NO, 0);
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, allW, allW)];
    [[UIColor redColor] set];
    [path fill];
    
    // 图片
    UIBezierPath * path1 = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(margin, margin, image.size.width, image.size.width )];
    [path1 addClip];
    
    
    // 裁剪
    [image drawAtPoint:CGPointMake(margin, margin)];
    
    // 拿到图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭
    UIGraphicsEndImageContext();
    
    self.imageView.image = newImage;

    
    
}

#pragma mark - 裁剪图片
-(void)caijian
{
    UIImage * image = [UIImage imageNamed:@"timg"];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2.设置一个圆形裁剪区域
    //2.1绘制一个圆形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    //2.2.把圆形的路径设置成裁剪区域
    [path addClip];//超过裁剪区域以外的内容都给裁剪掉
    //3.把图片绘制到上下文当中(超过裁剪区域以外的内容都给裁剪掉)
    [image drawAtPoint:CGPointZero];
    //4.从上下文当中取出图片
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    // 显示
    self.imageView.image = newImage;
    
    
    
    self.secondImage.layer.cornerRadius = 120;
    self.secondImage.clipsToBounds = YES;
    self.secondImage.image = image;
}


#pragma mark -  图片水印
-(void)pictureWater
{
    UIImage * image = [UIImage imageNamed:@"loadFail"];
    // 1.开启上下文
    //第二个参数NO是透明,YES不透明,第三个参数0是不缩放
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 2. 开始绘制图片
    [image drawAtPoint:CGPointZero];
    
    // 绘制文字
    NSString * str = @"测试图片水印";
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor redColor]; // 镂空
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [str drawAtPoint:CGPointMake(image.size.width - 100, image.size.height - 30) withAttributes:dict];
    // 3.拿到绘制后的图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    // 4. 结束上下文
    UIGraphicsEndImageContext();
    
    self.imageView.image = newImage;

}


@end
