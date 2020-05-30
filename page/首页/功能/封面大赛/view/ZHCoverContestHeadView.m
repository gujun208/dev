//
//  ZHCoverContestHeadView.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHCoverContestHeadView.h"

@interface ZHCoverContestHeadView()
@property (nonatomic, strong) UILabel *leftlabel;
@end

@implementation ZHCoverContestHeadView


-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self initHeadInfo];
    }
    return self;
}

- (void)initHeadInfo{
    
    self.leftlabel = [[UILabel alloc] init];
    self.leftlabel.textColor = DEFAULIGHTLGREENCOLOR;
    self.leftlabel.font = [UIFont boldSystemFontOfSize:20*myX6];
    [self.contentView addSubview:self.leftlabel];
    [self.leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).with.offset(24*myX6);
    }];
    
}
-(void)setHeadviewTitle:(NSString *)title
{
    self.leftlabel.text = title;
}
@end
