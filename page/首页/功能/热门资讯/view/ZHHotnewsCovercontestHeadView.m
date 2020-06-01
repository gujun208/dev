//
//  ZHHotnewsCovercontestHeadView.m
//  exhibition
//
//  Created by 古军 on 2020/6/1.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHHotnewsCovercontestHeadView.h"

@interface ZHHotnewsCovercontestHeadView()
@property (nonatomic, strong) UILabel *leftlabel;
@end

@implementation ZHHotnewsCovercontestHeadView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initHeadInfo];
    }
    return self;
}

- (void)initHeadInfo{
    
    self.leftlabel = [[UILabel alloc] init];
    self.leftlabel.textColor = RGB_COLOR(239, 112, 27);
    self.leftlabel.text = @"最佳个人金奖";
    self.leftlabel.font = [UIFont boldSystemFontOfSize:16*myX6];
    [self.contentView addSubview:self.leftlabel];
    [self.leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(24*myY6);
        make.left.equalTo(self).with.offset(16*myX6);
    }];
    
    UIImageView *imageview = [[UIImageView alloc] init];
    [imageview sd_setImageWithURL:URL(@"http://wx2.sinaimg.cn/orj360/7ffa58d5ly1gdmb0xkohtj20u02j4qv5.jpg") placeholderImage:ImageName(@"")];
    [self.contentView addSubview:imageview];
    imageview.userInteractionEnabled=YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageClick:)];
    [imageview addGestureRecognizer:tap];

    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(16*myX6);
        make.right.equalTo(self).with.offset(-16*myX6);
        make.top.equalTo(self.leftlabel.mas_bottom).with.offset(16*myY6);
        make.bottom.equalTo(self).with.offset(-16*myY6);
    }];


}
-(void)setHeadviewTitle:(NSString *)title
{
    self.leftlabel.text = title;
}


- (void)tapImageClick:(UITapGestureRecognizer *)tap{
    if (self.tapHandle) {
        self.tapHandle();
    }
}
@end



