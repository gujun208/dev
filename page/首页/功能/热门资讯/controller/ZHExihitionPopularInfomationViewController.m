//
//  ZHExihitionPopularInfomationViewController.m
//  exhibition
//
//  Created by 古军 on 2020/6/1.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHExihitionPopularInfomationViewController.h"
#import "HobbyCollectionViewCell.h"
#import "ZHHotnewsCovercontestViewController.h"
@interface ZHExihitionPopularInfomationViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>

@property (nonatomic, strong) UICollectionViewFlowLayout * flowLayout;
@property (nonatomic, strong) UICollectionView           * collectionView;
@property (nonatomic, strong) NSMutableArray             * dataArray;
@end

static NSString *CHeaderID = @"kHeaderID";

@implementation ZHExihitionPopularInfomationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"热门资讯";
    
    NSArray *arr = @[@"官方公告",@"展会展览",@"论坛会议",@"封面大赛",@"产业",@"游戏",@"硬件",@"动漫",@"电竞",@"VR",@"福利"];
    [self.dataArray addObjectsFromArray:arr];
    
     UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
     flowLayout.minimumLineSpacing = 8;
     flowLayout.minimumInteritemSpacing = 20;
     [flowLayout setSectionInset:UIEdgeInsetsMake(30*myX6, 20*myY6, 200*myX6, 20*myY6)];
     self.flowLayout = flowLayout;
     
     _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
     [self.collectionView registerClass:[HobbyCollectionViewCell class] forCellWithReuseIdentifier:@"HobbyCollectionViewCellID"];
     _collectionView.delegate = self;
     _collectionView.dataSource = self;
     _collectionView.emptyDataSetSource = self;
     _collectionView.emptyDataSetDelegate=self;
     _collectionView.backgroundColor = [UIColor whiteColor];
     _collectionView.showsVerticalScrollIndicator = NO;//隐藏滚动条
    
     [self.view addSubview:_collectionView];
     [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.left.top.equalTo(self.view);
         make.bottom.equalTo(self.view).with.offset(100*myY6);
     }];

}

#pragma mark ---- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}
/// 返回每个size的大小
- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(155*myX6, 110*myY6);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HobbyCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"HobbyCollectionViewCellID"    forIndexPath:indexPath];
    cell.hobbytypeName.text = self.dataArray[indexPath.row];
    cell.checkImageView.hidden=YES;
    return cell;
}

#pragma mark ---- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==3) {
        ZHHotnewsCovercontestViewController *vc = [ZHHotnewsCovercontestViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark -- DZNEmptyDataSetDelegate/DZNEmptyDataSetSource
-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    return [UIImage imageNamed:@"data_empty"];
}
- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView{
    NSString *title = NSLocalizedString(@"no_content", @"暂无内容");
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont boldSystemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName:DEFAULTLINE01COLOR
                                 };
    return [[NSAttributedString alloc] initWithString:title attributes:attributes];
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
