//
//  CycleScrollTopCell.h
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CycleScrollTopCell;
@protocol TopScrollDelegate <NSObject>
- (void)TapFunctionItemEvent:(NSInteger )tag;
@end

@interface CycleScrollTopCell : UITableViewCell
@property (nonatomic ,weak) id <TopScrollDelegate> delegate;
-(void)reloadScrollCellData;

@end

NS_ASSUME_NONNULL_END
