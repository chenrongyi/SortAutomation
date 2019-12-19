//
//  leftTableCell.h
//  SortAutomation
//
//  Created by ChenEZ on 2019/11/16.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "leftTagModel.h"

@interface leftTableCell : UITableViewCell

@property(strong,nonatomic)leftTagModel *curLeftTagModel;
//是否被选中
@property(assign,nonatomic)BOOL hasBeenSelected;

@end
