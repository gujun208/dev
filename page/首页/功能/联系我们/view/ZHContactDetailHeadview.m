//
//  ZHContactDetailHeadview.m
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHContactDetailHeadview.h"

@interface ZHContactDetailHeadview()
@property (nonatomic, strong) UILabel *leftlabel;
@property (nonatomic, strong) UILabel *rightlabel;
@end

@implementation ZHContactDetailHeadview

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
    self.leftlabel.font = [UIFont boldSystemFontOfSize:14*myX6];
    [self.contentView addSubview:self.leftlabel];
    self.leftlabel.text = @"联系人";
    [self.leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(24*myX6);
    }];
    
    self.rightlabel = [[UILabel alloc] init];
    self.rightlabel.textColor = DEFAULBLACKCOLOR;
    self.rightlabel.font = [UIFont boldSystemFontOfSize:14*myX6];
    [self.contentView addSubview:self.rightlabel];
    self.rightlabel.text = @"联系方式";
    [self.rightlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.trailing.equalTo(self).with.offset(-24*myX6);
    }];

    
    
    
}

@end
