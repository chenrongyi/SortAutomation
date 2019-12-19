//
//  SADisDataManager.h
//  SortAutomation
//
//  Created by ChenEZ on 2019/12/14.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SADisDataManager : NSObject

@property (strong, nonatomic) NSArray *homeViewDataArray;

+ (SADisDataManager *)shareInstance;

-(void)loadViewData;

@end
