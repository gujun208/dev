//
//  UIButton+Adapter.h
//  YUFoldingTableViewDemo
//
//  Created by IMac on 2018/9/25.
//  Copyright © 2018年 timelywind. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Adapter)
- (void)cq_addEventHandler:(void (^)(void))block forControlEvents:(UIControlEvents)controlEvents;
@end
