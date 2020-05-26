//
//  PPNetWork+home.m
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "PPNetWork+home.h"


@implementation PPNetWork (home)

- (void)GetHomePageData:(NSDictionary *)param successBlock:(void(^)( NSDictionary  *dataDic) )Success Block:(void(^)(NSString *errMessage  , NSError * error))Fail
{
    [self GETUrl:@"method" Params:param successBlock:^(id  _Nonnull responderObject) {
        
        NSError *error ;
        NSDictionary *dic;
        if ([responderObject isKindOfClass:[NSDictionary class]]) {
            dic = responderObject;
        }else
        {
            dic = [NSJSONSerialization JSONObjectWithData:responderObject options:NSJSONReadingMutableContainers error:nil];
        }
        if (!error) {
            if (dic && [[dic objectForKey:@"code"] intValue] == 200  ) {
                if (Success) {
                    Success([dic objectForKey:@"data"]);
                }
            }else
            {
                NSString *errorMessgae ;
                if ([dic objectForKey:@"msg"]) {
                    errorMessgae =[dic objectForKey:@"msg"];
                }else
                {
                    errorMessgae = @"数据格式有误";
                }
                if (Fail) {
                    Fail( errorMessgae ,error);
                }
            }
        }else
        {
            NSString *errorMessage;
            if ([dic objectForKey:@"errorMsg"]) {
                errorMessage =[dic objectForKey:@"errorMsg"];
            }else
            {
                errorMessage = error.localizedDescription;
            }
            if (Fail) {
                Fail( errorMessage ,error);
            }
        }
    } failBlock:^(NSString * _Nonnull errorMessage, NSError * _Nonnull error) {
        if (Fail) {
            Fail( errorMessage ,error);
        }
    }];
}

- (void)PostHomeBannerData:(NSDictionary *)param successBlock:(void(^)( NSDictionary  *dataDic) )Success Block:(void(^)(NSString *errMessage  , NSError * error))Fail
{
    [self POSTUrl:@"" Params:param successBlock:^(id  _Nonnull responderObject) {
        
        NSError *error ;
        NSDictionary *dic;
        if ([responderObject isKindOfClass:[NSDictionary class]]) {
            dic = responderObject;
        }else
        {
            dic = [NSJSONSerialization JSONObjectWithData:responderObject options:NSJSONReadingMutableContainers error:nil];
        }
        if (!error) {
            if (dic && [[dic objectForKey:@"code"] intValue] == 200  ) {
                if (Success) {
                    Success(dic);
                }
            }else
            {
                NSString *errorMessgae ;
                if ([dic objectForKey:@"msg"]) {
                    errorMessgae =[dic objectForKey:@"msg"];
                }else
                {
                    errorMessgae = @"数据格式有误";
                }
                if (Fail) {
                    Fail( errorMessgae ,error);
                }
            }
        }else
        {
            NSString *errorMessage;
            if ([dic objectForKey:@"errorMsg"]) {
                errorMessage =[dic objectForKey:@"errorMsg"];
            }else
            {
                errorMessage = error.localizedDescription;
            }
            if (Fail) {
                Fail( errorMessage ,error);
            }
        }
    } failBlock:^(NSString * _Nonnull errorMessage, NSError * _Nonnull error) {
        if (Fail) {
            Fail( errorMessage ,error);
        }

    }];
}
@end
