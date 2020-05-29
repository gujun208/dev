//
//  CycleScrollH5Cell.h
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CycleScrollH5Cell;
@protocol TopScrollH5Delegate <NSObject>
- (void)TopH5Event;//:(HomeH5BannerModel * )model;
@end

@interface CycleScrollH5Cell : UITableViewCell
@property (nonatomic ,weak) id <TopScrollH5Delegate> delegate;
-(void)reloadH5CellData;

@end

NS_ASSUME_NONNULL_END
