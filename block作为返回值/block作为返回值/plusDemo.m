//
//  plusDemo.m
//  block作为返回值
//
//  Created by Cnw on 2018/10/17.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "plusDemo.h"

@implementation plusDemo
-(plusDemo * _Nonnull (^)(NSInteger))add

{
    return ^(NSInteger value){
        
        _result += value;
        
        
        return self;
        
    };
    
    
}
@end
