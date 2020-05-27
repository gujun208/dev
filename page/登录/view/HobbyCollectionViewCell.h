//
//  HobbyCollectionViewCell.h
//  exhibition
//
//  Created by 古军 on 2020/5/27.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HobbyCollectionViewCell;
@protocol HobbyCellDelegate <NSObject>
- (void)SectionTag:(NSInteger )sectiontag andButton:(UIButton * )sender;
@end

@interface HobbyCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *checkImageView;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UILabel     *hobbytypeName;
@end

NS_ASSUME_NONNULL_END
