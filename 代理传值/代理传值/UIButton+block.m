//
//  UIButton+block.m
//  代理传值
//
//  Created by Cnw on 2018/10/10.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "UIButton+block.h"
#import <objc/runtime.h>
@implementation UIButton (block)


static char buttonTag;

-(void)addAction:(ButtonBlock)block
{
    
    //把block传出去
    objc_setAssociatedObject(self, &buttonTag, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)buttonClick
{
    ButtonBlock block = objc_getAssociatedObject(self, &buttonTag);
    if (block) {
        
        block(self);
        
    }
    
    
}

@end
