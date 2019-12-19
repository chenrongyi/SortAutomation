//
//  SADisDataManager.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/12/14.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SADisDataManager.h"
#import "SADiscoverHTTPManager.h"

@implementation SADisDataManager

+ (SADisDataManager *)shareInstance{
    static SADisDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[SADisDataManager alloc] init];
        }
    });
    
    return manager;
}

- (instancetype)init{
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)loadViewData{
    
    NSString *url = @"http://cyzkapi.owmao.com/admin/Article/getCateList";
    
//    dispatch_semaphore_t signal = dispatch_semaphore_create(0);
    __block NSArray *dataArray = [[NSArray alloc] init];
    
    
    [SADiscoverHTTPManager getWithUrl:url params:@{} complete:^(id response) {
        NSLog(@"请求Dis成功");
        
        if ([response isKindOfClass:[NSDictionary class]]) {
            if (response[@"code"] && [response[@"code"] integerValue] == 200) {
                if (response[@"data"] && [response[@"data"] isKindOfClass:[NSDictionary class]] && response[@"data"][@"total"]) {
                    
                    self.homeViewDataArray = response[@"data"][@"data"];
//                    dispatch_semaphore_signal(signal);
                }else{
//                    dispatch_semaphore_signal(signal);
                    //                    return @[];
                }
            }else{
//                dispatch_semaphore_signal(signal);
            }
        }
        
    } error:^(NSError *error) {
        NSLog(@"请求Dic失败");
        
//        dispatch_semaphore_signal(signal);
    }];
    
    // 等待执行的方法返回值
    
//    dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
    
//    return dataArray;
}

-(NSArray *)homeViewDataArray{
    if (!_homeViewDataArray) {
        _homeViewDataArray = [[NSMutableArray alloc] init];
    }
    return _homeViewDataArray;
}

@end
