//
//  GYNoticeViewCell.h
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
// 调试cell内存地址log
static BOOL GYRollingDebugLog = NO;

@interface GYNoticeViewCell : UIView

@property (nonatomic, readonly, strong) UIView *contentView;
@property (nonatomic, readonly, strong) UILabel *textLabel;
@property (nonatomic, readonly,   copy) NSString *reuseIdentifier;


/// 普通用法label，左右间距， 必须>=0, 默认10
@property (nonatomic, assign) CGFloat textLabelLeading;
@property (nonatomic, assign) CGFloat textLabelTrailing;


- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
