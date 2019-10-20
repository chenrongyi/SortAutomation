//
//  SAForgetpwdViewController.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/10/20.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SAForgetpwdViewController.h"
#import "UIButton+CountDown.h"

@interface SAForgetpwdViewController ()

@property (strong, nonatomic) UITextField *telTextField;
@property (strong, nonatomic) UITextField *codeTextField;
@property (strong, nonatomic) UITextField *pwdTextField;
@property (strong, nonatomic) UITextField *repwdTextField;
@property (strong, nonatomic) UIButton *getCodeBtn;

@end

@implementation SAForgetpwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *topGrayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 10)];
    topGrayView.backgroundColor = RGBColor(248, 248, 248);
    [self.view addSubview:topGrayView];
    
    [self loadSubView];
}

- (void)loadSubView{
    
    UILabel *topLab = [[UILabel alloc] init];
    topLab.backgroundColor = RGBColor(229, 229, 229);
    [self.view addSubview:topLab];
    
    [topLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(22);
        make.right.equalTo(self.view.mas_right).offset(-22);
        make.height.equalTo([NSNumber numberWithInteger:1]);
        make.top.equalTo(self.view.mas_top).offset(65);
    }];
    
    UIImageView *telImageV = [[UIImageView alloc] init];
    telImageV.image = [UIImage imageNamed:@"icon_tel"];
    [self.view addSubview:telImageV];
    
    [telImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topLab.mas_left);
        make.height.width.equalTo([NSNumber numberWithInteger:14]);
        make.bottom.equalTo(topLab.mas_top).offset(-18);
    }];
    
    self.telTextField = [[UITextField alloc] init];
    self.telTextField.placeholder = @"请输入手机号码";
    self.telTextField.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.telTextField];
    
    [self.telTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(telImageV.mas_right).offset(8);
        make.centerY.equalTo(telImageV.mas_centerY);
        make.height.equalTo([NSNumber numberWithInteger:21]);
        make.right.equalTo(topLab.mas_right);
    }];
    
    UILabel *secLab = [[UILabel alloc] init];
    secLab.backgroundColor = RGBColor(229, 229, 229);
    [self.view addSubview:secLab];
    
    [secLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(22);
        make.right.equalTo(self.view.mas_right).offset(-22);
        make.height.equalTo([NSNumber numberWithInteger:1]);
        make.top.equalTo(topLab.mas_bottom).offset(65);
    }];
    
    UIImageView *codeImageV = [[UIImageView alloc] init];
    codeImageV.image = [UIImage imageNamed:@"icon_code"];
    [self.view addSubview:codeImageV];
    
    [codeImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(secLab.mas_left);
        make.height.width.equalTo([NSNumber numberWithInteger:14]);
        make.bottom.equalTo(secLab.mas_top).offset(-18);
    }];
    
    self.getCodeBtn = [[UIButton alloc] init];
    [self.getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.getCodeBtn setTitleColor:SAGlobalBg forState:UIControlStateNormal];
    [self.getCodeBtn addTarget:self action:@selector(getCodeAction) forControlEvents:UIControlEventTouchUpInside];
    self.getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.getCodeBtn.layer.cornerRadius = 15;
    self.getCodeBtn.layer.borderColor = SAGlobalBg.CGColor;
    self.getCodeBtn.layer.borderWidth = 1;
    self.getCodeBtn.layer.masksToBounds = YES;
    [self.view addSubview:self.getCodeBtn];
    
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(secLab.mas_right);
        make.height.equalTo([NSNumber numberWithInteger:30]);
        make.width.equalTo([NSNumber numberWithInteger:90]);
        make.centerY.equalTo(codeImageV.mas_centerY);
    }];
    
    self.codeTextField = [[UITextField alloc] init];
    self.codeTextField.placeholder = @"请输入验证码";
    self.codeTextField.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.codeTextField];
    
    [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeImageV.mas_right).offset(8);
        make.centerY.equalTo(codeImageV.mas_centerY);
        make.height.equalTo([NSNumber numberWithInteger:21]);
        make.right.equalTo(self.getCodeBtn.mas_left).offset(-10);
    }];
    
    UILabel *threeLab = [[UILabel alloc] init];
    threeLab.backgroundColor = Gray(229);
    [self.view addSubview:threeLab];
    [threeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(22);
        make.right.equalTo(self.view.mas_right).offset(-22);
        make.height.equalTo([NSNumber numberWithInteger:1]);
        make.top.equalTo(secLab.mas_top).offset(65);
    }];
    
    UIImageView *pwdImageV = [[UIImageView alloc] init];
    pwdImageV.image = [UIImage imageNamed:@"icon_pwd"];
    [self.view addSubview:pwdImageV];
    
    [pwdImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(threeLab.mas_left);
        make.height.width.equalTo([NSNumber numberWithInteger:14]);
        make.bottom.equalTo(threeLab.mas_top).offset(-18);
    }];
    
    self.pwdTextField = [[UITextField alloc] init];
    self.pwdTextField.placeholder = @"请输入新密码";
    self.pwdTextField.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.pwdTextField];
    
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pwdImageV.mas_right).offset(8);
        make.centerY.equalTo(pwdImageV.mas_centerY);
        make.height.equalTo([NSNumber numberWithInteger:21]);
        make.right.equalTo(threeLab.mas_right);
    }];
    
    UILabel *fourLab = [[UILabel alloc] init];
    fourLab.backgroundColor = Gray(229);
    [self.view addSubview:fourLab];
    [fourLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(22);
        make.right.equalTo(self.view.mas_right).offset(-22);
        make.height.equalTo([NSNumber numberWithInteger:1]);
        make.top.equalTo(threeLab.mas_top).offset(65);
    }];
    
    UIImageView *repwdImageV = [[UIImageView alloc] init];
    repwdImageV.image = [UIImage imageNamed:@"icon_pwd"];
    [self.view addSubview:repwdImageV];
    
    [repwdImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(fourLab.mas_left);
        make.height.width.equalTo([NSNumber numberWithInteger:14]);
        make.bottom.equalTo(fourLab.mas_top).offset(-18);
    }];
    
    self.pwdTextField = [[UITextField alloc] init];
    self.pwdTextField.placeholder = @"请再次输入新密码";
    self.pwdTextField.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:self.pwdTextField];
    
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(repwdImageV.mas_right).offset(8);
        make.centerY.equalTo(repwdImageV.mas_centerY);
        make.height.equalTo([NSNumber numberWithInteger:21]);
        make.right.equalTo(fourLab.mas_right);
    }];
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setBackgroundColor:SAGlobalBg];
    [loginBtn setTitle:@"保存" forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 25;
    loginBtn.layer.masksToBounds = YES;
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(27);
        make.right.equalTo(self.view.mas_right).offset(-27);
        make.height.equalTo(Number(44));
        make.top.equalTo(fourLab.mas_bottom).offset(50);
    }];
    
}

- (void)getCodeAction{
    [self.getCodeBtn countDownFromTime:60 title:@"重获验证码" unitTitle:@"S" mainColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0] countColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0]];
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
