//
//  SearchcontentCell.h
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchcontentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *content;
+ (instancetype)SearchcontentTableViewCellWithTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
