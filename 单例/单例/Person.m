//
//  Person.m
//  单例
//
//  Created by Cnw on 2018/9/7.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "Person.h"

@interface Person ()<NSCopying>

@end


@implementation Person

static Person * _person;


+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _person = [super allocWithZone:zone];
    });
    
    return _person;
    
}

+(instancetype)sharePerson
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _person = [[self alloc] init];
    });
    
    return _person;
    
}
-(id)copyWithZone:(NSZone *)zone
{
    return _person;
}

@end
