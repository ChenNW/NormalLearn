//
//  person.m
//  runtime02(动态添加方法)
//
//  Created by Cnw on 2018/9/21.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "person.h"
#import <objc/runtime.h>
@implementation person

void eatFood (id self ,SEL _cmd ,NSString *name){
    
    NSLog(@"吃了%@",name);
}


#pragma mark - 当找不到方法名时候就会调用
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    
    if (sel == NSSelectorFromString(@"eat:")) {
        
        class_addMethod(self, sel, (IMP)eatFood, "v@:@");
        
        return YES;
    }
    
    
    
    return [super resolveInstanceMethod: sel];
    
    
    
}

@end
