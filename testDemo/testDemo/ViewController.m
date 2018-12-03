//
//  ViewController.m
//  testDemo
//
//  Created by Cnw on 2018/9/27.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
{
    NSInteger _num;
}
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页";
    self.phoneTextField.delegate = self;
    [self.phoneTextField becomeFirstResponder];
    [self.phoneTextField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
}
- (IBAction)action:(id)sender {
}

-(void)textFieldChanged:(UITextField *)textField
{
    
    NSString * value = textField.text;
    
    NSMutableString * str = [[NSMutableString alloc] initWithString:value];
    
    if (str.length >_num) {
        
        if (value.length>3 && value.length <5) {
            [str insertString:@" " atIndex:3];
        }else if (value.length >8 && value.length <10){
            [str insertString:@" " atIndex:8];
        }else if (str.length >13){
            str = (NSMutableString*)[str substringToIndex:13];
        }
    }
    
 
    _num = str.length;
    NSLog(@"输入的字符串%@---输入的数字个数=%ld",textField.text,_num);
    self.phoneTextField.text = str;
    
    
    NSString * realStr = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@",realStr);
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
    
    
}

@end
