//
//  ZHInterestHobbiesViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/27.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHInterestHobbiesViewController.h"
#import "HobbyCollectionViewCell.h"

@interface ZHInterestHobbiesViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,DZNEmptyDataSetSource,DZNEmptyDataSetDelegate>{
    
}

@property (nonatomic, strong) UICollectionViewFlowLayout * flowLayout;
@property (nonatomic, strong) UICollectionView           * collectionView;

@end

static NSString *CHeaderID = @"kHeaderID";

@implementation ZHInterestHobbiesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"兴趣爱好";

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(150*myX6, 110*myY6);
    // 以最小间距为10计算间距
    // 每行可放多少 cell
    NSInteger nCountCell = (SCREEN_WIDTH - 10) / (layout.itemSize.width + 10);
    // 平均后的间距
    CGFloat fSpacing = (SCREEN_WIDTH - layout.itemSize.width * nCountCell) / (nCountCell + 1);
    layout.minimumInteritemSpacing = fSpacing-5;
    layout.minimumLineSpacing = fSpacing-5;
    layout.sectionInset = UIEdgeInsetsMake(fSpacing-5, fSpacing-5, 200, fSpacing-5);
     self.flowLayout = layout;
     
     _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
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
    
    UIView * bottomview = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:bottomview];
    [bottomview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(self.view);
        make.height.mas_equalTo(100*myY6);
    }];

    UIButton *ensureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [ensureButton setTitle:@"确定" forState:UIControlStateNormal];
    [ensureButton setBackgroundColor:DEFAULBLUECOLOR];
    [ensureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    ensureButton.layer.masksToBounds=YES;
    ensureButton.layer.cornerRadius=8.0f;
    [ensureButton addTarget:self action:@selector(clickEnsureBtn) forControlEvents:UIControlEventTouchUpInside];
    [bottomview addSubview:ensureButton];
    [ensureButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bottomview);
        make.centerY.equalTo(bottomview);
        make.left.equalTo(bottomview).with.offset(24*myX6);
        make.height.mas_equalTo(48);
    }];

}

#pragma mark ---- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HobbyCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"HobbyCollectionViewCellID" forIndexPath:indexPath];
    cell.tag = indexPath.row;
    return cell;
}

#pragma mark ---- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    HobbyCollectionViewCell * cell = (HobbyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
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

#pragma mark 确定
- (void)clickEnsureBtn{
    if ([NSThread isMainThread]) {
        TabBarViewController *tabbar = [[TabBarViewController alloc] init];
        [UIApplication sharedApplication].keyWindow.rootViewController = tabbar;
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            TabBarViewController *tabbar = [[TabBarViewController alloc] init];
            [UIApplication sharedApplication].keyWindow.rootViewController = tabbar;
        });
    }

}
@end
