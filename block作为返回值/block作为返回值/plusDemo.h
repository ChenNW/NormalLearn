//
//  plusDemo.h
//  block作为返回值
//
//  Created by Cnw on 2018/10/17.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface plusDemo : NSObject

@property(nonatomic , assign)NSInteger result;
-(plusDemo *(^)(NSInteger value))add;

@end

NS_ASSUME_NONNULL_END
