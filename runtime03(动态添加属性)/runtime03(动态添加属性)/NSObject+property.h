//
//  NSObject+property.h
//  runtime03(动态添加属性)
//
//  Created by Cnw on 2018/9/21.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (property)


/**  */
//只会生成set get 方法的声明,不会生成实现,也不会生成下划线的成员属性 
@property NSString *name;

@end

NS_ASSUME_NONNULL_END
