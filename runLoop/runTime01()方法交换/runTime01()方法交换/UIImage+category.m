//
//  UIImage+category.m
//  runTime01()方法交换
//
//  Created by Cnw on 2018/9/20.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "UIImage+category.h"
#import <objc/runtime.h>

@implementation UIImage (category)

+(void)load
{
    
    Method systemMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    
    Method newMethod = class_getClassMethod(self, @selector(cnw_imageNamed:));
    
    
    method_exchangeImplementations(systemMethod, newMethod);
    
    
    
}




+(UIImage *)cnw_imageNamed:(NSString *)name
{
    UIImage * image = [UIImage cnw_imageNamed:name];
    
    if (image) {
        NSLog(@"加载成功");
    }else{
        NSLog(@"加载失败");
    }
    
    return image;
    
}

@end
