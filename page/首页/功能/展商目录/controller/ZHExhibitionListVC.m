//
//  ZHExhibitionListVC.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHExhibitionListVC.h"
#import "ExhibitionNameCell.h"
#import "ZHExhibitionCompanyDetailViewController.h"

@interface ZHExhibitionListVC ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>{
    NSInteger page;
    NSInteger allPage;
}
@property ( nonatomic) UITableView *tableview;

@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation ZHExhibitionListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableview.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self->page = 1;
        [self.dataArray removeAllObjects];
    }];
        
    self.tableview.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        if (self->page < self->allPage) {
            self->page ++;

        }else{
            [self.tableview.mj_footer endRefreshing];
        }
    }];
    [self.tableview reloadData];



}

- (void)endRefresh{
    
    if (self.tableview.mj_header.isRefreshing) {
        [self.tableview.mj_header endRefreshing];
    }
    if (self.tableview.mj_footer.isRefreshing) {
        [self.tableview.mj_footer endRefreshing];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  23;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ExhibitionNameCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ExhibitionNameCell"];
//    cell.model = self.taskDataArr[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZHExhibitionCompanyDetailViewController *vc = [ZHExhibitionCompanyDetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -- DZNEmptyDataSetDelegate/DZNEmptyDataSetSource
-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    self.tableview.tableFooterView = [UIView new];
    if ([PPNetworkHelper isNetwork]) {
        return [UIImage imageNamed:@"data_empty"];
    }else{
        return [UIImage imageNamed:@"data_error"];
    }
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *title;
    if ([PPNetworkHelper isNetwork]) {
        title = NSLocalizedString(@"no_content", @"暂无内容");
    }else{
        title = NSLocalizedString(@"network_error", @"网络连接异常");
    }
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName:DEFAULBLUECOLOR
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    if (![PPNetworkHelper isNetwork]) {
        // 设置按钮标题
        NSString *buttonTitle = NSLocalizedString(@"recycler_view__footer_network_error", @"重新加载");
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0f],
                                     NSForegroundColorAttributeName:DEFAULBLUECOLOR
                                     };
        return [[NSAttributedString alloc] initWithString:buttonTitle attributes:attributes];
    }
    return nil;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    [self.tableview.mj_header beginRefreshing];
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
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-100)];
        [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([ExhibitionNameCell class]) bundle:nil] forCellReuseIdentifier:@"ExhibitionNameCell"];
        _tableview.delegate = self;
        _tableview.dataSource = self;
//        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        }
        if (@available(iOS 10.0, *)) {
            _tableview.frame = CGRectMake(0, 10*myY6, SCREEN_WIDTH, SCREEN_HEIGHT-54);
        }
        [self.view addSubview: _tableview];
    }
    return _tableview;
}

@end
