//
//  ViewController.m
//  moreCellDelete
//
//  Created by Cnw on 2018/8/20.
//  Copyright © 2018年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
#define kScreenW UIScreen.mainScreen.bounds.size.width
#define kScreenH UIScreen.mainScreen.bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/** 数组 */
@property(nonatomic ,strong)NSMutableArray *dataArray;
/** 按钮 */
@property(nonatomic ,strong)UIButton *bottomButton,*allButton;
/** 列表 */
@property(nonatomic ,strong)UITableView *listTableView;
/** 是否在编辑 */
@property(nonatomic ,assign)BOOL isEdit;
/** 选中的数据 */
@property(nonatomic ,strong)NSMutableArray *selectedArray;

/** bottomView */
@property(nonatomic ,strong)UIView *bottomView;
@end

@implementation ViewController
-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(NSMutableArray *)selectedArray
{
    if (!_selectedArray) {
        _selectedArray = [NSMutableArray array];
    }
    return _selectedArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MoreDataDelete";
    [self setUI];
    [self.dataArray addObjectsFromArray: @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]];
    
    
    
}

#pragma mark - 初始化界面
-(void)setUI{
    
    
    UIButton * rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [rightButton setTitle:@"编辑" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    
    [rightButton addTarget:self action:@selector(tableViewEdit:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    
    
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    self.listTableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenH, kScreenW, 50)];
    [self.view addSubview:view];
//    view.backgroundColor = [UIColor purpleColor];
    self.bottomView = view;
    
    UIButton * allButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0 , kScreenW/2, 50)];
    [allButton setTitle:@"全选" forState:UIControlStateNormal];
    self.allButton = allButton;
    [allButton setImage:[UIImage imageNamed:@"gouxuan_wei"] forState:UIControlStateNormal];
    [allButton setImage:[UIImage imageNamed:@"gouxuan_xuanzhong"] forState:UIControlStateSelected];
    [allButton addTarget:self action:@selector(deleteData) forControlEvents:UIControlEventTouchUpInside];
    allButton.backgroundColor = [UIColor lightGrayColor];
    allButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [allButton addTarget:self action:@selector(allButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    allButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [allButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view addSubview:allButton];
    
    
    UIButton * bottomButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenW/2, 0 , kScreenW/2, 50)];
    [bottomButton setTitle:@"删除" forState:UIControlStateNormal];
    self.bottomButton = bottomButton;
    [bottomButton addTarget:self action:@selector(deleteData) forControlEvents:UIControlEventTouchUpInside];
    bottomButton.backgroundColor = [UIColor redColor];
    bottomButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [bottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [view addSubview:bottomButton];
    
}
-(void)deleteData
{
    
    for (NSString * str in self.selectedArray) {
        
        if ([self.dataArray containsObject:str]) {
    
            [self.dataArray removeObject:str];
             [self.bottomButton setTitle:@"删除" forState:UIControlStateNormal];
            [self.listTableView reloadData];
        }
        
    }
    
    [self.selectedArray removeAllObjects];
}
#pragma mark - 全选
-(void)allButtonSelected:(UIButton *)button
{
    button.selected = !button.selected;
    
    if (button.selected) {
        
        for (int i=0; i<self.dataArray.count; i++) {
            
            NSIndexPath * index = [NSIndexPath indexPathForRow:i inSection:0];
            [self.listTableView selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionTop];
            
        }
    }else{
        
        for (int i=0; i<self.dataArray.count; i++) {
            
            NSIndexPath * index = [NSIndexPath indexPathForRow:i inSection:0];
            [self.listTableView deselectRowAtIndexPath:index animated:YES];
            
        }
        
    }

    
    
}

#pragma mark - 右侧按钮的编辑效果
-(void)tableViewEdit:(UIButton *)button
{
    
   __block CGRect frame = self.bottomView.frame;
    __weak typeof(self) weakSelf = self;
    
    
    self.isEdit = !self.isEdit;
    if (self.isEdit) {
        [button setTitle:@"取消" forState:UIControlStateNormal];
        
        [self.listTableView reloadData];
        [self.listTableView setEditing:YES animated:YES];
        
        [self.selectedArray removeAllObjects];
        [self.bottomButton setTitle:@"删除" forState:UIControlStateNormal];
        self.listTableView.editing = YES;
        [UIView animateWithDuration:0.3 animations:^{
            frame.origin.y = kScreenH -50;
            weakSelf.bottomView.frame = frame;
        }];
        
    }else{
        
        [button setTitle:@"编辑" forState:UIControlStateNormal];
        self.listTableView.editing = NO;
        self.allButton.selected = NO;
        [UIView animateWithDuration:0.3 animations:^{
            frame.origin.y = kScreenH;
            weakSelf.bottomView.frame = frame;
        }];
    }
    
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID= @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%@行数据",self.dataArray[indexPath.row]];
//    NSLog(@"%@",cell.subviews);
    return cell;
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.isEditing) {

        return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;

    }else{

        return UITableViewCellEditingStyleDelete;
    }

}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing) {
        
        NSString * selectStr = self.dataArray[indexPath.row];
        
        if (![self.selectedArray containsObject:selectStr]) {
            [self.selectedArray addObject:selectStr];
        }
        [self.bottomButton setTitle:[NSString stringWithFormat:@"删除(%lu)" ,(unsigned long)self.selectedArray.count] forState:UIControlStateNormal];
        if (self.selectedArray.count == self.dataArray.count) {
            self.allButton.selected = YES;
        }
        
        return;
    }
    
    secondViewController * secondVC = [[secondViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
    
    
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.editing) {
        NSString * selectStr = self.dataArray[indexPath.row];
        if ([self.selectedArray containsObject:selectStr]) {
            
            [self.selectedArray removeObject:selectStr];
        }
        [self.bottomButton setTitle:[NSString stringWithFormat:@"删除(%lu)" ,(unsigned long)self.selectedArray.count] forState:UIControlStateNormal];
        if (self.selectedArray.count != self.dataArray.count) {
            self.allButton.selected = NO;
        }
        
    }
}



-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString * str = self.dataArray[indexPath.row];
    [self.dataArray removeObject:str];
    [self.listTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
