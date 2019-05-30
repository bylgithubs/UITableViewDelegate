//
//  ViewController.m
//  UITableViewDelegate
//
//  Created by Civet on 2019/5/24.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320, 536) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _arrayData = [[NSMutableArray alloc] init];
    
    for (int i = 'A'; i <= 'Z'; i++){
        NSMutableArray *arraySmall = [[NSMutableArray alloc] init];
        for (int j = 1; j <= 5; j ++) {
            NSString *str = [NSString stringWithFormat:@"%c%d",i,j];
            [arraySmall addObject:str];
        }
        //生成一个二维数组
        [_arrayData addObject:arraySmall];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _arrayData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numRow = [[_arrayData objectAtIndex:section] count];
    return numRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = @"cell";
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.textLabel.text = _arrayData[indexPath.section][indexPath.row];
    return cell;
}

//获取高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

//获取每组头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"头部标题";
}

//获取每组尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"尾部标题";
}

//获取头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

//获取尾部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
