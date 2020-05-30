//
//  FunctionTableViewCell.m
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "FunctionTableViewCell.h"
#import "HobbyCollectionViewCell.h"

@interface FunctionTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) NSMutableArray    * dataArray;
@end

@implementation FunctionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        [self initLayoutUI];
    }
    return self;
}

- (void)initLayoutUI{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    // 最小行间距，默认是0
     flow.minimumLineSpacing = 8;
     // 最小左右间距，默认是10
     flow.minimumInteritemSpacing = 8;
     // 区域内间距，默认是 UIEdgeInsetsMake(0, 0, 0, 0)
     flow.sectionInset = UIEdgeInsetsMake(10*myX6, 10*myX6, 10*myX6, 10*myX6);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flow];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 15*myX6, 16*myY6, 15*myX6);
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[HobbyCollectionViewCell class] forCellWithReuseIdentifier:@"HobbyCollectionViewCellID"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled=NO;
    [self addSubview:self.collectionView];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

#pragma mark --UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;//self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HobbyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HobbyCollectionViewCellID" forIndexPath:indexPath];
    cell.checkImageView.hidden=YES;
//    cell.model = self.dataArray[indexPath.row];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(155*myX6, 110*myY6);
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    cell.layer.mask = shape;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(didSelectItemAtIndexPath:)]) {
        [self.delegate didSelectItemAtIndexPath:indexPath];
    }

}

- (void)reloadCollectionData{
    
    [self.collectionView reloadData];
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

@end
