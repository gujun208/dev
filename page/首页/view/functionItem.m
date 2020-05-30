//
//  functionItem.m
//  exhibition
//
//  Created by 古军 on 2020/5/30.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "functionItem.h"

@implementation functionItem

+ (instancetype)itemView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
@end
