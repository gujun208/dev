//
//  ZHUserModel.h
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UserModel;

@interface ZHUserModel : NSObject

+ (instancetype)shareManager;

/***
 * 保存用户信息
 * @param dict  用户信息字典
 */
- (void)saveUserInfo:(NSDictionary *)dict;

/***
 * 获取用户信息
 * @return UserManagerModel用户信息model
 */
+ (UserModel *)getUserInfo;

@end

@interface UserModel : NSObject
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *username;
@end

NS_ASSUME_NONNULL_END
