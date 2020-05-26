//
//  PPNetWork+home.h
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//


#import "PPNetWork.h"

NS_ASSUME_NONNULL_BEGIN

@interface PPNetWork (home)

/**
 获取首页数据
*/
- (void)GetHomePageData:(NSDictionary *)param successBlock:(void(^)( NSDictionary  *dataDic) )Success Block:(void(^)(NSString *errMessage  , NSError * error))Fail;

- (void)PostHomeBannerData:(NSDictionary *)param successBlock:(void(^)( NSDictionary  *dataDic) )Success Block:(void(^)(NSString *errMessage  , NSError * error))Fail;


@end

NS_ASSUME_NONNULL_END
