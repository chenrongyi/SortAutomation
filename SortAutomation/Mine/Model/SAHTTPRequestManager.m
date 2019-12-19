//
//  SAHTTPRequestManager.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/12/14.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SAHTTPRequestManager.h"

@implementation SAHTTPRequestManager

+(AFHTTPSessionManager *)shareHttpSessionManager{
    static AFHTTPSessionManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
        manager.requestSerializer.timeoutInterval = 60;
    });
    return manager;
}

+(void)getWithUrl:(NSString *)url params:(NSDictionary *)params complete:(RequestCompleteBlock)completeBlock error:(RequestErrorBlock)errorBlock{
    
    [[SAHTTPRequestManager shareHttpSessionManager] GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
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

+(void)postWithUrl:(NSString *)url params:(NSDictionary *)params complete:(RequestCompleteBlock)completeBlock error:(RequestErrorBlock)errorBlock{
    
    
    
    
    [[SAHTTPRequestManager shareHttpSessionManager] POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
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
