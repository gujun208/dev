//
//  ZHJumpSearch.h
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/*点击后跳转列表*/
@interface ZHJumpSearch : UIView
@property (copy,nonatomic)void (^ TapbarBlock)();
@end

NS_ASSUME_NONNULL_END
