//
//  ViewController.m
//  AspectsDemo
//
//  Created by Cnw on 2018/9/25.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
#import <YYText.h>


// const 防止再次修改,只读 ,static 作用域在当前文件

static NSString * const name = @"name";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
//    [self setUI];
    
    
    
    
}

-(void)setUI{
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:@"123" forKey:name];
    
    
    
    YYLabel * label = [[YYLabel alloc] initWithFrame:CGRectMake(50, 100, 275, 200)];
    label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label];
    label.numberOfLines = 0;
    
    
    
    
    NSMutableAttributedString * text = [[NSMutableAttributedString alloc] initWithString:@"测试一段文字是吗?技能等级长宁街道才能到家朝南的就吵你"];
    text.yy_font = [UIFont boldSystemFontOfSize:24];
    text.yy_color = [UIColor redColor];
    [text yy_setColor:[UIColor purpleColor] range:NSMakeRange(0, 4)];
    text.yy_lineSpacing = 10;
    
    
    label.attributedText = text;
    
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    secondViewController * secondVC = [[secondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
    
}


@end
