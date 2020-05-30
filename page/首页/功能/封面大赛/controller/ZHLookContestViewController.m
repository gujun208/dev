//
//  ZHLookContestViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHLookContestViewController.h"
#import "CoverContestCell.h"
#import "ZHCoverContestHeadView.h"

@interface ZHLookContestViewController ()
@property ( nonatomic) UITableView *tableview;

@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation ZHLookContestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"往期回顾";
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
    return 120*myY6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CoverContestCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CoverContestCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50*myY6;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    ZHCoverContestHeadView * headview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ZHCoverContestHeadView"];
    if (!headview) {
        headview = [[ZHCoverContestHeadView alloc]initWithReuseIdentifier:@"ZHCoverContestHeadView"];
    }
    [headview setHeadviewTitle:@"2020年第N期"];
    return headview;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([CoverContestCell class]) bundle:nil] forCellReuseIdentifier:@"CoverContestCell"];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        [self.view addSubview: _tableview];
    }
    return _tableview;
}



@end
