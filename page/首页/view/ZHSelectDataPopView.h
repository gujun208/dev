//
//  ZHSelectDataPopView.h
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHSelectDataPopView : UIView

// 展示从顶部向下弹出的UIView（包含遮罩）
- (void)showInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
