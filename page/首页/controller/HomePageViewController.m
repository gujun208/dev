//
//  HomePageViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/25.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "HomePageViewController.h"
#import "CycleScrollH5Cell.h"
#import "CycleScrollNoticeCell.h"
#import "ZHTableHeadView.h"
#import "FunctionTableViewCell.h"
#import "ZHExhibitionListViewController.h"
#import "ZHExhibitionCompanyViewController.h"


#define CyclescrollTopHeight 130*myY6
#define CyclescrollCateHeight 200*myY6
#define CyclescrollNoticeHeight 82*myY6
#define CycleCollectionHeight 270*myY6

@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource,TopScrollH5Delegate,TopScrollNoticeDelegate,CollectionSelectDelegate,HeadMoreDelegate,UITextFieldDelegate>
@property (nonatomic, strong) UITableView       * tableview;
@property (nonatomic, strong) ZHSearchBar       * searchBar;

@end

@implementation HomePageViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle =  UIStatusBarStyleDefault;
    [UIApplication sharedApplication].statusBarHidden=NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchBar =[ZHSearchBar searchBar:@"输入展商名称"];
    self.searchBar.returnKeyType = UIReturnKeySearch;
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    
    
    UIButton *languageButton = [UIButton buttonWithType:UIButtonTypeSystem];
    languageButton.frame = CGRectMake(0, 0, 20, 30);
    [languageButton setTitle:@"中文/EN" forState:UIControlStateNormal];
    [languageButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 10,0,-5)];
    [languageButton setTitleColor:DEFAULIGHTLGREENCOLOR forState:UIControlStateNormal];
    languageButton.titleLabel.font = font12;
    languageButton.titleLabel.numberOfLines=2;
    [languageButton addTarget:self action:@selector(rightBarBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:languageButton];
    self.navigationItem.rightBarButtonItem = rightItem;

    [self.tableview reloadData];
}

#pragma mark 切换中英文
- (void)rightBarBtnAction{
    
}

#pragma mark tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return CyclescrollTopHeight;
    }else if (indexPath.section==1){
        return CyclescrollCateHeight;
    }else if (indexPath.section==2){
        return CyclescrollNoticeHeight;
    }
    return CycleCollectionHeight;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        CycleScrollH5Cell *H5Cell = [tableView dequeueReusableCellWithIdentifier:@"CycleScrollH5CellID" forIndexPath:indexPath];
        H5Cell.delegate=self;
        [H5Cell reloadH5CellData];
        return H5Cell;

    }else if (indexPath.section==1){
        CycleScrollH5Cell *H5Cell = [tableView dequeueReusableCellWithIdentifier:@"CycleScrollH5CellID" forIndexPath:indexPath];
        H5Cell.delegate=self;
        [H5Cell reloadH5CellData];
        return H5Cell;

    }else if (indexPath.section==2){
        CycleScrollNoticeCell *NoticeCell = [tableView dequeueReusableCellWithIdentifier:@"CycleScrollNoticeCellID" forIndexPath:indexPath];
        NoticeCell.delegate=self;
        [NoticeCell reloadNoticeCellData];
        return NoticeCell;
    }else{
        FunctionTableViewCell *functionCell = [tableView dequeueReusableCellWithIdentifier:@"FunctionTableViewCellID" forIndexPath:indexPath];
        functionCell.delegate=self;
        [functionCell reloadCollectionData];
        return functionCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==3 || section==4) {
        return 50*myY6;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section==3 || section==4) {
        ZHTableHeadView * headview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ZHTableHeadView"];
        if (!headview) {
            headview = [[ZHTableHeadView alloc]initWithReuseIdentifier:@"ZHTableHeadView"];
        }
        headview.tag = section;
        headview.delegate=self;
        return headview;

    }
    return [UIView new];
}

#pragma mark 轮播图点击事件
- (void)TopH5Event{
    
}
#pragma mark 通知信息点击事件
- (void)TopNoticeEvent
{
    
}
#pragma mark 更多事件
- (void)moreEvent:(UIButton *)sender
{
    if (sender.tag == 3) {//热门资讯
    }else if (sender.tag == 4){//展会商场

    }else{
        ZHExhibitionListViewController *exhibitionListVC = [ZHExhibitionListViewController new];
        exhibitionListVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:exhibitionListVC animated:YES];

//        ZHExhibitionCompanyViewController * companyVC = [ZHExhibitionCompanyViewController new];
//        companyVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:companyVC animated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"点击了搜索");
    if (self.searchBar.text.length > 0) {
        [textField resignFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark tableview初始化
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT-10) style:UITableViewStyleGrouped];
        [_tableview registerClass:[CycleScrollH5Cell class] forCellReuseIdentifier:@"CycleScrollH5CellID"];
        [_tableview registerClass:[CycleScrollNoticeCell class] forCellReuseIdentifier:@"CycleScrollNoticeCellID"];
        [_tableview registerClass:[FunctionTableViewCell class] forCellReuseIdentifier:@"FunctionTableViewCellID"];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _tableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        }
        if (@available(iOS 10.0, *)) {
            _tableview.frame = CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT-54);
        }
        [self.view addSubview: _tableview];
    }
    return _tableview;
}

@end
