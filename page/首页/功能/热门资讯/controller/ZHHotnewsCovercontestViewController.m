//
//  ZHHotnewsCovercontestViewController.m
//  exhibition
//
//  Created by 古军 on 2020/6/1.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHHotnewsCovercontestViewController.h"
#import "CycleScrollH5Cell.h"
#import "TableViewCell.h"
#import "ZHHotnewsCovercontestHeadView.h"

//热门资讯的封面大赛
@interface ZHHotnewsCovercontestViewController ()<UITableViewDelegate,UITableViewDataSource>{
    CGFloat imnageheight;
}
@property (nonatomic, strong) UITableView       * tableview;
@end

@implementation ZHHotnewsCovercontestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"封面大赛";
    
    
    //获取数据后获取图片的高度
//    UIImageView *im = [[UIImageView alloc] init];
//    [im sd_setImageWithURL:URL(@"") placeholderImage:ImageName(@"") completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
//        CGSize size = image.size;
//        self->imnageheight = size.height;
//        [self.tableview reloadData];
//
//    }];
    [self.tableview reloadData];
}

#pragma mark tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        return 130*myY6;
    }
    return 160*myY6;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        CycleScrollH5Cell *H5Cell = [tableView dequeueReusableCellWithIdentifier:@"CycleScrollH5CellID" forIndexPath:indexPath];
        return H5Cell;

    }else{
        TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==1 || section==2) {
//        return imnageheight;
        return 500;
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
    if (section==1 || section==2) {
        ZHHotnewsCovercontestHeadView * headview = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"ZHHotnewsCovercontestHeadView"];
        if (!headview) {
            headview = [[ZHHotnewsCovercontestHeadView alloc]initWithReuseIdentifier:@"ZHHotnewsCovercontestHeadView"];
        }
        headview.tapHandle = ^{
#pragma mark 点击图片
            [self lookBigImageWithUrlStr:@"http://wx2.sinaimg.cn/orj360/7ffa58d5ly1gdmb0xkohtj20u02j4qv5.jpg"];
        };
        return headview;

    }
    return [UIView new];
}

#pragma mark tableview初始化
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-50*myY6) style:UITableViewStyleGrouped];
        [_tableview registerClass:[CycleScrollH5Cell class] forCellReuseIdentifier:@"CycleScrollH5CellID"];
        [_tableview registerNib:[UINib nibWithNibName:NSStringFromClass([TableViewCell class]) bundle:nil] forCellReuseIdentifier:@"TableViewCell"];
        
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview: _tableview];
    }
    return _tableview;
}


@end
