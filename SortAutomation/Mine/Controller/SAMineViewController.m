//
//  SAMineViewController.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/10/19.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SAMineViewController.h"
#import "SAMineTableViewCell.h"
#import "SAMineDataManager.h"
#import "SALoginRegisterViewController.h"

@interface SAMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *mainTableView;

@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIImageView *headImageV;
@property (strong, nonatomic) UILabel *nameLab;
@property (strong, nonatomic) UILabel *introduceLab;

@property (strong, nonatomic) NSArray *mineTableArray;


@end

@implementation SAMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSArray *tmpArray = [[NSArray alloc] initWithArray:[SAMineDataManager sharedInstance].minemsgData];
    NSArray *firArray = [[NSArray alloc] initWithArray:[tmpArray firstObject]];
    self.mineTableArray = [[NSArray alloc] initWithArray:firArray];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    [self.mainTableView registerNib:[UINib nibWithNibName:@"SAMineTableViewCell" bundle:nil]forCellReuseIdentifier:@"SAMineTableViewIdentifice"];
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.mainTableView];
    
    
}

-(void)loginAction{
    SALoginRegisterViewController *loginVC = [[SALoginRegisterViewController alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void)loadHeaderSubView{
    self.headImageV = [[UIImageView alloc] init];
    self.headImageV.backgroundColor = [UIColor lightGrayColor];
    [self.headerView addSubview:self.headImageV];
    
    [self.headImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerView.mas_left).offset(10);
        make.width.height.equalTo([NSNumber numberWithInteger:65]);
        make.top.equalTo(self.headerView.mas_top).offset(13);
    }];
    
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    [self.headerView addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageV.mas_left);
        make.right.equalTo(self.headImageV.mas_right);
        make.top.equalTo(self.headImageV.mas_top);
        make.bottom.equalTo(self.headImageV.mas_bottom);
    }];
    
    self.nameLab = [[UILabel alloc] init];
    self.nameLab.textColor = [UIColor whiteColor];
    self.nameLab.font = [UIFont systemFontOfSize:15];
    self.nameLab.text = @"方桌设计工作室";
    [self.headerView addSubview:self.nameLab];
    
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImageV.mas_right).offset(13);
        make.top.equalTo(self.headerView.mas_top).offset(20);
    }];
    
    self.introduceLab = [[UILabel alloc] init];
    self.introduceLab.text = @"介绍下你自己";
    self.introduceLab.textColor = [UIColor whiteColor];
    self.introduceLab.font = [UIFont systemFontOfSize:12];
    [self.headerView addSubview:self.introduceLab];
    
    [self.introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_left).offset(0);
        make.top.equalTo(self.nameLab.mas_bottom).offset(9);
    }];
    
    UIView *firstView = [[UIView alloc] init];
    [self.headerView addSubview:firstView];
    
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerView.mas_left).offset(0);
        make.width.equalTo([NSNumber numberWithInteger:Screen_Width/2]);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.height.equalTo([NSNumber numberWithInteger:80]);
    }];
    
    UILabel *onuseLab = [[UILabel alloc] init];
    onuseLab.text = @"可用积分";
    onuseLab.textColor = [UIColor whiteColor];
    onuseLab.font = [UIFont systemFontOfSize:14];
    [firstView addSubview:onuseLab];
    
    [onuseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(firstView.mas_centerX);
        make.bottom.equalTo(firstView.mas_bottom).offset(-20);
    }];
    
    UILabel *onuseNumLab = [[UILabel alloc] init];
    onuseNumLab.textColor = [UIColor whiteColor];
    onuseNumLab.font = [UIFont systemFontOfSize:14];
    onuseNumLab.text = @"￥500";
    [firstView addSubview:onuseNumLab];
    
    [onuseNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(firstView.mas_centerX);
        make.bottom.equalTo(onuseLab.mas_top).offset(0);
    }];
    
    UIView *SecondView = [[UIView alloc] init];
    [self.headerView addSubview:SecondView];
    
    [SecondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.headerView.mas_right).offset(0);
        make.width.equalTo([NSNumber numberWithInteger:Screen_Width/2]);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(0);
        make.height.equalTo([NSNumber numberWithInteger:80]);
    }];
    
    UILabel *onCountLab = [[UILabel alloc] init];
    onCountLab.text = @"累计积分";
    onCountLab.textColor = [UIColor whiteColor];
    onCountLab.font = [UIFont systemFontOfSize:14];
    [SecondView addSubview:onCountLab];
    
    [onCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(SecondView.mas_centerX);
        make.bottom.equalTo(SecondView.mas_bottom).offset(-20);
    }];
    
    UILabel *onCountNumLab = [[UILabel alloc] init];
    onCountNumLab.textColor = [UIColor whiteColor];
    onCountNumLab.font = [UIFont systemFontOfSize:14];
    onCountNumLab.text = @"100";
    [SecondView addSubview:onCountNumLab];
    
    [onCountNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(SecondView.mas_centerX);
        make.bottom.equalTo(onCountLab.mas_top).offset(0);
    }];
    
}


#pragma mark UITableViewDelegate && UITableViewDataSource
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    [self loadHeaderSubView];
    return self.headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 170.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mineTableArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SAMineTableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"SAMineTableViewIdentifice"];
//    if (cell == nil) {
//        cell = [[SAMineTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SAMineTableViewIdentifice"];
//    }
    
    for (NSDictionary *dic in self.mineTableArray) {
        if ([dic[@"index"] integerValue] == indexPath.row) {
            cell.leftimageView.image = [UIImage imageNamed:dic[@"image"]];
            cell.desLab.text = dic[@"name"];
            break;
        }
    }
    
    return cell;
}

#pragma Getter && Setter
-(UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
    }
    return _mainTableView;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 170)];
        _headerView.backgroundColor = RGBColor(114, 216, 176);
    }
    return _headerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
