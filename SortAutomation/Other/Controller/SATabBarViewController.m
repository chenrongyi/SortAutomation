//
//  SATabBarViewController.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/10/19.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SATabBarViewController.h"
#import "SAHomeViewController.h"
#import "SADiscoverViewController.h"
#import "SAShopViewController.h"
#import "SAMineViewController.h"

@interface SATabBarViewController ()

@end

@implementation SATabBarViewController

+ (void)initialize
{
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加子控制器
    [self setupChildVc:[[SAHomeViewController alloc] init] title:@"首页" image:@"icon_home" selectedImage:@"icon_home_sel"];
    
    [self setupChildVc:[[SAShopViewController alloc] init] title:@"商城" image:@"icon_shop" selectedImage:@"icon_shop_sel"];

    [self setupChildVc:[[SADiscoverViewController alloc] init] title:@"发现" image:@"icon_dis" selectedImage:@"icon_dis_sel"];
    
    [self setupChildVc:[[SAMineViewController alloc] init] title:@"我的" image:@"icon_mine" selectedImage:@"icon_mine_sel"];
//
//    [self setupChildVc:[[CPFMeController alloc] initWithStyle:UITableViewStyleGrouped] title:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    // 更换tabBar
//    [self setValue:[[CPFTabBar alloc] init] forKeyPath:@"tabBar"];
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    
    UIImage *selImage = [UIImage imageNamed:selectedImage];
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = selImage;
    
    
    NSDictionary *dictHome = [NSDictionary dictionaryWithObject:RGBColor(114, 216, 176) forKey:NSForegroundColorAttributeName];
    [vc.tabBarItem setTitleTextAttributes:dictHome forState:UIControlStateSelected];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    SANavigationController *nav = [[SANavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
