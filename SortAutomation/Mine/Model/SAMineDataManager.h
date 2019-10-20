//
//  SAMineDataManager.h
//  SortAutomation
//
//  Created by ChenEZ on 2019/10/19.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAMineDataManager : NSObject

+ (SAMineDataManager *)sharedInstance;

- (NSArray *)minemsgData;

@end
