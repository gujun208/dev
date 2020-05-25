//
//  UIView+FrameSimplify.m
//  JXB
//
//  Created by 奔哥 on 2018/12/28.
//  Copyright © 2018 ijovo. All rights reserved.
//

#import "UIView+FrameSimplify.h"

@implementation UIView (FrameSimplify)

- (void)setFrameSize:(CGSize)frameSize
{
    CGRect frame = self.frame;
    frame.size = frameSize;
    self.frame = frame;
}

- (CGSize)frameSize
{
    return self.frame.size;
}

- (void)setFrameWidth:(CGFloat)frameWidth
{
    CGRect frame = self.frame;
    frame.size.width = frameWidth;
    self.frame = frame;
}

- (void)setFrameHeight:(CGFloat)frameHeight
{
    CGRect frame = self.frame;
    frame.size.height = frameHeight;
    self.frame = frame;
}

- (void)setFrameX:(CGFloat)frameX
{
    CGRect frame = self.frame;
    frame.origin.x = frameX;
    self.frame = frame;
}

- (void)setFrameY:(CGFloat)frameY
{
    CGRect frame = self.frame;
    frame.origin.y = frameY;
    self.frame = frame;
}

- (CGFloat)frameWidth
{
    return self.frame.size.width;
}

- (CGFloat)frameHeight
{
    return self.frame.size.height;
}

- (CGFloat)frameX
{
    return self.frame.origin.x;
}

- (CGFloat)frameY
{
    return self.frame.origin.y;
}

- (void)setFrameCenterX:(CGFloat)frameCenterX
{
    CGPoint center = self.center;
    center.x = frameCenterX;
    self.center = center;
}

- (void)setFrameCenterY:(CGFloat)frameCenterY
{
    CGPoint center = self.center;
    center.y = frameCenterY;
    self.center = center;
}

- (CGFloat)frameCenterY
{
    return self.center.y;
}

- (CGFloat)frameCenterX
{
    return self.center.x;
}

@end
