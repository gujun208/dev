//
//  GYRollingNoticeView.h
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYNoticeViewCell.h"

@class GYRollingNoticeView;
@protocol GYRollingNoticeViewDataSource <NSObject>
@required
- (NSInteger)numberOfRowsForRollingNoticeView:(GYRollingNoticeView *)rollingView;
- (GYNoticeViewCell *)rollingNoticeView:(GYRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index;
@end

@protocol GYRollingNoticeViewDelegate <NSObject>
@optional
- (void)didClickRollingNoticeView:(GYRollingNoticeView *)rollingView forIndex:(NSUInteger)index;

@end

typedef NS_ENUM(NSUInteger, GYRollingNoticeViewStatus) {
    GYRollingNoticeViewStatusIdle,
    GYRollingNoticeViewStatusWorking,
    GYRollingNoticeViewStatusPause,
};

@interface GYRollingNoticeView : UIView


@property (nonatomic, weak) id<GYRollingNoticeViewDataSource> dataSource;
@property (nonatomic, weak) id<GYRollingNoticeViewDelegate> delegate;
@property (nonatomic, assign) NSTimeInterval stayInterval; // 停留时间 默认2秒
@property (nonatomic, assign, readonly) int currentIndex;
@property (nonatomic, assign, readonly) GYRollingNoticeViewStatus status;


- (void)registerClass:(Class)cellClass forCellReuseIdentifier:(NSString *)identifier;
- (void)registerNib:(UINib *)nib forCellReuseIdentifier:(NSString *)identifier;
- (__kindof GYNoticeViewCell *)dequeueReusableCellWithIdentifier:(NSString *)identifier;

- (void)reloadDataAndStartRoll;
- (void)stopRoll; // 如果想要释放，请在合适的地方停止timer。 If you want to release, please stop the timer in the right place,for example '-viewDidDismiss'

- (void)pause;
- (void)resume;



@end
