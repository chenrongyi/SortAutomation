//
//  SAFenleiViewController.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/11/16.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SAFenleiViewController.h"
#import "menuTableViewController.h"

@interface SAFenleiViewController ()

@end

@implementation SAFenleiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 4;
}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    switch (index) {
        case 0: return @"可回收物";
        case 1: return @"厨余垃圾";
        case 2: return @"其他垃圾";
        case 3: return @"有害垃圾";
    }
    return @"NONE";
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
//    switch (index % 3) {
//        case 0: return [[WMTableViewController alloc] init];
//        case 1: return [[WMViewController alloc] init];
//        case 2: return [[WMCollectionViewController alloc] init];
//    }
    return [[menuTableViewController alloc] init];
}

- (UIColor *)colorForState:(WMMenuItemState)state atIndex:(NSInteger)index{
    return SAGlobalBg;
}


- (CGFloat)menuView:(WMMenuView *)menu widthForItemAtIndex:(NSInteger)index {
    CGFloat width = [super menuView:menu widthForItemAtIndex:index];
    return width + 20;
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
  
    CGFloat leftMargin = self.showOnNavigationBar ? 50 : 0;
    CGFloat originY = self.showOnNavigationBar ? 0 : CGRectGetMaxY(self.navigationController.navigationBar.frame);
    return CGRectMake(leftMargin, originY, self.view.frame.size.width - 2*leftMargin, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
   
    CGFloat originY = CGRectGetMaxY([self pageController:pageController preferredFrameForMenuView:self.menuView]);

    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height - originY);
}

@end
