//
//  iToast.h
//  JXB
//
//  Created by 奔哥 on 2019/1/5.
//  Copyright © 2019 ijovo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define DEFAULT_DISPLAY_DURATION 2.0f

NS_ASSUME_NONNULL_BEGIN

@interface iToast : NSObject{
    NSString *text;
    UIButton *contentView;
    CGFloat  duration;
}
+ (void)showWithText:(NSString *) text_;
+ (void)showWithText:(NSString *) text_
            duration:(CGFloat)duration_;

+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset_;
+ (void)showWithText:(NSString *) text_
           topOffset:(CGFloat) topOffset
            duration:(CGFloat) duration_;

+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_;
+ (void)showWithText:(NSString *) text_
        bottomOffset:(CGFloat) bottomOffset_
            duration:(CGFloat) duration_;

@end

NS_ASSUME_NONNULL_END
