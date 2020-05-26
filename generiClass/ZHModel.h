//
//  ZHModel.h
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHModel : NSObject

/**
 根据接口返回的字典数据转换为mj模型

 @param dataSource 数据源
 @param prefix 模型前缀名
 @param name 模型名
 */
+ (void)Turn_mdel:(NSDictionary *)dataSource model_prefix:(NSString *)prefix model_name:(NSString *)name;


@end

NS_ASSUME_NONNULL_END
