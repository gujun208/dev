//
//  CycleScrollH5Cell.m
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "CycleScrollH5Cell.h"
#import <SDCycleScrollView.h>

//滚动的时间间隔
#define CycleScrollViewTimeInterval 3

@interface CycleScrollH5Cell ()<SDCycleScrollViewDelegate>
/* H5轮播图 */
@property (nonatomic, strong) SDCycleScrollView * cycleH5ScrollView;
@end

@implementation CycleScrollH5Cell

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
        
        UIImageView * bgImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 110 * myX6)];
        bgImage.image    =  [[UIImage imageNamed:@"scroll_bg"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{5,26,10,26}") resizingMode:UIImageResizingModeStretch];
        
        [self.contentView addSubview:bgImage];
        [self.contentView addSubview:self.cycleH5ScrollView];
        [self reloadH5CellData];

        [self.cycleH5ScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).with.offset(10);;
            make.left.equalTo(self).with.offset(13);
            make.right.equalTo(self).with.offset(-13);
            make.bottom.equalTo(self).with.offset(-10);
        }];
    }
    return self;
}

#pragma mark 轮播图
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    NSLog(@"点击的数量:%zd",index);
//    NSArray *array = [HomeH5BannerModel mj_objectArrayWithKeyValuesArray:[HomeModel getH5BannerArray]];
    if ([self.delegate respondsToSelector:@selector(TopH5Event)]) {
//        [self.delegate TopH5Event:array[index]];
        [self.delegate TopH5Event];
    }

}

-(void)reloadH5CellData{
    [self.cycleH5ScrollView adjustWhenControllerViewWillAppera];
    
//    NSArray *array = [HomeH5BannerModel mj_objectArrayWithKeyValuesArray:[HomeModel getH5BannerArray]];
//
//    NSMutableArray *imageArr = [NSMutableArray array];
//    for (HomeH5BannerModel * model in array) {
//
//        [imageArr addObject:[NSString stringWithFormat:@"%@" , [model.titlePage stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
//    }
//
//    self.cycleH5ScrollView.imageURLStringsGroup = imageArr;
    self.cycleH5ScrollView.imageURLStringsGroup = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590676251806&di=b88ddba6ffaefe60389e2ee02e3039f9&imgtype=0&src=http%3A%2F%2Fimg2.imgtn.bdimg.com%2Fit%2Fu%3D3930510857%2C1870350260%26fm%3D214%26gp%3D0.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1590676287446&di=b321cf76e06218fbf12a08849757671b&imgtype=0&src=http%3A%2F%2Fimg.51miz.com%2FElement%2F00%2F71%2F46%2F82%2Ffffc6885_E714682_92040862.jpg%2521%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue%2Fformat%2Fjpg"];

}

- (SDCycleScrollView *)cycleH5ScrollView{
    if (!_cycleH5ScrollView) {
        _cycleH5ScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero delegate:self placeholderImage:[UIImage imageNamed:@"home_mid_banner"]];
        _cycleH5ScrollView.autoScrollTimeInterval = CycleScrollViewTimeInterval;
        _cycleH5ScrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
        _cycleH5ScrollView.currentPageDotColor = DEFAULBLUECOLOR;
        _cycleH5ScrollView.pageDotColor = DEFAULTBGCOLOR;
        _cycleH5ScrollView.layer.cornerRadius  = 5.0f;
        _cycleH5ScrollView.clipsToBounds=YES;
//        [_cycleH5ScrollView adjustWhenControllerViewWillAppera];
    }
    return _cycleH5ScrollView;
}


@end
