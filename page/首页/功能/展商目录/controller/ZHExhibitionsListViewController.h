//
//  ZHExhibitionsListViewController.h
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "RootViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ExhibitionType) {
    ExhibitionList,
    ExhibitionProduct,
};

@interface ZHExhibitionsListViewController : RootViewController
@property (nonatomic, assign) ExhibitionType type;
@end

NS_ASSUME_NONNULL_END
