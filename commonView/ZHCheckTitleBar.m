//
//  ZHCheckTitleBar.m
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHCheckTitleBar.h"
@interface ZHCheckTitleBar()

@property (nonatomic, strong) UILabel * titlelbl;
@property (nonatomic, strong) UIImageView *icon;
@end


@implementation ZHCheckTitleBar

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
             self.titlelbl.frame = CGRectMake(10, 2, 240*myX6, 33*myY6);
             
             self.icon = [[UIImageView alloc] init];
             [self.icon setImage:ImageName(@"down arrow small")];
             [self addSubview:self.icon];
             self.icon.frame = CGRectMake(270*myX6, 12*myY6, 15*myY6, 15*myY6);
             
             UIButton *tapbtn = [UIButton buttonWithType:UIButtonTypeCustom];
             [tapbtn addTarget:self action:@selector(tapBar) forControlEvents:UIControlEventTouchUpInside];
             tapbtn.frame = self.frame;
             [self addSubview:tapbtn];
             
         }
        return self;
}
// 这个重写方法为重点
- (void)setFrame:(CGRect)frame {
         [super setFrame:CGRectMake(0, 0, 294*myX6,40*myY6)];
}
- (void)tapBar{
    if (self.TapbarBlock) {
        self.TapbarBlock();
    }
}

- (void)reloadBartext:(NSString *)txt andCheck:(BOOL)check{
    self.titlelbl.text = txt;
    
    if (check) {
        [self.icon setImage:ImageName(@"down arrow small")];
    }else{
        [self.icon setImage:ImageName(@"up arrow small")];
    }
}
@end
