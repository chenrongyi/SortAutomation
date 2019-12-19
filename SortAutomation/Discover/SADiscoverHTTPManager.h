//
//  SADiscoverHTTPManager.h
//  SortAutomation
//
//  Created by ChenEZ on 2019/12/14.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^RequestCompleteBlock)(id response);
typedef void (^RequestErrorBlock)(NSError *error);

@interface SADiscoverHTTPManager : NSObject

/**
 get请求
 
 @param url 接口地址
 @param params 入参
 @param completeBlock 成功回调
 @param errorBlock 失败回调
 */
+(void)getWithUrl:(NSString *)url
           params:(NSDictionary *)params
         complete:(RequestCompleteBlock)completeBlock
            error:(RequestErrorBlock)errorBlock;

@end
