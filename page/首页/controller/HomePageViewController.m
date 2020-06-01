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
#import "CycleScrollTopCell.h"
#import "ZHExihitionActivityVC.h"

#import "ZHExhibitionsListViewController.h"
#import "ZHMeetingBBSViewController.h"
#import "ZHCoverContestViewController.h"
#import "ZHExihitionGuideViewController.h"
#import "ZHExihitionPopularInfomationViewController.h"


#define CyclescrollTopHeight 130*myY6
#define CyclescrollCateHeight 200*myY6
#define CyclescrollNoticeHeight 82*myY6
#define CycleCollectionHeight 270*myY6

@interface HomePageViewController ()<UITableViewDelegate,UITableViewDataSource,TopScrollH5Delegate,TopScrollNoticeDelegate,CollectionSelectDelegate,HeadMoreDelegate,UITextFieldDelegate,TopScrollDelegate>
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
        CycleScrollTopCell *itemCell = [tableView dequeueReusableCellWithIdentifier:@"CycleScrollTopCellID" forIndexPath:indexPath];
        itemCell.delegate=self;
        [itemCell reloadScrollCellData];
        return itemCell;

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
#pragma mark 功能item点击事件
- (void)TapFunctionItemEvent:(NSInteger )tag
{
    NSLog(@"----点击的tag为----:%ld",(long)tag);
    
    if (tag==1) {
        ZHExhibitionsListViewController *exhibitionListVC = [ZHExhibitionsListViewController new];
        exhibitionListVC.type = ExhibitionList;
        exhibitionListVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:exhibitionListVC animated:YES];
    }else if (tag==2){
        ZHExhibitionsListViewController *exhibitionListVC = [ZHExhibitionsListViewController new];
        exhibitionListVC.type = ExhibitionProduct;
        exhibitionListVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:exhibitionListVC animated:YES];
    }else if (tag==3){
        ZHExihitionActivityVC *activityVC = [ZHExihitionActivityVC new];
        activityVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:activityVC animated:YES];
    }else if (tag==4){
        ZHMeetingBBSViewController *BBSVC = [[ZHMeetingBBSViewController alloc] init];
        BBSVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:BBSVC animated:YES];
    }else if (tag==5){
        ZHCoverContestViewController *contestVC = [[ZHCoverContestViewController alloc] init];
        contestVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:contestVC animated:YES];
    }else if (tag==6){
        ZHExihitionGuideViewController *guideVC = [ZHExihitionGuideViewController new];
        guideVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:guideVC animated:YES];
    }else if (tag==7){
        ZHExihitionPopularInfomationViewController *popularVC = [ZHExihitionPopularInfomationViewController new];
        popularVC.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:popularVC animated:YES];
    }
    
    
}
#pragma mark 更多事件
- (void)moreEvent:(UIButton *)sender
{
    if (sender.tag == 3) {//热门资讯
    }else if (sender.tag == 4){//展会商场

    }else{

    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (self.searchBar.text.length > 0) {
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark tableview初始化
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT-10) style:UITableViewStyleGrouped];
        [_tableview registerClass:[CycleScrollH5Cell class] forCellReuseIdentifier:@"CycleScrollH5CellID"];
        [_tableview registerClass:[CycleScrollTopCell class] forCellReuseIdentifier:@"CycleScrollTopCellID"];
        [_tableview registerClass:[CycleScrollNoticeCell class] forCellReuseIdentifier:@"CycleScrollNoticeCellID"];
        [_tableview registerClass:[FunctionTableViewCell class] forCellReuseIdentifier:@"FunctionTableViewCellID"];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
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
