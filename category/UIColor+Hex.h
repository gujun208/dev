//
//  UIColor+Hex.h
//  Field_ijovo
//
//  Created by 吴柳燕 on 16/4/22.
//  Copyright © 2016年 wly. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]

///默认导航栏颜色(白色)
#define NAVCOLOR  [UIColor colorWithHexString:@"#ffffff"]


///默认主色（蓝色）
#define DEFAULBLUECOLOR  [UIColor colorWithHexString:@"#4196ff"]
///默认主色（浅蓝色）
#define DEFAULIGHTLBLUECOLOR  [UIColor colorWithHexString:@"#88bdff"]
///默认主背景色（淡灰色）
#define DEFAULLIGHTGRAYCOLOR  [UIColor colorWithHexString:@"#f8f8f9"]
///默认线条颜色（淡灰色）
#define DEFAULTLINECOLOR  [UIColor colorWithHexString:@"#f2f2f2"]
///默认常用绿色（绿色）
#define DEFAULTGREENCOLOR  [UIColor colorWithHexString:@"#39cb49"]
///默认常用红色（红色）
#define DEFAULTREDCOLOR  [UIColor colorWithHexString:@"#f64a3f"]
///默认常用浅蓝色（浅蓝色）
#define DEFAULTLIFGHTBLUECOLOR  [UIColor colorWithHexString:@"#daebff"]

#define DEFAULTTEXTCOLOR  [UIColor colorWithHexString:@"#454545"]
#define DEFAULTBGCOLOR  [UIColor colorWithHexString:@"#f3f3f3"]

/////默认字号颜色等级
///1.主内容。 对应14号字体   （黑色）
#define DEFAULTFONTMAINCOLOR  [UIColor colorWithHexString:@"#31353b"] //rgb（49,53,59）
///2.次内容a  对应13号字体  （淡黑色）
#define DEFAULTFONTOTHERACOLOR  [UIColor colorWithHexString:@"#61656b"]
///3.次内容b  对应13号字体  （淡黑色）
#define DEFAULTFONTOTHERBCOLOR  [UIColor colorWithHexString:@"#81858a"]
///4.提示性内容 对应12号字体 （浅黑色）
#define DEFAULTFONTTIPSCOLOR  [UIColor colorWithHexString:@"#c8cacc"]




@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
