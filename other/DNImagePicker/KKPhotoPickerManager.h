//
//  HFPhotoPickerManager.h
//  HotFitness
//
//  Created by 周吾昆 on 15/10/31.
//  Copyright © 2015年 HeGuangTongChen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface KKPhotoPickerManager : NSObject

+ (instancetype)shareInstace;

typedef void (^CompelitionBlock)(NSMutableArray *imageArray,NSInteger type);//type 1相册 2拍照 
typedef void (^CompelitionFileBlock)(NSURL *filePath,NSString *fileName);

- (void)showActionSheetInView:(UIView *)inView
               fromController:(UIViewController *)fromController
              completionBlock:(CompelitionBlock)completionBlock;//仅拍照选择
- (void)showActionAllSheetInNum:(NSInteger )num View:(UIView *)inView
 fromController:(UIViewController *)fromController
completionBlock:(CompelitionBlock)completionBlock;//拍照/相册（外部控制可多张上传）
- (void)showActionAllSheetInView:(UIView *)inView
 fromController:(UIViewController *)fromController
completionBlock:(CompelitionBlock)completionBlock;//拍照/相册
- (void)showAllSheetInView:(UIView *)inView
fromController:(UIViewController *)fromController
              completionBlock:(CompelitionBlock)completionBlock;//拍照/相册/浏览文件
- (void)showFileSheetInView:(UIView *)inView
fromController:(UIViewController *)fromController
              completionBlock:(CompelitionFileBlock)completionBlock;//仅浏览文件

- (void)showCamerafromController:(UIViewController *)fromController
                 completionBlock:(CompelitionBlock)completionBlock;//Flutter调相机
- (void)showPhotofromController:(UIViewController *)fromController
completionBlock:(CompelitionBlock)completionBlock;//Flutter调相册


//修改图片张数限制,全局搜kDNImageFlowMaxSeletedNumber修改即可.

@end
