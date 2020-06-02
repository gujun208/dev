//
//  ZHContactUsViewController.m
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHContactUsViewController.h"
#import "ExhibitionNameCell.h"
#import "ZHContactUsDetailViewController.h"

@interface ZHContactUsViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>

@property ( nonatomic) UITableView *tableview;

@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation ZHContactUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"联系我们";
    
    NSArray *array = @[@"展位预订及赞助销售",@"展商及赞助商服务",@"会议相关 联系方式",@"媒体合作与市场推广相关",@"联赛与大型活动及赛事"];
    
    [self.dataArray addObjectsFromArray:array];
    
    [self.tableview reloadData];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExhibitionNameCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ExhibitionNameCell"];
//    cell.model = self.taskDataArr[indexPath.row];
    cell.contentlabel.hidden=YES;
    cell.titlelabel.text = self.dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHContactUsDetailViewController *detailVC = [[ZHContactUsDetailViewController alloc] init];
    detailVC.titleString = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:YES];
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
        [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([ExhibitionNameCell class]) bundle:nil] forCellReuseIdentifier:@"ExhibitionNameCell"];
        _tableview.delegate = self;
        _tableview.dataSource = self;
//        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview: _tableview];
    }
    return _tableview;
}


@end
