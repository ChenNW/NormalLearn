//
//  secondViewController.h
//  代理传值
//
//  Created by Cnw on 2018/10/10.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//@protocol secondViewControllerDelegate <NSObject>
//
//@optional
//
//-(void)popVcWithValue:(NSString *)value;
//
//@end


@interface secondViewController : UIViewController

//@property(nonatomic ,weak) id <secondViewControllerDelegate>delegate;

/**  */
@property(nonatomic ,strong)void (^block)(NSString * value);

@end

NS_ASSUME_NONNULL_END
