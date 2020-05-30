//
//  ZHExhibitionsListViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHExhibitionsListViewController.h"
#import "ZHExhibitionListVC.h"
#import "ExhibitionProductVC.h"

@interface ZHExhibitionsListViewController ()<UITextFieldDelegate,UIScrollViewDelegate>{
    NSUInteger adapter;//适配高度
}

@property (nonatomic ,strong) NSMutableArray    * exArr;

@property (nonatomic, strong) ZHSearchBar       * searchBar;
/* 当前选中的按钮 */
@property (nonatomic, weak)   UIButton          * selectedButton;
/* 底部的所有标签 */
@property (nonatomic, weak)   UIView            * titlesView;
/* 内容 */
@property (nonatomic, weak)   UIScrollView      * contentView;

@property (nonatomic, strong) NSMutableArray    * ExcountArray;
@end

#define exhibitionHeight 24*myY6
#define exhibitionWidth 40*myX6
#define space 8*myX6
#define TitleViewHeight 55*myY6

@implementation ZHExhibitionsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchBar =[ZHSearchBar searchBar:@"BTOC展览会"];
    self.searchBar.returnKeyType = UIReturnKeySearch;
    self.searchBar.delegate = self;
    self.navigationItem.titleView = self.searchBar;
    
    
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeSystem];
    searchButton.frame = CGRectMake(0, 0, 20, 30);
    [searchButton setImage:ImageName(@"icon_nar_search_normal") forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(SearchBarBtnAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    self.navigationItem.rightBarButtonItem = rightItem;

    self.view.autoresizesSubviews = NO;

    
    adapter = KIsiPhoneX?88:64;

    NSArray * array ;
    if (self.type == ExhibitionList) {
        array=@[@"A馆",@"B馆",@"C馆",@"D馆",@"E馆",@"F馆",@"G馆",@"H馆",@"I馆",@"J馆",@"K馆",@"L馆",@"M馆",@"N馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆",@"A馆"];

    }else{
        array = @[@"客户段网络游戏",@"英雄联盟",@"PC单机游戏",@"网页游戏",@"手机游戏",@"微信小游戏",@"客户段网络游戏",@"英雄联盟",@"PC单机游戏"];
    }

    [self.ExcountArray addObjectsFromArray:array];
    
    // 初始化子控制器
    [self setupChildVces];
    
    // 设置顶部的标签栏
    [self setupTitlesView];
    
    // 底部的scrollView
    [self setupContentView];

}

/**
 * 初始化子控制器
 */
- (void)setupChildVces
{
    for (NSString * title in self.ExcountArray) {
        if (self.type==ExhibitionList) {
            
            ZHExhibitionListVC *hibitionVC = [[ZHExhibitionListVC alloc] init];
            hibitionVC.title = title;
            [self addChildViewController:hibitionVC];

        }else{
            ExhibitionProductVC *productVC = [[ExhibitionProductVC alloc] init];
            productVC.title = title;
            [self addChildViewController:productVC];
        }
    }
}

/**
 * 设置低部的标签栏
 */
- (void)setupTitlesView
{
    // 标签栏整体
    UIView *titlesView = [[UIView alloc] init];
    titlesView.backgroundColor = [UIColor whiteColor];
    titlesView.frameWidth = SCREEN_WIDTH;
    titlesView.frameHeight = TitleViewHeight;
    [self.view addSubview:titlesView];
    self.titlesView = titlesView;
    
    // 标签栏的UISrollview
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.tag = 1000;
    contentView.frame = CGRectMake(0, 0, SCREEN_WIDTH, TitleViewHeight );
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    contentView.scrollEnabled = YES;
    contentView.showsHorizontalScrollIndicator = NO;
    [self.titlesView insertSubview:contentView atIndex:0];
    if (self.type==ExhibitionList) {
        contentView.contentSize = CGSizeMake(24*myX6+(exhibitionWidth+space) *self.ExcountArray.count, 0);
    }else{
        CGFloat contentW = 24*myX6;
        for (NSString *title in self.ExcountArray) {
            CGFloat titleWidth = [Tool calculateRowWidth:title withFont:12*myX6 withHeight:exhibitionHeight];
            contentW =contentW + titleWidth + 2*space;
        }
        contentView.contentSize = CGSizeMake(contentW+10, 0);
    }
    

    // 内部的子标签
    CGFloat buttonframeX = 0;
    CGFloat previousFrameW=0;
    for (NSInteger i = 0; i<self.childViewControllers.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.tag = i;
        button.frameHeight = exhibitionHeight;
        button.frameY = (TitleViewHeight -exhibitionHeight)/2;

        //动态计算title宽度
        UIViewController *vc = self.childViewControllers[i];
        CGFloat titleWidth = [Tool calculateRowWidth:vc.title withFont:12*myX6 withHeight:exhibitionHeight];
        if (self.type==ExhibitionList) {
            button.frameWidth = exhibitionWidth;
            button.frameX = 24*myX6 +i * (exhibitionWidth + space);
        }else{
            if (i==0) {
                buttonframeX = 24*myX6;
            }else{
                buttonframeX = buttonframeX + previousFrameW+space;
            }
            previousFrameW = titleWidth+space;
            
            button.frameWidth = previousFrameW;
            button.frameX = buttonframeX;
        }
        

        
        [button setTitle:vc.title forState:UIControlStateNormal];
        //[button layoutIfNeeded]; // 强制布局(强制更新子控件的frame)
        [button setTitleColor:DEFAULBLUECOLOR forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [button setBackgroundImage:ImageName(@"main_color") forState:UIControlStateDisabled];
        button.titleLabel.font = font12;
        button.layer.cornerRadius = 4;
        button.layer.borderWidth = 1;
        button.layer.borderColor = DEFAULBLUECOLOR.CGColor;
        [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [contentView addSubview:button];
        
        

        // 默认点击了第一个按钮
        if (i == 0) {
            button.enabled = NO;
            self.selectedButton = button;
            
            // 让按钮内部的label根据文字内容来计算尺寸
            [button.titleLabel sizeToFit];
        }
    }
}


- (void)titleClick:(UIButton *)button
{
    [self.view endEditing:YES];
    // 修改按钮状态
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    // 动画
    [UIView animateWithDuration:0.25 animations:^{
    }];
    
    // 滚动
    CGPoint offset = self.contentView.contentOffset;
    offset.x = button.tag * self.contentView.frameWidth;
    [self.contentView setContentOffset:offset animated:YES];
    
}

/**
 * 底部的scrollView
 */
- (void)setupContentView
{
    // 不要自动调整inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = CGRectMake(0, TitleViewHeight, SCREEN_WIDTH, self.view.frameHeight-self.titlesView.frameHeight - adapter );
    contentView.delegate = self;
    contentView.pagingEnabled = YES;
    contentView.scrollEnabled = NO;
    [self.view insertSubview:contentView atIndex:0];
    contentView.contentSize = CGSizeMake(SCREEN_WIDTH * self.childViewControllers.count, 0);
    self.contentView = contentView;
    
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 当前的索引
    NSInteger index = scrollView.contentOffset.x / scrollView.frameWidth;
    
    // 取出子控制器
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frameWidth =SCREEN_WIDTH;
    vc.view.frameX = scrollView.contentOffset.x;
    vc.view.frameY = 0; // 设置控制器view的y值为0(默认是20)
    vc.view.frameHeight = scrollView.frameHeight; // 设置控制器view的height值为整个屏幕的高度(默认是比屏幕高度少个20)
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.tag==1000) {
        return;
    }
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.frameWidth;
    [self titleClick:self.titlesView.subviews[index]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}


- (NSMutableArray *)ExcountArray{
    if (!_ExcountArray) {
        _ExcountArray = [NSMutableArray array];
    }
    return _ExcountArray;
}

@end
