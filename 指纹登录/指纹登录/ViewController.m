//
//  ViewController.m
//  指纹登录
//
//  Created by Cnw on 2018/8/21.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}
-(void)setUI
{
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 150, 375, 150)];
    [self.view addSubview:image];
    
    LAContext * context = [[LAContext alloc] init];
    NSString * str = @"通过Home键进行指纹验证";
    context.localizedFallbackTitle = @"请输入密码";
    NSError * error;
    
    // 首先使用canEvaluatePolicy 判断设备支持状态
    // LAPolicyDeviceOwnerAuthenticationWithBiometrics 生物指纹识别
    LAPolicy  policy;
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    if (systemVersion >=8 && systemVersion<10 ) {
        policy = LAPolicyDeviceOwnerAuthenticationWithBiometrics;
    }
    if (systemVersion>10) {
        policy =  LAPolicyDeviceOwnerAuthentication;
    }
    
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        [context evaluatePolicy:policy localizedReason:str reply:^(BOOL success, NSError * _Nullable error) {
            
            if (success) { // 验证成功
                
                
                dispatch_async(dispatch_get_main_queue(), ^{
                   
                    image.image = [UIImage imageNamed:@"one"];
                    
                });
                
            }else{
                
                switch (error.code) {
                    case LAErrorSystemCancel:
                        NSLog(@"切换到其他APP，系统取消验证Touch ID");
                        break;
                        
                    case LAErrorUserCancel:
                        NSLog(@"用户取消验证Touch ID");
                        break;
                        
                    case LAErrorUserFallback:
                        NSLog(@"选择输入密码");
                        dispatch_async(dispatch_get_main_queue(), ^{
                           
                            NSLog(@"123");
                            
                        });
                        break;
                    case LAErrorAuthenticationFailed:
                    {
                        NSLog(@"Authentication Failed");
                        break;
                    }
                    case LAErrorBiometryLockout:
                    {
                        NSLog(@"TOUCH ID is locked out");
                        break;
                    }
                    case LAErrorAppCancel:
                    {
                        NSLog(@"app cancle the authentication");
                        break;
                    }
                    case LAErrorInvalidContext:
                    {
                        NSLog(@"context is invalidated");
                        break;
                    }
                        
                       
                    default:
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                           
                            NSLog(@"其他情况");
                            
                        });
                        
                        break;
                }
                
                
            }
            
            
        }];
        
        
        
        
    }else{
        // 不支持指纹登录的情况
        //不支持指纹识别，LOG出错误详情
        switch (error.code) {//身份验证无法启动，因为生物识别没有录入信息。
            case LAErrorBiometryNotEnrolled:
            {
                NSLog(@"TouchID is not enrolled");
                break;
            }
            case LAErrorPasscodeNotSet:
            {//身份验证无法启动,因为设备没有设置密码。
                NSLog(@"A passcode has not been set");
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        
  
    }
    
    
    
    
}
- (IBAction)progressSlideAction:(UISlider *)sender {
}
- (IBAction)button:(id)sender {
}
- (IBAction)buttonAction:(id)sender {
}
- (IBAction)buttonAction:(id)sender {
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
