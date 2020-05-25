//
//  NSLayoutConstraint+IBDesignable.m
//  YUFoldingTableViewDemo
//
//  Created by IMac on 2018/9/25.
//  Copyright © 2018年 timelywind. All rights reserved.
//

#import "NSLayoutConstraint+IBDesignable.h"

#import <objc/runtime.h>

// 基准屏幕宽度
#define kRefereWidth 375.0
#define kRefereHeigth 667.0
// 以屏幕宽度为固定比例关系，来计算对应的值。假设：基准屏幕宽度375，floatV=10；当前屏幕宽度为750时，那么返回的值为20
#define AdaptW(floatValue) (floatValue*[[UIScreen mainScreen] bounds].size.width/kRefereWidth)
#define AdaptH(floatValue) (floatValue*[[UIScreen mainScreen] bounds].size.height/kRefereHeigth)


@implementation NSLayoutConstraint (BSIBDesignable)

//定义常量 必须是C语言字符串
static char *AdapterScreenW = "AdapterScreenW";
static char *AdapterScreenH = "AdapterScreenH";

- (BOOL)adapterScreenW{
    NSNumber *number = objc_getAssociatedObject(self, AdapterScreenW);
    return number.boolValue;
}

-(void)setAdapterScreenW:(BOOL)adapterScreenW{

    NSNumber *number = @(adapterScreenW);
    objc_setAssociatedObject(self, AdapterScreenW, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (adapterScreenW){
        self.constant = AdaptW(self.constant);
    }
}

- (BOOL)adapterScreenH{
    NSNumber *number = objc_getAssociatedObject(self, AdapterScreenH);
    return number.boolValue;
}

-(void)setAdapterScreenH:(BOOL)adapterScreenH{
    
    NSNumber *number = @(adapterScreenH);
    objc_setAssociatedObject(self, AdapterScreenH, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (adapterScreenH){
        self.constant = AdaptH(self.constant);
    }
}
@end
