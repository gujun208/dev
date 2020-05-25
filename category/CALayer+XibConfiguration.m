//
//  CALayer+XibConfiguration.m
//  Field_ijovo
//
//  Created by 吴柳燕 on 16/7/1.
//  Copyright © 2016年 wly. All rights reserved.
//

#import "CALayer+XibConfiguration.h"


@implementation CALayer (XibConfiguration)
-(UIColor*)borderColorFromUIColor
{
    return [UIColor colorWithCGColor:self.borderColor];
}
-(UIColor*)shadowColorFromUIColor
{
    return [UIColor colorWithCGColor:self.shadowColor];
}
-(void)setBorderColorFromUIColor:(UIColor*)color
{
    self.borderColor = color.CGColor;
}
-(void)setShadowColorFromUIColor:(UIColor*)color
{
    self.shadowColor = color.CGColor;
}
@end
