//
//  ZHCheckTitleBar.h
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/*点击后下拉列表*/
@interface ZHCheckTitleBar : UIView
@property (copy,nonatomic)void (^ TapbarBlock)();
- (void)reloadBartext:(NSString *)txt andCheck:(BOOL)check;
@end

NS_ASSUME_NONNULL_END
