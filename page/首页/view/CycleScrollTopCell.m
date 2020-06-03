//
//  CycleScrollTopCell.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "CycleScrollTopCell.h"
#import "TopBannerView.h"
#import "CustomIndexTopView.h"
#define CyclescrollTopHeight 180
#define indicatorViewHeight  20*myY6
#define indicatorlblWidth   16*myX6
@interface CycleScrollTopCell ()<BannerViewDelegate,TapItemDelegate>{
    NSInteger _index;
}

@property (nonatomic, strong) TopBannerView *bannerview;
@property (nonatomic, strong) CustomIndexTopView *FunctionView1;
@property (nonatomic, strong) CustomIndexTopView *FunctionView2;

//指示器
@property (nonatomic, strong) UILabel *indicatorlbl1;
@property (nonatomic, strong) UILabel *indicatorlbl2;
@end


@implementation CycleScrollTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadLayoutUI];
    }
    return self;
}

- (void)loadLayoutUI{
    if (!self.FunctionView1) {
        self.FunctionView1 = [[CustomIndexTopView alloc] initViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CyclescrollTopHeight)];
        self.FunctionView1.delegate=self;
    }
    if (!self.FunctionView2) {
        self.FunctionView2 = [[CustomIndexTopView alloc] initViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CyclescrollTopHeight)];
        self.FunctionView2.delegate=self;
    }

    self.bannerview = [[TopBannerView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CyclescrollTopHeight)];
    self.bannerview.layer.masksToBounds = YES;
    self.bannerview.layer.cornerRadius  = 10.0f;
    self.bannerview.bannerdelegate = self;
    WS(weakSelf);
    self.bannerview.ScrollItemBlock = ^(NSInteger index) {
        self->_index = index;
        [weakSelf reloadIndicatorLabel];
    };
    [self.contentView addSubview:self.bannerview];

    //自动滚动
    self.bannerview.autoScroll=NO;
//    self.bannerview.autoScrollTimeInterval = 5;

    //滑动指示器 (后面根据接口来控制指示器个数及上面CustomIndexTopView个数)
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.frame = CGRectMake(0,CyclescrollTopHeight, SCREEN_WIDTH, indicatorViewHeight);
    [self.contentView addSubview:indicatorView];
    
    UIView *indicatorCenterView = [[UIView alloc] init];
    [indicatorView addSubview:indicatorCenterView];
    [indicatorCenterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(indicatorView);
        make.centerY.equalTo(indicatorView);
        make.height.mas_equalTo(20*myY6);
        make.width.mas_equalTo(indicatorlblWidth * 2+20);
    }];

    self.indicatorlbl1 = [[UILabel alloc] init];
    [indicatorCenterView addSubview:self.indicatorlbl1];
    self.indicatorlbl1.backgroundColor = DEFAULBLUECOLOR;
    self.indicatorlbl1.layer.cornerRadius = 2.0f;
    self.indicatorlbl1.layer.masksToBounds=YES;
    [self.indicatorlbl1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(indicatorView).with.offset(-10);
        make.height.mas_equalTo(4*myY6);
        make.width.mas_equalTo(indicatorlblWidth);
        make.left.mas_equalTo(indicatorCenterView).with.offset(5);
    }];

    self.indicatorlbl2 = [[UILabel alloc] init];
    [indicatorCenterView addSubview:self.indicatorlbl2];
    self.indicatorlbl2.backgroundColor = RGBA_COLOR(3, 18, 114, 0.2);
    self.indicatorlbl2.layer.cornerRadius = 2.0f;
    self.indicatorlbl2.layer.masksToBounds=YES;
    [self.indicatorlbl2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(indicatorView).with.offset(-10);
        make.height.mas_equalTo(4*myY6);
        make.width.mas_equalTo(indicatorlblWidth);
        make.left.mas_equalTo(indicatorlblWidth+15);
    }];

    
}

-(void)reloadScrollCellData
{
    [self.FunctionView1 CustomBannervalue:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]];
    [self.FunctionView2 CustomBannervalue:@[@"11",@"12",@"13"]];

    [self.bannerview setViewAry:@[self.FunctionView1,self.FunctionView2]];

}

- (void)reloadIndicatorLabel{
    if (_index==0) {
        self.indicatorlbl2.backgroundColor = RGBA_COLOR(3, 18, 114, 0.2);
        self.indicatorlbl1.backgroundColor = DEFAULBLUECOLOR;

    }else{
        self.indicatorlbl1.backgroundColor = RGBA_COLOR(3, 18, 114, 0.2);
        self.indicatorlbl2.backgroundColor = DEFAULBLUECOLOR;

    }
    
}

#pragma mark item点击事件
- (void)TapItemEvent:(NSInteger)sender{
   if ([self.delegate respondsToSelector:@selector(TapFunctionItemEvent:)]) {
       [self.delegate TapFunctionItemEvent:sender];
   }
}
//- (void)didClickPage:(TopBannerView *)view atIndex:(NSInteger)index{
//    NSLog(@"banner==%ld",(long)index);
//    if ([self.delegate respondsToSelector:@selector(TopEvent:)]) {
//        [self.delegate TopEvent:index];
//    }
//}

@end
