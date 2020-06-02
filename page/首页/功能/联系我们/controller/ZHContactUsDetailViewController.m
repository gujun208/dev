//
//  ZHContactUsDetailViewController.m
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHContactUsDetailViewController.h"
#import "ZHContactdetailCell.h"
#import "ZHContactDetailHeadview.h"

@interface ZHContactUsDetailViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@property ( nonatomic) UITableView *tableview;

@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation ZHContactUsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = self.titleString;
    
    [self.tableview reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  2;//self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHContactdetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ZHContactdetailCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50*myY6;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZHContactDetailHeadview * headview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ZHContactDetailHeadview"];
    if (!headview) {
        headview = [[ZHContactDetailHeadview alloc]initWithReuseIdentifier:@"ZHContactDetailHeadview"];
    }
    return headview;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark tableview初始化
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([ZHContactdetailCell class]) bundle:nil] forCellReuseIdentifier:@"ZHContactdetailCell"];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [self.view addSubview: _tableview];
    }
    return _tableview;
}


@end
