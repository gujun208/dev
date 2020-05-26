//
//  ZHCustomButton.h
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonType) {
    imageRightType,//图片在右
    imageTopType,//图片在上
};

NS_ASSUME_NONNULL_BEGIN

@interface ZHCustomButton : UIButton
-(id)initWithFrame:(CGRect)frame andButtonType:(ButtonType )type;
@end

NS_ASSUME_NONNULL_END
