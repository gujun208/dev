//
//  HobbyCollectionViewCell.m
//  exhibition
//
//  Created by 古军 on 2020/5/27.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "HobbyCollectionViewCell.h"

@implementation HobbyCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    self.layer.masksToBounds=YES;
    self.layer.cornerRadius = 16;
    
    self.bgImageView = [[UIImageView alloc] init];
    self.bgImageView.image = ImageName(@"hobby");
    [self.contentView addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];

    self.hobbytypeName = [[UILabel alloc] init];
    self.hobbytypeName.font = font14;
    self.hobbytypeName.numberOfLines = 0;
    self.hobbytypeName.text = @"搞笑动漫";
    self.hobbytypeName.textColor = NAVCOLOR;
    self.hobbytypeName.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.hobbytypeName];
    [self.hobbytypeName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
    }];
    
    self.checkImageView = [[UIImageView alloc] init];
    self.checkImageView.image = ImageName(@"icon_signup_interesting_normal");
    [self.contentView addSubview:self.checkImageView];
    [self.checkImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(20, 20));
        make.top.equalTo(self).with.offset(5);
        make.trailing.equalTo(self).with.offset(-5);

    }];

}
@end
