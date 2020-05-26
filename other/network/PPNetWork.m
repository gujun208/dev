//
//  PPNetWork.m
//  JXB
//
//  Created by 奔哥 on 2019/1/5.
//  Copyright © 2019 ijovo. All rights reserved.
//

#import "PPNetWork.h"

@implementation PPNetWork

- (void)GETUrl:(NSString *)url
        Params:( id )params
  successBlock:(void(^)(id responderObject))success
     failBlock:(void(^)( NSString *errorMessage  , NSError *error ))fail{
    NSString *URL = [HOST stringByAppendingString:url];
   
    NSString * token =  [[NSUserDefaults standardUserDefaults] objectForKey:TOKEN];
    [PPNetworkHelper openNetworkActivityIndicator:YES];
    
    [PPNetworkHelper setAFHTTPSessionManagerProperty:^(AFHTTPSessionManager *sessionManager) {
        
        sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        sessionManager.responseSerializer= [AFHTTPResponseSerializer serializer];
        
        sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        sessionManager.securityPolicy.validatesDomainName= NO;
        sessionManager.securityPolicy.allowInvalidCertificates=YES;
        
        [sessionManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain",@"charset=UTF-8",nil]];
        
//        [sessionManager.requestSerializer setValue:@"<Application Id>" forHTTPHeaderField:@"X-Parse-Application-Id"];
//        [sessionManager.requestSerializer setValue:@"<API Key>" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
        [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:URL parameters:params error:nil];
        
        //        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        //        NSData *body = [[JXBTools WL_ConvertToJSONData:params] dataUsingEncoding:NSUTF8StringEncoding];
        //
        //        [request setHTTPBody:body];
        [request setValue:token forHTTPHeaderField:TOKEN];
        
        NSLog(@"请求的URL:%@",request.URL);
        ///发起请求
        [[sessionManager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            
            NSDictionary *dic;
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                dic = responseObject;
            }else
            {
                if (responseObject) {
                    dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
                }
            }
            
            if (!error) {
                if (dic) {
                    
                    if (success) {
                        if ([dic objectForKey:@"data"]) {
                            success(dic);
                        }
                        
                    }
                }
            }else
            {
                if ([[dic objectForKey:@"code"] isEqualToString:@"406"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"TOKENOUTOFDATA" object:@{@"type":@"0"}];
                    return ;
                }
                if ([[dic objectForKey:@"code"] isEqualToString:@"423"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"TOKENOUTOFDATA" object:@{@"type":@"1"}];
                    return ;
                }
                NSString *errorMessage = error.localizedDescription;
                if (fail) {
                    if (dic==nil) {
                        fail( errorMessage ,error);
                    }else if (![Tool isNullString:[dic objectForKey:@"message"]]){
                        fail( [dic objectForKey:@"message"] ,error);
                        
                    }else if ([dic objectForKey:@"msg"]){
                        fail( [dic objectForKey:@"msg"] ,error);
                    }else{
                        fail( [dic objectForKey:@"errorMsg"] ,error);
                    }
                    
                }
                
            }
            
        }] resume];
        
    }];
}

- (void)POSTUrl:(NSString *)url
         Params:( id )params
   successBlock:(void(^)(id responderObject))success
      failBlock:(void(^)( NSString *errorMessage  , NSError *error ))fail{
    
    NSString *URL = [HOST stringByAppendingString:url];
    NSString * token = [[NSUserDefaults standardUserDefaults] objectForKey:TOKEN];
    [PPNetworkHelper setRequestTimeoutInterval:15];
    [PPNetworkHelper openNetworkActivityIndicator:YES];
    
    [PPNetworkHelper setAFHTTPSessionManagerProperty:^(AFHTTPSessionManager *sessionManager) {
        
        sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        sessionManager.responseSerializer= [AFHTTPResponseSerializer serializer];
        
        sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
        sessionManager.securityPolicy.validatesDomainName= NO;
        sessionManager.securityPolicy.allowInvalidCertificates=YES;
        [sessionManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",@"text/json", @"text/javascript",@"text/html",@"text/plain",nil]];
        
        //        [sessionManager.requestSerializer setValue:@"<Application Id>" forHTTPHeaderField:@"X-Parse-Application-Id"];
        //        [sessionManager.requestSerializer setValue:@"<API Key>" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
        [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:URL parameters:params error:nil];
        
        //        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //        NSData *body = [[JXBTools WL_ConvertToJSONData:params] dataUsingEncoding:NSUTF8StringEncoding];
        //
        //        [request setHTTPBody:body];
        [request setValue:token forHTTPHeaderField:TOKEN];
        
        NSLog(@"请求的URL:%@",request.URL);
        ///发起请求
        [[sessionManager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
            
            NSDictionary *dic;
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                dic = responseObject;
            }else
            {
                if (responseObject) {
                    dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
                }
            }
            
            if (error) {
                if ([[dic objectForKey:@"code"] isEqualToString:@"406"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"TOKENOUTOFDATA" object:@{@"type":@"0"}];
                    return ;
                }
                if ([[dic objectForKey:@"code"] isEqualToString:@"423"]) {
                    [[NSNotificationCenter defaultCenter] postNotificationName:@"TOKENOUTOFDATA" object:@{@"type":@"1"}];
                    return ;
                }
                NSString *errorMessage = error.localizedDescription;
                
                if (fail) {
                    if (dic==nil) {
                        fail( errorMessage ,error);
                    }else if (![Tool isNullString:[dic objectForKey:@"message"]]){
                        fail( [dic objectForKey:@"message"] ,error);
                    }else if ([dic objectForKey:@"errorMsg"]){
                        fail( [dic objectForKey:@"msg"] ,error);
                    }
                    else{
                        fail( [dic objectForKey:@"errorMsg"] ,error);
                    }
                }
            }else{
                success(dic);
            }
        }] resume];
        
    }];
}


static PPNetWork* _PPManager;

+ (PPNetWork *)manage
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _PPManager=[[PPNetWork alloc] init];
    });
    
    return _PPManager;
}

@end
