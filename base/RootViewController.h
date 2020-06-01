//
//  RootViewController.h
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHSearchBar.h"


typedef NS_ENUM(NSInteger, position_item) {
    position_left = 0,
    position_right
};

NS_ASSUME_NONNULL_BEGIN

@interface RootViewController : UIViewController

//自定义导航按钮
- (void)customNavigationItem:(position_item)positionItem title:(NSString *)title backgroundImage:(UIImage *)image action:(SEL)action;
//预览大图
- (void)lookBigImageWithUrlStr:(NSString *)urlstr;
@end

NS_ASSUME_NONNULL_END
