//
//  CycleScrollNoticeCell.h
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GYRollingNoticeView.h"

NS_ASSUME_NONNULL_BEGIN

@class CycleScrollNoticeCell;
@protocol TopScrollNoticeDelegate <NSObject>
- (void)TopNoticeEvent;
@end

@interface CycleScrollNoticeCell : UITableViewCell
@property (nonatomic, strong) GYRollingNoticeView *noticeView;
@property (nonatomic ,weak) id <TopScrollNoticeDelegate> delegate;

-(void)reloadNoticeCellData;
@end

NS_ASSUME_NONNULL_END
