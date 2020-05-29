//
//  ZHTableHeadView.h
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZHTableHeadView;
@protocol HeadMoreDelegate <NSObject>
- (void)moreEvent:(UIButton *)sender;
@end

@interface ZHTableHeadView : UITableViewHeaderFooterView
@property (nonatomic ,weak) id <HeadMoreDelegate> delegate;

-(void)setHeadviewTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
