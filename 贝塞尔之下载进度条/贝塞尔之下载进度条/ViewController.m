//
//  ViewController.m
//  贝塞尔之下载进度条
//
//  Created by Cnw on 2018/11/22.
//  Copyright © 2018 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "BGView.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet BGView *BGView;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)action:(UISlider *)action
{
    self.progressLabel.text = [NSString stringWithFormat:@"%.2f%%",action.value *100];
    self.BGView.progressValue = action.value;
    
}

@end
