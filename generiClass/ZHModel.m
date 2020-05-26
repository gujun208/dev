//
//  ZHModel.m
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHModel.h"

@implementation ZHModel

+ (void)Turn_mdel:(NSDictionary *)dataSource model_prefix:(NSString *)prefix model_name:(NSString *)name
{
    
    [DYModelMaker shareManager].makerType= DYModelMakerTypeMJ;
    
    [DYModelMaker DY_makeModelWithDictionary:dataSource     //数据源
                                modelKeyword:prefix         //模型名称前缀
                                   modelName:name];         //最外层模型名称，会自动加前缀
    
    [DYModelMaker currentInterfaceString];
    [DYModelMaker currentImplementationString];


}

@end
