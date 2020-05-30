//
//  ZHTableHeadView.m
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHTableHeadView.h"

@interface ZHTableHeadView()
@property (nonatomic, strong) UILabel *leftlabel;
@end

@implementation ZHTableHeadView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initHeadInfo];
    }
    return self;
}

- (void)initHeadInfo{
    
    self.leftlabel = [[UILabel alloc] init];
    self.leftlabel.textColor = DEFAULBLACKCOLOR;
    self.leftlabel.text = @"热门资讯";
    self.leftlabel.font = [UIFont boldSystemFontOfSize:14*myX6];
    [self.contentView addSubview:self.leftlabel];
    [self.leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(14*myX6);
    }];
    
//    ZHCustomButton
    UIButton * morebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [morebtn setTitle:@"更多〉" forState:UIControlStateNormal];
    [morebtn setTitleColor:DEFAULIGHTLGREENCOLOR forState:UIControlStateNormal];
    morebtn.titleLabel.font = font14;
    [morebtn addTarget:self action:@selector(ClickMoreBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:morebtn];
    [morebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self).with.offset(-14*myX6);
        make.centerY.equalTo(self);
    }];

}
-(void)setHeadviewTitle:(NSString *)title
{
    self.leftlabel.text = title;
}
- (void)ClickMoreBtn:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(moreEvent:)]) {
        [self.delegate moreEvent:sender];
    }
}

@end
