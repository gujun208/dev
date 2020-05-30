//
//  CustomIndexTopView.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "CustomIndexTopView.h"
#import "functionItem.h"

@interface CustomIndexTopView ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

#define ItemW (SCREEN_WIDTH - 20*myX6)/5
#define ItemH 80

@implementation CustomIndexTopView

+ (instancetype)customBannerView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)CustomBannervalue:(NSArray *)array
{
    for (int i=0; i<array.count; i++) {
        
        functionItem *item = [functionItem itemView];
        item.icon.image = ImageName(@"icon_home_apply");
        item.title.text = [NSString stringWithFormat:@"测试%@",array[i]];
        if (i<=4) {
            item.frame = CGRectMake(i*ItemW, 0, ItemW, ItemH);
        }else{
            item.frame = CGRectMake((i-5)*ItemW, ItemH, ItemW, ItemH);
        }
        item.tapEvent.tag = [array[i] intValue];
        [item.tapEvent addTarget:self action:@selector(itemTap:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:item];
        
    }
}
- (void)itemTap:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(TapItemEvent:)]) {
        [self.delegate TapItemEvent:sender.tag];
    }
}
@end
