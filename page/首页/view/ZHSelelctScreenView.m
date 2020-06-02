//
//  ZHSelelctScreenView.m
//  exhibition
//
//  Created by 古军 on 2020/6/2.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHSelelctScreenView.h"

@interface ZHSelelctScreenView ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation ZHSelelctScreenView

+ (instancetype)searchdataView
{

    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}


@end
