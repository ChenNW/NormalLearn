//
//  ViewController.m
//  倒计时
//
//  Created by Cnw on 2018/8/30.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#define kScreenW UIScreen.mainScreen.bounds.size.width
#define kScreenH UIScreen.mainScreen.bounds.size.height
#define StatusBarAndNavigationBarHeight kScreenH>736?88:64
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

/** 按钮 */
@property(nonatomic ,strong)UIButton *CODEButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUI];
    
}
#pragma mark - 初始化界面
-(void)setUI{
    

    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH -0) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    UIView * headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 200)];
    tableView.tableHeaderView = headView;
    
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 120, 40)];
    button.layer.cornerRadius = 6;
    [button setTitle:@"点击获取验证码" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    button.layer.borderColor = [UIColor lightGrayColor].CGColor;
    button.center = headView.center;
    button.layer.borderWidth = 1;
    [button addTarget:self action:@selector(getCode:) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:button];
    self.CODEButton = button;
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID= @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行数据",indexPath.row];
    return cell;
}

#pragma mark - 按钮的点击事件
-(void)getCode:(UIButton *)button
{
  __block  NSInteger time = 10;
    
    button.userInteractionEnabled = NO;
    [button setTitle:[NSString stringWithFormat:@"%02lds后重试",(long)time] forState:UIControlStateNormal];
   [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    NSTimer * myTimer = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        time--;
        [button setTitle:[NSString stringWithFormat:@"%02lds后重试",(long)time] forState:UIControlStateNormal];
        button.userInteractionEnabled = NO;
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        
        if (time == 0) {
            [timer invalidate];;
            [button setTitle:@"点击获取验证码" forState:UIControlStateNormal];
            button.userInteractionEnabled = YES;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        
        
    }];
    
    
    [[NSRunLoop currentRunLoop] addTimer:myTimer forMode:NSRunLoopCommonModes];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
