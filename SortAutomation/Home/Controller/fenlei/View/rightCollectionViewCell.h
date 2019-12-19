//
//  rightCollectionViewCell.h
//  SortAutomation
//
//  Created by ChenEZ on 2019/11/16.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "noHeadRightModel.h"

@interface rightCollectionViewCell : UICollectionViewCell

@property(strong,nonatomic)noHeadRightModel *curNoHeadRightModel;

+(CGSize)ccellSize;

@end
