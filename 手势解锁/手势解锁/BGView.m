//
//  BGView.m
//  手势解锁
//
//  Created by Cnw on 2018/11/29.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "BGView.h"

@implementation BGView
{
    UIView * MyView;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIImage * image = [UIImage imageNamed:@"123"];
    
    [image drawInRect:rect];
    
    
}


@end
