//
//  ViewController.m
//  线程间的通信
//
//  Created by Cnw on 2018/9/5.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
    [self performSelectorInBackground:@selector(downLoad) withObject:nil];
    
}

-(void)downLoad
{
    
    NSURL * url = [NSURL URLWithString:@"http://f.hiphotos.baidu.com/image/pic/item/d043ad4bd11373f067aca6bca90f4bfbfbed0406.jpg"];
    
    NSData * data = [NSData dataWithContentsOfURL:url];
    
    UIImage * image = [UIImage imageWithData:data];
    
    
    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
    
    
}



@end
