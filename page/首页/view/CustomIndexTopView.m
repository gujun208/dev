//
//  CustomIndexTopView.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "CustomIndexTopView.h"
#import "functionItem.h"

@interface CustomIndexTopView (){
    NSInteger ItemW;
}
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

#define ItemH self.contentView.frame.size.height/2

@implementation CustomIndexTopView

- (instancetype)initViewWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil][0];
        self.contentView.frame = frame;
        ItemW = frame.size.width/5;
        
    }
    return self;
}

- (void)CustomBannervalue:(NSArray *)array
{
    for (int i=0; i<array.count; i++) {
        CGRect rect;
        if (i<=4) {
            rect = CGRectMake(i*ItemW, 0, ItemW, ItemH);
        }else{
            rect = CGRectMake((i-5)*ItemW, ItemH, ItemW, ItemH);
        }
        functionItem *item = [[functionItem alloc] initViewWithFrame:rect];
//        item.backgroundColor = [UIColor redColor];
        item.icon.image = ImageName(@"icon_home_apply");
        item.title.text = [NSString stringWithFormat:@"测试%@",array[i]];
      
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
