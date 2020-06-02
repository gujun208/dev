//
//  ZHSearchBar.m
//  exhibition
//
//  Created by 古军 on 2020/5/29.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHSearchBar.h"

@implementation ZHSearchBar

- (instancetype)initWithFrame:(CGRect)frame andPlaceholder:(NSString *)placeholder
{
    self = [super initWithFrame:frame];
    if (self) {
        self.mj_size = CGSizeMake(294*myX6, 36*myY6);
        self.mj_x= 10;
        self.font = [UIFont systemFontOfSize:12 * myX6];
        self.placeholder = [NSString stringWithFormat:@"%@",placeholder];
        NSMutableAttributedString *arrStr = [[NSMutableAttributedString alloc]initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:14 * myX6]}];
        self.attributedPlaceholder = arrStr;
        self.textColor = DEFAULBLACKCOLOR;
        // 提前在Xcode上设置图片中间拉伸
        self.background = [UIImage imageNamed:@"searchbar_textfield_background"];
        self.backgroundColor = RGB_COLOR(238, 238, 238);
        // 通过init初®始化的控件大多都没有尺寸
        UIImageView *searchIcon = [[UIImageView alloc] init];
        searchIcon.image = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
        // contentMode：default is UIViewContentModeScaleToFill，要设置为UIViewContentModeCenter：使图片居中，防止图片填充整个imageView
        searchIcon.contentMode = UIViewContentModeCenter;
        searchIcon.mj_size = CGSizeMake(30, 30);
        [self addSubview:searchIcon];
        self.layer.masksToBounds=YES;
        self.layer.cornerRadius = 8.0f;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}


+(instancetype)searchBar:(NSString *)placeholder{
    return [[self alloc] initWithFrame:CGRectZero andPlaceholder:placeholder];
}

@end
