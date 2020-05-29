//
//  ZHExhibitionListViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHExhibitionListViewController.h"
#import "ExhibitionNameCell.h"

@interface ZHExhibitionListViewController ()<UITableViewDelegate,UITableViewDataSource,DZNEmptyDataSetDelegate,DZNEmptyDataSetSource>{
    NSInteger page;
    NSInteger allPage;

}

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@property (weak, nonatomic) IBOutlet UIView *scrollview;

@property (nonatomic ,strong) NSMutableArray   * exArr;


@end

@implementation ZHExhibitionListViewController

#define exhibitionHeight 24
#define exhibitionWidth 40
#define space 8
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.navigationItem.title = @"展商目录";
    self.view.autoresizesSubviews = NO;

    NSArray * array = @[@"A馆",@"B馆",@"C馆",@"D馆",@"E馆",@"F馆",@"G馆",@"H馆",@"I馆",@"J馆",@"K馆",@"L馆",@"M馆",@"N馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",];
    int i = 0;
    for (NSString * name in array) {
        UIButton *exhBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        exhBtn.frame = CGRectMake(i*(exhibitionWidth + space), 25, exhibitionWidth, exhibitionHeight);
        [exhBtn setTitle:name forState:UIControlStateNormal];
        [exhBtn setTitleColor:DEFAULBLUECOLOR forState:UIControlStateNormal];
        exhBtn.layer.cornerRadius = 4;
        exhBtn.layer.borderWidth = 1;
        exhBtn.layer.borderColor = DEFAULBLUECOLOR.CGColor;
        
        exhBtn.titleLabel.font = font12;
        [self.scrollview addSubview:exhBtn];
        i++;
    }
    
    self.tableview.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self->page = 1;
        [self.exArr removeAllObjects];
    }];
        
    self.tableview.mj_footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        if (self->page < self->allPage) {
            self->page ++;

        }else{
            [self.tableview.mj_footer endRefreshing];
        }
    }];

    [self.tableview registerNib:[UINib nibWithNibName:NSStringFromClass([ExhibitionNameCell class]) bundle:nil] forCellReuseIdentifier:@"ExhibitionNameCell"];

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
}

#pragma mark -- DZNEmptyDataSetDelegate/DZNEmptyDataSetSource
-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    self.tableview.tableFooterView = [UIView new];
//    if ([PPNetworkHelper isNetwork]) {
        return [UIImage imageNamed:@"data_empty"];
//    }else{
//        return [UIImage imageNamed:@"data_error"];
//    }
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *title;
//    if ([PPNetworkHelper isNetwork]) {
        title = NSLocalizedString(@"no_content", @"暂无内容");
//    }else{
//        title = NSLocalizedString(@"network_error", @"网络连接异常");
//    }
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName:DEFAULBLUECOLOR
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}
- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
//    if (![PPNetworkHelper isNetwork]) {
        // 设置按钮标题
        NSString *buttonTitle = NSLocalizedString(@"recycler_view__footer_network_error", @"重新加载");
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont boldSystemFontOfSize:15.0f],
                                     NSForegroundColorAttributeName:DEFAULBLUECOLOR
                                     };
        return [[NSAttributedString alloc] initWithString:buttonTitle attributes:attributes];
//    }
    return nil;
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    [self.tableview.mj_header beginRefreshing];
}

- (NSMutableArray *)exArr{
    if (!_exArr) {
        _exArr = [NSMutableArray array];
    }
    return _exArr;
}

@end
