//
//  ZHJumpSearch.m
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHJumpSearch.h"

@interface ZHJumpSearch()
@property (nonatomic, strong) UILabel * titlelbl;
@property (nonatomic, strong) UIImageView *icon;
@end

@implementation ZHJumpSearch

// 如果这个没有调用父类的方法可以不用写该方法
- (instancetype)initWithFrame:(CGRect)frame {
         self = [super initWithFrame:frame];
         if (self) {
             self.layer.masksToBounds=YES;
             self.layer.cornerRadius = 8.0f;

             self.backgroundColor = RGB_COLOR(238, 238, 238);
             
             self.titlelbl = [[UILabel alloc] init];
             self.titlelbl.text = @"测试测试测试测试测试测试测试测试测试测试";
             self.titlelbl.textColor = DEFAULTLINE01COLOR;
             self.titlelbl.font = font12;
             [self addSubview:self.titlelbl];
             self.titlelbl.frame = CGRectMake(10, 2, 240*myX6, 29);
             
             self.icon = [[UIImageView alloc] init];
             [self.icon setImage:ImageName(@"icon_nar_search_normal")];
             [self addSubview:self.icon];
             self.icon.frame = CGRectMake(260*myX6, 3, 32, 32);
             
             UIButton *tapbtn = [UIButton buttonWithType:UIButtonTypeCustom];
             [tapbtn addTarget:self action:@selector(tapBar) forControlEvents:UIControlEventTouchUpInside];
             tapbtn.frame = self.frame;
             [self addSubview:tapbtn];
             
         }
        return self;
}
// 这个重写方法为重点
- (void)setFrame:(CGRect)frame {
         [super setFrame:CGRectMake(0, 0, 294*myX6,36)];
}
- (void)tapBar{
    if (self.TapbarBlock) {
        self.TapbarBlock();
    }
}

@end
