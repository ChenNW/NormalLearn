
//
//  runtimeObject.m
//  消息转发机制
//
//  Created by Cnw on 2018/10/25.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "runtimeObject.h"

@implementation runtimeObject

#pragma mark - 消息转发第一步(如果返回YES则消息已处理,返回NO则进行下一步)
+(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(test)) {
        
        NSLog(@"消息转发结束");
        
        return NO;
    }else{
        
        // 返回父类方法
        return [super resolveInstanceMethod:sel];
        
    }
    
}

#pragma mark - 第一步返回NO,来到第二步(返回nil),则来到第三步
-(id)forwardingTargetForSelector:(SEL)aSelector
{
//    if (aSelector == @selector(test)) {
//
//    }
    NSLog(@"forwardingTargetForSelector");
    return nil;
}

#pragma mark - 前两步都没实现则来到第三步
-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if (aSelector == @selector(test)) {
        NSLog(@"还没实现吗?");
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }else{
        //没有的话返回父类方法
        return [super methodSignatureForSelector:aSelector];
        
    }
}
#pragma mark - 第三步返回方法签名来到这里
-(void)forwardInvocation:(NSInvocation *)anInvocation
{
   
}

@end
