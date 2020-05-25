//
//  CALayer+XibConfiguration.h
//  Field_ijovo
//
//  Created by 吴柳燕 on 16/7/1.
//  Copyright © 2016年 wly. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (XibConfiguration)
@property(nonatomic, assign) UIColor* borderColorFromUIColor;
@property(nonatomic, assign) UIColor* shadowColorFromUIColor;

@end
