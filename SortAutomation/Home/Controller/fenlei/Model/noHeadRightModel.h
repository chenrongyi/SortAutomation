//
//  noHeadRightModel.h
//  SortAutomation
//
//  Created by ChenEZ on 2019/11/16.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface noHeadRightModel : NSObject

//实体leftTageModel中的主键值
@property(assign,nonatomic)long tagID;

@property(assign,nonatomic)long roomID;
@property(copy,nonatomic)NSString *roomName;
@property(copy,nonatomic)NSString *roomImageUrl;

@end
