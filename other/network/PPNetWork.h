//
//  PPNetWork.h
//  JXB
//
//  Created by 奔哥 on 2019/1/5.
//  Copyright © 2019 ijovo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "PPNetworkHelper.h"
NS_ASSUME_NONNULL_BEGIN

@interface PPNetWork : NSObject

- (void)GETUrl:(NSString *)url
                                 Params:( id )params
                           successBlock:(void(^)(id responderObject))success
                              failBlock:(void(^)( NSString *errorMessage  , NSError *error ))fail;

- (void)POSTUrl:(NSString *)url
                                  Params:( id )params
                            successBlock:(void(^)(id responderObject))success
                               failBlock:(void(^)( NSString *errorMessage  , NSError *error ))fail;

+(PPNetWork *)manage;


@end

NS_ASSUME_NONNULL_END
