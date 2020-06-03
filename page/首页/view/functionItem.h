//
//  functionItem.h
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface functionItem : UIView

@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UIButton *tapEvent;

//+ (instancetype)itemView;
- (instancetype)initViewWithFrame:(CGRect)frame;

@end

NS_ASSUME_NONNULL_END
