//
//  SAHomeViewController.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/11/11.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SAHomeViewController.h"
#import "SAShaoMaViewController.h"

@interface SAHomeViewController ()

@end

@implementation SAHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    CAGradientLayer *layer = [CAGradientLayer new];
//    //colors存放渐变的颜色的数组
//    layer.colors=@[(__bridge id)RGBColor(96, 235, 170).CGColor,(__bridge id)RGBColor(69, 184, 202).CGColor];
//    /**
//     * 起点和终点表示的坐标系位置，(0,0)表示左上角，(1,1)表示右下角
//     */
//    layer.startPoint = CGPointMake(0.5, 0);
//    layer.endPoint = CGPointMake(0.5, 1);
//    layer.frame = self.view.bounds;
//    [self.view.layer addSublayer:layer];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
}
- (IBAction)shaomaAction:(id)sender {
    SAShaoMaViewController *shaoVC = [[SAShaoMaViewController alloc] init];
    [self.navigationController pushViewController:shaoVC animated:YES];
}
- (IBAction)fenleiAcyion:(id)sender {
    
}
- (IBAction)toufangAction:(id)sender {
}
- (IBAction)yuyueAction:(id)sender {
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
