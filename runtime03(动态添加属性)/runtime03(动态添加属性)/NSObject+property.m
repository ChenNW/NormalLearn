//
//  NSObject+property.m
//  runtime03(动态添加属性)
//
//  Created by Cnw on 2018/9/21.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "NSObject+property.h"
#import <objc/runtime.h>

@implementation NSObject (property)


static NSString * _value;

// set方法
-(void)setName:(NSString *)name
{
    
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    
}
// get方法
-(NSString *)name
{
    return objc_getAssociatedObject(self, @"name");
}
@end
