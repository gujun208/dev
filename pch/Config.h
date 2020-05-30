//
//  Config.h
//  exhibition
//
//  Created by 古军 on 2020/5/25.
//  Copyright © 2020 exhibition. All rights reserved.
//

#ifndef Config_h
#define Config_h

#import "Tool.h"
#import "UIColor+Hex.h"
#import "CALayer+XibConfiguration.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "iToast.h"
#import "Masonry.h"
#import "RootViewController.h"
#import "TabBarViewController.h"
#import "ZHUserModel.h"
#import "UIView+FrameSimplify.h"
#import "UILabel+Adapter.h"
#import "UIButton+Adapter.h"
#import "NSLayoutConstraint+IBDesignable.h"
#import "DYModelMaker.h"
#import "ZHModel.h"
#import "DAConfig.h"
#import "UIScrollView+EmptyDataSet.h"
#import "ZHCustomButton.h"
#import "PPNetWork.h"

//屏幕大小
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define GetRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height


#define iPhoneXr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)//与iphone11一致
#define iPhoneXs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)//iPhoneXs_Max、iPhone 11 pro max 屏幕一致
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)//IphoneX、IphoneXs 屏幕一致
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)//iPhone5、iPhoneSE 屏幕一致
#define iPhone8 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhonePlus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
#define GetRectNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height



#define KIsiPhoneX    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO) || ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO) || ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//适配函数
#define  myX   [UIScreen mainScreen].bounds.size.width/320.0
#define  myY   [UIScreen mainScreen].bounds.size.height/568.0
#define  myX6   [UIScreen mainScreen].bounds.size.width/375.0
#define  myY6   [UIScreen mainScreen].bounds.size.height/667.0
#define  myXx   [UIScreen mainScreen].bounds.size.width/1125.0/2
#define  myYx   [UIScreen mainScreen].bounds.size.height/2436.0/2
//颜色
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//判断当前系统
#define IOS8_OR_LATER        ( [[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending )

//当前版本
#define VERSION  [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleShortVersionString"]
#define BUILD  [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"]

#define WS(weakSelf) __weak __typeof(&*self)weakSelf = self

#define Toast(string)  [iToast showWithText:string bottomOffset:100]

//url
#define URL(urlString) [NSURL URLWithString:urlString]

//图片
#define ImageName(imageName) [UIImage imageNamed:imageName]

//字体
#define font9 [UIFont systemFontOfSize:9*myX6]
#define font10 [UIFont systemFontOfSize:10*myX6]
#define font11 [UIFont systemFontOfSize:11*myX6]
#define font12 [UIFont systemFontOfSize:12*myX6]
#define font13 [UIFont systemFontOfSize:13*myX6]
#define font14 [UIFont systemFontOfSize:14*myX6]
#define font15 [UIFont systemFontOfSize:15*myX6]
#define font16 [UIFont systemFontOfSize:16*myX6]

#define PageSize 20  //上拉加载下拉刷新的pagesize

#define TOKEN  @"Authorization"

#endif /* Config_h */
