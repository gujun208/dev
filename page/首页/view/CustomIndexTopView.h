//
//  CustomIndexTopView.h
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CustomIndexTopView;
@protocol TapItemDelegate <NSObject>
- (void)TapItemEvent:(NSInteger )sender;
@end

@interface CustomIndexTopView : UIView
@property (nonatomic ,weak) id <TapItemDelegate> delegate;

- (instancetype)initViewWithFrame:(CGRect)frame;
- (void)CustomBannervalue:(NSArray *)array;

@end

NS_ASSUME_NONNULL_END
