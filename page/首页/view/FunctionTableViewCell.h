//
//  FunctionTableViewCell.h
//  exhibition
//
//  Created by 古军 on 2020/5/28.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FunctionTableViewCell;
@protocol CollectionSelectDelegate <NSObject>
- (void)didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface FunctionTableViewCell : UITableViewCell
@property (nonatomic ,weak) id <CollectionSelectDelegate> delegate;
@property (nonatomic, strong) UICollectionView *collectionView;

- (void)reloadCollectionData;
@end

NS_ASSUME_NONNULL_END
