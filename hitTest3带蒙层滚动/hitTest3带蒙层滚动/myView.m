//
//  myView.m
//  hitTest3带蒙层滚动
//
//  Created by Cnw on 2018/8/27.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "myView.h"
#define kScreenW UIScreen.mainScreen.bounds.size.width
#define kScreenH UIScreen.mainScreen.bounds.size.height
#define StatusBarAndNavigationBarHeight kScreenH>736?88:64


@interface myView ()<UITableViewDelegate ,UITableViewDataSource>

/**  */
@property(nonatomic ,strong)UITableView *myTableView;

@end


@implementation myView


-(instancetype)init
{
    if (self = [super init]) {
        
        
        self.frame = CGRectMake(0, 0, kScreenW, kScreenH);
        [self setUI];
    }
    
    return self;
    
}

#pragma mark - 初始化界面
-(void)setUI{
    

    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
    [self addSubview:tableView];
    self.myTableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    UIView * bgView = [[UIView alloc] initWithFrame:self.bounds];
    [bgView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [self addSubview:bgView];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 30)];
    [bgView addSubview:label];
    label.text = @"列表滚动哦";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.center = CGPointMake(kScreenW/2, kScreenH/2);
    
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

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    
    if (!self.userInteractionEnabled || self.alpha<0.5 || self.hidden == YES) {
        
        return nil;
    }
    
    CGPoint newPoint = [self convertPoint:point toView:self.myTableView];
    
    if ([self.myTableView pointInside:newPoint withEvent:event]) {
        
        return self.myTableView;
    }
    
    return [super hitTest:point withEvent:event];
    
    
}



@end
