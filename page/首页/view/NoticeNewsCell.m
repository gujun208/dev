//
//  NoticeNewsCell.m
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "NoticeNewsCell.h"

@implementation NoticeNewsCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = RGB_COLOR(238, 238, 238);
        [self setupUI];
    }
    return self;
}

// cell 高度82
- (void)setupUI
{
    UIView *bgview = [[UIView alloc] init];
    bgview.backgroundColor = [UIColor whiteColor];
    bgview.layer.masksToBounds = YES;
    bgview.layer.cornerRadius = 8*myX6;
    [self.contentView addSubview:bgview];
    [bgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self).with.offset(24);
        make.trailing.equalTo(self).with.offset(-24);
        make.bottom.equalTo(self).with.offset(-16);
        make.top.equalTo(self).with.offset(16);
    }];


    UIButton *noticeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [noticeBtn setImage:ImageName(@"icon_home_message") forState:UIControlStateNormal];
    [bgview addSubview:noticeBtn];
    noticeBtn.userInteractionEnabled=NO;
    [noticeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgview);
        make.left.equalTo(bgview).with.offset(10*myX6);
        make.size.mas_equalTo(20*myX6);
    }];

    _customLab = [[UILabel alloc]init];
    _customLab.textColor = DEFAULBLUECOLOR;
    _customLab.font = font13;
    [bgview addSubview:_customLab];
        [_customLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(noticeBtn);
            make.leading.equalTo(noticeBtn).with.offset(30*myX6);
            make.trailing.equalTo(bgview).with.offset(-25*myX6);
            make.height.mas_equalTo(20*myY6);
        }];

    
    UIButton *arrowBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [arrowBtn setImage:ImageName(@"right_arrow_small") forState:UIControlStateNormal];
    [bgview addSubview:arrowBtn];
    arrowBtn.userInteractionEnabled=NO;
    [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgview);
        make.trailing.equalTo(bgview);
        make.size.mas_equalTo(20*myX6);
    }];

}

@end
