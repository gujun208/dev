//
//  ZHUserModel.m
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//

/****************************class description**************************************
这个是用户信息管理类，用于储存用户信息和需要使用用户信息时方便获取。这个类是一个单例，
使用时请使用shareManager进行初始化
**************************************************************************************/

#import "ZHUserModel.h"

#define UserManager_userInfo @"UserManager_userInfo"

@interface ZHUserModel()
@property (nonatomic ,strong) UserModel *userModel;
@end

static ZHUserModel *_userManager;

@implementation ZHUserModel

+ (instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _userManager=[[ZHUserModel alloc]init];
    });
    return _userManager;
}

- (void)saveUserInfo:(NSDictionary *)dict{
    
    NSMutableDictionary *dictData=[[NSMutableDictionary alloc]init];
    if ([[dict allKeys] containsObject:@"userId"]) {
        if ([dict objectForKey:@"userId"]) {
            [dictData setObject:[dict objectForKey:@"userId"] forKey:@"userId"];
        }
    }

    if ([[dict allKeys] containsObject:@"username"]) {
        if (![Tool isNullString:[dict objectForKey:@"username"]]) {
            [dictData setObject:[dict objectForKey:@"username"] forKey:@"username"];
        }
    }

    if ([[dict allKeys] containsObject:@"phone"]) {
        if (![Tool isNullString:[dict objectForKey:@"phone"]]) {
            [dictData setObject:[dict objectForKey:@"phone"] forKey:@"phone"];
        }
    }

}

+ (UserModel *)getUserInfo
{
    if (!_userManager) {
        _userManager=[ZHUserModel shareManager];
    }
    if (!_userManager.userModel) {
        NSDictionary *dict=[[NSUserDefaults standardUserDefaults] objectForKey:UserManager_userInfo];
        _userManager.userModel=[UserModel mj_objectWithKeyValues:dict];
    }
    return _userManager.userModel;

}

@end

@implementation UserModel

+(NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"Id" : @"id"};
    
}
@end
