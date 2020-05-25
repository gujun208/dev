//
//  UITextField+Adapter.m
//  ESportsBets
//
//  Created by IMac on 2018/9/25.
//  Copyright © 2018年 ysl. All rights reserved.
//

#import "UITextField+Adapter.h"
#import <objc/runtime.h>
@implementation UITextField (Adapter)

+(void)load{
    Method method1 = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method method2 = class_getInstanceMethod([self class], @selector(adapterInitWithCoder:));
    method_exchangeImplementations(method1, method2);
}

-(instancetype)adapterInitWithCoder:(NSCoder *)aDecoder
{
    [self adapterInitWithCoder:aDecoder];
    if (self) {
        if ([UIScreen mainScreen].bounds.size.width >= 414) {
            NSLog(@"+++++++%lf",self.font.pointSize);
            self.font =[UIFont systemFontOfSize:self.font.pointSize +2];
        }else if ([UIScreen mainScreen].bounds.size.width == 320) {
            self.font =[UIFont systemFontOfSize:self.font.pointSize -2];
        }
    }
    return self;
}

@end
