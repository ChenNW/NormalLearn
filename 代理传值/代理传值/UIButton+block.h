//
//  UIButton+block.h
//  代理传值
//
//  Created by Cnw on 2018/10/10.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ButtonBlock)(UIButton *button);

@interface UIButton (block)


-(void)addAction:(ButtonBlock)block;

@end

NS_ASSUME_NONNULL_END
