//
//  TopBannerView.h
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BannerViewDelegate;

@interface TopBannerView : UIView<UIScrollViewDelegate>{
    __unsafe_unretained id <BannerViewDelegate> _delegate;
}
@property (nonatomic, assign) id <BannerViewDelegate> bannerdelegate;
@property (nonatomic, assign)               NSInteger currentPage;
@property (nonatomic, readonly)         UIScrollView *scrollView;

@property (nonatomic, assign) CGFloat autoScrollTimeInterval;
/* 是否自动滚动,默认Yes */
@property (nonatomic,assign) BOOL autoScroll;
/* 滚动事件回调index */
@property (copy,nonatomic)void (^ ScrollItemBlock)(NSInteger index);

- (id)initWithFrame:(CGRect)frame;
-(void)setViewAry:(NSArray <UIView *>*)iViewAry;
-(void)autoShowNextImage;

@end

@protocol BannerViewDelegate <NSObject>
@optional
- (void)didClickPage:(TopBannerView *)view atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
