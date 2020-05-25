//
//  UIView+FrameSimplify.h
//  JXB
//
//  Created by 奔哥 on 2018/12/28.
//  Copyright © 2018 ijovo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FrameSimplify)

@property (nonatomic, assign) CGSize  frameSize;
@property (nonatomic, assign) CGFloat frameWidth;
@property (nonatomic, assign) CGFloat frameHeight;
@property (nonatomic, assign) CGFloat frameX;
@property (nonatomic, assign) CGFloat frameY;
@property (nonatomic, assign) CGFloat frameCenterX;
@property (nonatomic, assign) CGFloat frameCenterY;

@end

NS_ASSUME_NONNULL_END
