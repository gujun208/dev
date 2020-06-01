//
//  ScanViewController.m
//  exhibition
//
//  Created by 古军 on 2020/6/1.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ScanViewController.h"
#import "LBXScanResult.h"
#import "LBXScanWrapper.h"
#import "LBXAlertAction.h"

@interface ScanViewController ()

/**
 @brief  扫码区域上方提示文字
 */
@property (nonatomic, strong) UILabel *topTitle;

#pragma mark - 底部几个功能：开启闪光灯、相册、我的二维码
//底部显示的功能项
@property (nonatomic, strong) UIView *bottomItemsView;
//相册
@property (nonatomic, strong) UIButton *btnPhoto;
//闪光灯
@property (nonatomic, strong) UIButton *btnFlash;


@end

@implementation ScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
    self.navigationItem.title = @"扫一扫";

    //设置扫码区域参数设置
    
    //创建参数对象
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    
    //矩形区域中心上移，默认中心点为屏幕中心点
    style.centerUpOffset = 44;
    
    //扫码框周围4个角的类型,设置为外挂式
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_Outer;
    
    //扫码框周围4个角绘制的线条宽度
    style.photoframeLineW = 6;
    
    //扫码框周围4个角的宽度
    style.photoframeAngleW = 24;
    
    //扫码框周围4个角的高度
    style.photoframeAngleH = 24;
    
    //扫码框内 动画类型 --网格
    style.anmiationStyle = LBXScanViewAnimationStyle_NetGrid;
    
    //线条上下移动图片
    style.animationImage = [UIImage imageNamed:@"qrcode_scan_full_net"];
    
    self.style = style;
    //启动区域识别功能
    self.isOpenInterestRect = YES;
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = [UIColor blackColor];

}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self drawBottomItems];
    [self drawTitle];
    [self.view bringSubviewToFront:_topTitle];
    
    
}
//绘制扫描区域
- (void)drawTitle
{
    if (!_topTitle)
    {
        self.topTitle = [[UILabel alloc]init];
        _topTitle.bounds = CGRectMake(0, 0, 145, 60);
        _topTitle.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 50);
        
        //3.5inch iphone
        if ([UIScreen mainScreen].bounds.size.height <= 568 )
        {
            _topTitle.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 38);
            _topTitle.font = [UIFont systemFontOfSize:14];
        }
        
        
        _topTitle.textAlignment = NSTextAlignmentCenter;
        _topTitle.numberOfLines = 0;
        _topTitle.text = @"将取景框对准二维码即可自动扫描";
        _topTitle.textColor = [UIColor whiteColor];
        [self.view addSubview:_topTitle];
    }
    
    
}
- (void)drawBottomItems
{
    if (_bottomItemsView) {
        
        return;
    }
    
    self.bottomItemsView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.view.frame)-100 * myY - 64,
                                                                   CGRectGetWidth(self.view.frame), 100* myY)];
    
    _bottomItemsView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    [self.view addSubview:_bottomItemsView];
    
    
    CGSize size = CGSizeMake(60, 60);
    self.btnFlash = [[UIButton alloc]init];
    _btnFlash.bounds = CGRectMake(0, 0, size.width, size.height);
    _btnFlash.center = CGPointMake(CGRectGetWidth(_bottomItemsView.frame) * 1/3, CGRectGetHeight(_bottomItemsView.frame)/3);
    [_btnFlash setImage:[UIImage imageNamed:@"scan_Flash_Off"] forState:UIControlStateNormal];
    [_btnFlash addTarget:self action:@selector(openOrCloseFlash) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *textLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_btnFlash.frame), CGRectGetMaxY(_btnFlash.frame) , size.width , 21)];
    textLabel1.text = @"开灯";
    textLabel1.font = [UIFont systemFontOfSize:14];
    textLabel1.textColor = [UIColor whiteColor];
    textLabel1.textAlignment = NSTextAlignmentCenter;
    
    
    self.btnPhoto = [[UIButton alloc]init];
    _btnPhoto.bounds = _btnFlash.bounds;
    _btnPhoto.center = CGPointMake(CGRectGetWidth(_bottomItemsView.frame) * 2/3 , CGRectGetHeight(_bottomItemsView.frame)/3);
    [_btnPhoto setImage:[UIImage imageNamed:@"scan_Library"] forState:UIControlStateNormal];
    [_btnPhoto setImage:[UIImage imageNamed:@"scan_Library"] forState:UIControlStateHighlighted];
    [_btnPhoto addTarget:self action:@selector(openPhoto) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *textLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(_btnPhoto.frame), CGRectGetMaxY(_btnPhoto.frame) , size.width , 21)];
    textLabel2.text = @"相册";
    textLabel2.textAlignment = NSTextAlignmentCenter;
    textLabel2.font = [UIFont systemFontOfSize:14];
    textLabel2.textColor = [UIColor whiteColor];

    
    [_bottomItemsView addSubview:_btnFlash];
    [_bottomItemsView addSubview:textLabel1];
    [_bottomItemsView addSubview:_btnPhoto];
    [_bottomItemsView addSubview:textLabel2];
    
}

#pragma mark -底部功能项
//打开相册
- (void)openPhoto
{
    if ([LBXScanWrapper isGetPhotoPermission])
        [self openLocalPhoto];
    else
    {
        [self showError:@"      请到设置->隐私中开启本程序相册权限     "];
    }
}

//开关闪光灯
- (void)openOrCloseFlash
{
    
    [super openOrCloseFlash];
    
    
    if (self.isOpenFlash)
    {
        [_btnFlash setImage:[UIImage imageNamed:@"scan_Flash_On"] forState:UIControlStateNormal];
    }
    else {
        [_btnFlash setImage:[UIImage imageNamed:@"scan_Flash_Off"] forState:UIControlStateNormal];
    }
}


- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    
    if (array.count < 1)
    {
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    
    for (LBXScanResult *result in array) {
        
        NSLog(@"scanResult:%@",result.strScanned);
    }
    
    LBXScanResult *scanResult = array[0];
    
    NSString*strResult = scanResult.strScanned;
    
    self.scanImage = scanResult.imgScanned;
    
    if (!strResult) {
        
        [self popAlertMsgWithScanResult:nil];
        
        return;
    }
    
    //震动提醒
    [LBXScanWrapper systemVibrate];
    //声音提醒
    [LBXScanWrapper systemSound];
    
}



- (void)popAlertMsgWithScanResult:(NSString*)strResult
{
    if (!strResult) {
        
        strResult = @"识别失败";
    }
    
    __weak __typeof(self) weakSelf = self;
    
    [LBXAlertAction showAlertWithTitle:@"扫码内容" msg:strResult buttonsStatement:[NSArray arrayWithObjects:@"知道了", nil] chooseBlock:^(NSInteger buttonIdx) {
        //点击完，继续扫码
        [weakSelf reStartDevice];
    }];
    
}

@end
