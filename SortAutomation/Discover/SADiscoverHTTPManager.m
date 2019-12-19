//
//  SADiscoverHTTPManager.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/12/14.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SADiscoverHTTPManager.h"

@implementation SADiscoverHTTPManager

+(AFHTTPSessionManager *)shareHttpSessionManager{
    static AFHTTPSessionManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"application/x-www-form-urlencoded", nil];
        manager.requestSerializer.timeoutInterval = 60;
        
        
        NSString *tokenStr = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserToken"];
        NSString * authorization = [NSString stringWithFormat:@"Bearer %@",tokenStr];
        // 设置Authorization的方法设置header
        [manager.requestSerializer setValue:authorization forHTTPHeaderField:@"Authorization"];
        
       
    });
    return manager;
}

+(void)getWithUrl:(NSString *)url params:(NSDictionary *)params complete:(RequestCompleteBlock)completeBlock error:(RequestErrorBlock)errorBlock{
    
    [[SADiscoverHTTPManager shareHttpSessionManager] GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (completeBlock) {
            completeBlock(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

@end
