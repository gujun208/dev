//
//  UIColor+Hex.h
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020年 wly. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

///默认导航栏颜色(白色)
#define NAVCOLOR  [UIColor colorWithHexString:@"#ffffff"]

///默认主色（蓝色）
#define DEFAULBLUECOLOR  [UIColor colorWithHexString:@"#031272"]

///默认辅助色（浅绿色）
#define DEFAULIGHTLGREENCOLOR  [UIColor colorWithHexString:@"#00916E"]

///默认标题，正文（黑色）
#define DEFAULBLACKCOLOR  [UIColor colorWithHexString:@"#232323"]

#define DEFAULBLACK02COLOR  [UIColor colorWithHexString:@"#333333"]

///默认辅助性文字颜色（淡灰色）
#define DEFAULTLINE01COLOR  [UIColor colorWithHexString:@"#666666"]

#define DEFAULTLINE02COLOR  [UIColor colorWithHexString:@"#999999"]

#define DEFAULTLINE03COLOR  [UIColor colorWithHexString:@"#BBBBBB"]

///默认线条/边框（淡灰色）
#define DEFAULTLINECOLOR  [UIColor colorWithHexString:@"#DDDDDD"]

///默认背景框填充色（浅灰色）
#define DEFAULTREDCOLOR  [UIColor colorWithHexString:@"#F1F1F1"]


#define DEFAULTBGCOLOR  [UIColor colorWithHexString:@"#FAFAFA"]



@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
