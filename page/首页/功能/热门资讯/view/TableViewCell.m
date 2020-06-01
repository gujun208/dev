//
//  TableViewCell.m
//  exhibition
//
//  Created by 古军 on 2020/6/1.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *CN;

@property (weak, nonatomic) IBOutlet UILabel *score;
@property (weak, nonatomic) IBOutlet UILabel *links;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(linksClick:)];
    [self.links addGestureRecognizer:tap];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark 超链接
- (void)linksClick:(UITapGestureRecognizer *)tap{


}



@end
