//
//  SAMineDataManager.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/10/19.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SAMineDataManager.h"

@implementation SAMineDataManager

+ (SAMineDataManager *)sharedInstance
{
    static SAMineDataManager *shareManage;
    @synchronized(self) {
        if (!shareManage)
            shareManage = [[self alloc] init];
    }
    return shareManage;
}

- (NSArray *)minemsgData{
    
    NSArray *mineArray;
    
    NSDictionary *mineDic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"mineMsg" ofType:@".plist"]];
    
    mineArray = [mineDic allValues];
    
    return mineArray;
    
}

@end
