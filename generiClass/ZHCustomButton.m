//
//  ZHCustomButton.m
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHCustomButton.h"

@interface ZHCustomButton(){
    ButtonType _type;
}

@end

@implementation ZHCustomButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_type==imageTopType) {
        CGRect titleLabelFrame = self.titleLabel.frame;
        CGRect imageViewFrame = self.imageView.frame;

        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;

        titleLabelFrame.origin.x = (self.frame.size.width - titleLabelFrame.size.width)/2;
        titleLabelFrame.origin.y = self.frame.size.height * 0.6;
        self.titleLabel.frame = titleLabelFrame;

        if (titleLabelFrame.size.width < imageViewFrame.size.width) {
            imageViewFrame.origin.x = imageViewFrame.origin.x;
        }else{
            imageViewFrame.origin.x = titleLabelFrame.origin.x + (titleLabelFrame.size.width - imageViewFrame.size.width)/2;
        }
        imageViewFrame.origin.y -=4;
        self.imageView.frame = imageViewFrame;

    }else{
        /** 修改 title 的 frame */
        CGRect imageViewFrame = self.imageView.frame;
        CGRect titleLabelFrame = self.titleLabel.frame;

        titleLabelFrame.origin.x = (self.frame.size.width - titleLabelFrame.size.width - imageViewFrame.size.width)/2;;
        self.titleLabel.frame = titleLabelFrame;
        
        imageViewFrame.origin.x = titleLabelFrame.origin.x + titleLabelFrame.size.width+4;//titleLabelFrame.size.width+4;
        self.imageView.frame = imageViewFrame;
    }
}

-(id)initWithFrame:(CGRect)frame andButtonType:(ButtonType )type
{
    if (self=[super initWithFrame:frame]) {
        _type = type;
    }
    return self;
}

@end
