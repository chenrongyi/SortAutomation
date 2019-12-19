//
//  SADisPageViewController.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/12/14.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SADisPageViewController.h"
#import "SADisTableViewCell.h"

@interface SADisPageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *disTableView;

@end

@implementation SADisPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark UITableViewDelegate && UITableVIewDataSource

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.gameHackDataArray.count;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 85;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    NSDictionary *indexDic = [self.gameHackDataArray objectAtIndex:indexPath.row];
//    
//    SADisTableViewCell *cell = [self.gameHackTableView dequeueReusableCellWithIdentifier:@"PHGameHomeViewCellIdentify"];
//    if(cell == nil)
//    {
//        NSArray * nib = [[NSBundle mainBundle] loadNibNamed:@"SADisTableViewCell" owner:self options:nil];
//        cell = [nib objectAtIndex:0];
//    }
//    return cell;
//    
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSDictionary *indexDic = [self.gameHackDataArray objectAtIndex:indexPath.row];
//    PHDetailViewController *detailVC = [[PHDetailViewController alloc] init];
//    [detailVC setValue:[indexDic objectForKey:@"appleid"] forKey:@"appleid"];
//    [detailVC setValue:indexDic forKey:@"appDic"];
//    [self.navigationController pushViewController:detailVC animated:YES];
}

#pragma mark ========= init ========
- (UITableView *)disTableView{
    if (!_disTableView) {
        _disTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - 64)];
        _disTableView.delegate = self;
        _disTableView.dataSource = self;
        _disTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _disTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _disTableView;
}
@end
