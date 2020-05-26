//
//  iToast.m
//  JXB
//
//  Created by 奔哥 on 2019/1/5.
//  Copyright © 2019 ijovo. All rights reserved.
//

#import "iToast.h"
#import <QuartzCore/QuartzCore.h>

@interface iToast ()

- (id)initWithText:(NSString *)text_;
- (void)setDuration:(CGFloat) duration_;

- (void)toastTaped:(UIButton *)sender_;

- (void)showAnimation;
- (void)hideAnimation;

- (void)show;
- (void)showFromTopOffset:(CGFloat) topOffset_;
- (void)showFromBottomOffset:(CGFloat) bottomOffset_;

@end

static  iToast *_toast=nil;

@implementation iToast

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:[UIDevice currentDevice]];
}

- (instancetype)shareToast{
    static dispatch_once_t onceTonken;
    dispatch_once(&onceTonken, ^{
        _toast=[[iToast alloc]init];
    });
    return _toast;
}

- (instancetype)init{
    if (self=[super init]) {
        
    }
    return self;
}


- (id)initWithText:(NSString *)text_{
    if ((self = [self shareToast])) {
        [self dismissToast];
        text = [text_ copy];
        if (text == [NSNull null]||text == NULL||text == nil) {
            text = @"";
        }
        UIFont *font = [UIFont boldSystemFontOfSize:14];
        CGSize textSize = [text boundingRectWithSize:CGSizeMake(280, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : font} context:nil].size;;
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width + 12, textSize.height + 12)];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        textLabel.textAlignment = NSTextAlignmentCenter; //UITextAlignmentCenter;
        textLabel.font = font;
        textLabel.text = text;
        textLabel.numberOfLines = 0;
        
        contentView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, textLabel.frame.size.width, textLabel.frame.size.height)];
        contentView.layer.cornerRadius = 5.0f;
        contentView.layer.borderWidth = 1.0f;
        contentView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
        contentView.backgroundColor = [UIColor colorWithRed:0.2f
                                                      green:0.2f
                                                       blue:0.2f
                                                      alpha:0.75f];
        [contentView addSubview:textLabel];
        contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [contentView addTarget:self
                        action:@selector(toastTaped:)
              forControlEvents:UIControlEventTouchDown];
        contentView.alpha = 0.0f;
        //        [textLabel release];
        
        duration = DEFAULT_DISPLAY_DURATION;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(deviceOrientationDidChanged:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:[UIDevice currentDevice]];
    }
    return self;
}

- (void)deviceOrientationDidChanged:(NSNotification *)notify_{
    [self hideAnimation];
}

-(void)dismissToast{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [contentView removeFromSuperview];
}

-(void)toastTaped:(UIButton *)sender_{
    [self hideAnimation];
}

- (void)setDuration:(CGFloat) duration_{
    duration = duration_;
}

-(void)showAnimation{
    [UIView beginAnimations:@"show" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    contentView.alpha = 1.0f;
    [UIView commitAnimations];
}

-(void)hideAnimation{
    if ([NSThread isMainThread]) {
        [UIView beginAnimations:@"hide" context:NULL];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(dismissToast)];
        [UIView setAnimationDuration:0.3];
        contentView.alpha = 0.0f;
        [UIView commitAnimations];
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIView beginAnimations:@"hide" context:NULL];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(dismissToast)];
            [UIView setAnimationDuration:0.3];
            contentView.alpha = 0.0f;
            [UIView commitAnimations];
        });
    }
    
}

- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = window.center;
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}

- (void)showFromTopOffset:(CGFloat) top_{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = CGPointMake(window.center.x, top_ + contentView.frame.size.height/2);
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}

- (void)showFromBottomOffset:(CGFloat) bottom_{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = CGPointMake(window.center.x, window.frame.size.height-(bottom_ + contentView.frame.size.height/2));
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}


+ (void)showWithText:(NSString *)text_{
    [iToast showWithText:text_ duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text_
            duration:(CGFloat)duration_{
    iToast *toast = [[iToast alloc] initWithText:text_] ;
    [toast setDuration:duration_];
    [toast show];
}

+ (void)showWithText:(NSString *)text_
           topOffset:(CGFloat)topOffset_{
    [iToast showWithText:text_  topOffset:topOffset_ duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text_
           topOffset:(CGFloat)topOffset_
            duration:(CGFloat)duration_{
    iToast *toast = [[iToast alloc] initWithText:text_] ;
    [toast setDuration:duration_];
    [toast showFromTopOffset:topOffset_];
}

+ (void)showWithText:(NSString *)text_
        bottomOffset:(CGFloat)bottomOffset_{
    [iToast showWithText:text_  bottomOffset:bottomOffset_ duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text_
        bottomOffset:(CGFloat)bottomOffset_
            duration:(CGFloat)duration_{
    iToast *toast = [[iToast alloc] initWithText:text_] ;
    [toast setDuration:duration_];
    [toast showFromBottomOffset:bottomOffset_];
}

@end
