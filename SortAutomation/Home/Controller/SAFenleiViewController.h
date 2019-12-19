//
//  SAFenleiViewController.h
//  SortAutomation
//
//  Created by ChenEZ on 2019/11/16.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMPageController.h"

typedef NS_ENUM(NSUInteger, WMMenuViewPosition) {
    WMMenuViewPositionDefault,
    WMMenuViewPositionBottom,
};

@interface SAFenleiViewController : WMPageController

@property (nonatomic, assign) WMMenuViewPosition menuViewPosition;

@end
