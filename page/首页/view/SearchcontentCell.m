//
//  SearchcontentCell.m
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "SearchcontentCell.h"

@implementation SearchcontentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)SearchcontentTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *CellID = @"SearchcontentCellID";
    SearchcontentCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([SearchcontentCell class]) owner:nil options:nil] firstObject];
    }
    return cell;

}
@end
