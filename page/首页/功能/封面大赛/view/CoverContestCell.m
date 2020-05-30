//
//  CoverContestCell.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "CoverContestCell.h"

@interface CoverContestCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageview;
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *item1;
@property (weak, nonatomic) IBOutlet UILabel *item2;

@property (weak, nonatomic) IBOutlet UIButton *votetype;

@end


@implementation CoverContestCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)ClickVote:(UIButton *)sender {
    
}


@end
