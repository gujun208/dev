//
//  UIButton+Adapter.m
//  YUFoldingTableViewDemo
//
//  Created by IMac on 2018/9/25.
//  Copyright © 2018年 timelywind. All rights reserved.
//

#import "UIButton+Adapter.h"
#import <objc/runtime.h>

typedef void(^CQ_ButtonEventsBlock)(void);

@interface UIButton ()

/** 事件回调的block */
@property (nonatomic, copy) CQ_ButtonEventsBlock cq_buttonEventsBlock;

@end

@implementation UIButton (Adapter)

#pragma mark 按钮适配
+(void)load{
    Method method1 = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method method2 = class_getInstanceMethod([self class], @selector(adapterInitWithCoder:));
    method_exchangeImplementations(method1, method2);
}

-(instancetype)adapterInitWithCoder:(NSCoder *)aDecoder
{
    [self adapterInitWithCoder:aDecoder];
    if (self) {
        if ([UIScreen mainScreen].bounds.size.width == 414) {
            NSLog(@"btn+++++++%lf",self.titleLabel.font.pointSize);
            self.titleLabel.font =[UIFont systemFontOfSize:self.titleLabel.font.pointSize +1];
            NSLog(@"btn-------%lf",self.titleLabel.font.pointSize);
        }else if ([UIScreen mainScreen].bounds.size.width == 320) {
            self.titleLabel.font =[UIFont systemFontOfSize:self.titleLabel.font.pointSize -1];
        }
    }
    return self;
}


#pragma mark 按钮Block事件

//------- 添加属性 -------//

static void *cq_buttonEventsBlockKey = &cq_buttonEventsBlockKey;

- (CQ_ButtonEventsBlock)cq_buttonEventsBlock {
    return objc_getAssociatedObject(self, &cq_buttonEventsBlockKey);
}

- (void)setCq_buttonEventsBlock:(CQ_ButtonEventsBlock)cq_buttonEventsBlock {
    objc_setAssociatedObject(self, &cq_buttonEventsBlockKey, cq_buttonEventsBlock, OBJC_ASSOCIATION_COPY);
}

/**
 给按钮绑定事件回调block
 
 @param block 回调的block
 @param controlEvents 回调block的事件
 */
- (void)cq_addEventHandler:(void (^)(void))block forControlEvents:(UIControlEvents)controlEvents {
    self.cq_buttonEventsBlock = block;
    [self addTarget:self action:@selector(cq_blcokButtonClicked) forControlEvents:controlEvents];
}

// 按钮点击
- (void)cq_blcokButtonClicked {
    if (self.cq_buttonEventsBlock) {
        self.cq_buttonEventsBlock();
    }
}

@end
