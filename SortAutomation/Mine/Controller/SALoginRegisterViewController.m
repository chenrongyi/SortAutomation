//
//  SALoginRegisterViewController.m
//  SortAutomation
//
//  Created by ChenEZ on 2019/10/19.
//  Copyright © 2019年 ceshi. All rights reserved.
//

#import "SALoginRegisterViewController.h"
#import "UIButton+CountDown.h"
#import "SAForgetpwdViewController.h"

@interface SALoginRegisterViewController ()

@property (strong, nonatomic) UILabel *loginLabel;
@property (strong, nonatomic) UILabel *registerLabel;
@property (strong, nonatomic) UILabel *loginSelLab;
@property (strong, nonatomic) UILabel *registerSelLab;

@property (strong, nonatomic) UITextField *telTextField;
@property (strong, nonatomic) UITextField *codeTextField;
@property (strong, nonatomic) UITextField *pwdTextField;
@property (strong, nonatomic) UIButton *getCodeBtn;

@property (strong, nonatomic) UIView *registerBottomView;
@property (strong, nonatomic) UIButton *pwdLoginBtn;
@property (strong, nonatomic) UIButton *forgetpwdBtn;

@end

@implementation SALoginRegisterViewController{
    BOOL selectPwd;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录/注册";
    self.navigationController.navigationBar.translucent=NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *topGrayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 10)];
    topGrayView.backgroundColor = RGBColor(248, 248, 248);
    [self.view addSubview:topGrayView];
    
    [self loadSubView];
}

-(void)loadSubView{
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 10, Screen_Width, 125)];
    [self.view addSubview:headView];
    
    self.loginLabel = [[UILabel alloc] init];
    self.loginLabel.text = @"登录";
    self.loginLabel.textColor = SAGlobalBg;
    self.loginLabel.font = [UIFont fontWithName:@"PingFangSC" size:18];
    self.loginLabel.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:self.loginLabel];
    
    [self.loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView.mas_left);
        make.width.equalTo([NSNumber numberWithInteger:Screen_Width/2]);
        make.centerY.equalTo(headView.mas_centerY);
    }];
    
    self.loginSelLab = [[UILabel alloc] init];
    self.loginSelLab.backgroundColor = SAGlobalBg;
    self.loginSelLab.layer.cornerRadius = 1.3;
    self.loginSelLab.layer.masksToBounds = YES;
    [headView addSubview:self.loginSelLab];
    
    [self.loginSelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.loginLabel.mas_centerX);
        make.width.equalTo([NSNumber numberWithInteger:24]);
        make.height.equalTo([NSNumber numberWithInteger:3]);
        make.top.equalTo(self.loginLabel.mas_bottom).offset(6);
    }];
    
    UIButton *loginTopButton = [[UIButton alloc] init];
    [loginTopButton addTarget:self action:@selector(loginTopAction) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:loginTopButton];
    [loginTopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.loginLabel.mas_centerX);
        make.centerY.equalTo(self.loginLabel.mas_centerY);
        make.height.equalTo(Number(30));
        make.width.equalTo(Number(60));
    }];
    
    self.registerLabel = [[UILabel alloc] init];
    self.registerLabel.text = @"注册";
    self.registerLabel.textColor = [UIColor blackColor];
    self.registerLabel.font = [UIFont fontWithName:@"PingFangSC" size:18];
    self.registerLabel.textAlignment = NSTextAlignmentCenter;
    [headView addSubview:self.registerLabel];
    
    [self.registerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headView.mas_right);
        make.width.equalTo([NSNumber numberWithInteger:Screen_Width/2]);
        make.centerY.equalTo(headView.mas_centerY);
    }];
    
    self.registerSelLab = [[UILabel alloc] init];
    self.registerSelLab.backgroundColor = SAGlobalBg;
    self.registerSelLab.layer.cornerRadius = 1.3;
    self.registerSelLab.layer.masksToBounds = YES;
    [self.registerSelLab setHidden:YES];
    [headView addSubview:self.registerSelLab];
    
    [self.registerSelLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.registerLabel.mas_centerX);
        make.width.equalTo([NSNumber numberWithInteger:24]);
        make.height.equalTo([NSNumber numberWithInteger:3]);
        make.top.equalTo(self.registerLabel.mas_bottom).offset(6);
    }];
    
    UIButton *registerTopButton = [[UIButton alloc] init];
    [registerTopButton addTarget:self action:@selector(registerTopAction) forControlEvents:UIControlEventTouchUpInside];
    [headView addSubview:registerTopButton];
    [registerTopButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.registerLabel.mas_centerX);
        make.centerY.equalTo(self.registerLabel.mas_centerY);
        make.height.equalTo(Number(30));
        make.width.equalTo(Number(60));
    }];
    
    UIView *centerView = [[UIView alloc] init];
    [self.view addSubview:centerView];
    
    [centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo([NSNumber numberWithInteger:Screen_Width]);
        make.height.equalTo([NSNumber numberWithInteger:128]);
        make.top.equalTo(headView.mas_bottom);
    }];
    
    UILabel *bottomLab = [[UILabel alloc] init];
    bottomLab.backgroundColor = RGBColor(229, 229, 229);
    [centerView addSubview:bottomLab];
    
    [bottomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerView.mas_left).offset(22);
        make.right.equalTo(centerView.mas_right).offset(-22);
        make.height.equalTo([NSNumber numberWithInteger:1]);
        make.bottom.equalTo(centerView.mas_bottom);
    }];
    
    UILabel *topLab = [[UILabel alloc] init];
    topLab.backgroundColor = RGBColor(229, 229, 229);
    [centerView addSubview:topLab];
    
    [topLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(centerView.mas_left).offset(22);
        make.right.equalTo(centerView.mas_right).offset(-22);
        make.height.equalTo([NSNumber numberWithInteger:1]);
        make.bottom.equalTo(centerView.mas_bottom).offset(-65);
    }];
    
    UIImageView *telImageV = [[UIImageView alloc] init];
    telImageV.image = [UIImage imageNamed:@"icon_tel"];
    [centerView addSubview:telImageV];
    
    [telImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topLab.mas_left);
        make.height.width.equalTo([NSNumber numberWithInteger:14]);
        make.bottom.equalTo(topLab.mas_top).offset(-18);
    }];
    
    self.telTextField = [[UITextField alloc] init];
    self.telTextField.placeholder = @"请输入手机号码";
    self.telTextField.font = [UIFont systemFontOfSize:14];
    [centerView addSubview:self.telTextField];
    
    [self.telTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(telImageV.mas_right).offset(8);
        make.centerY.equalTo(telImageV.mas_centerY);
        make.height.equalTo([NSNumber numberWithInteger:21]);
        make.right.equalTo(topLab.mas_right);
    }];
    
    
    UIImageView *codeImageV = [[UIImageView alloc] init];
    codeImageV.image = [UIImage imageNamed:@"icon_code"];
    [centerView addSubview:codeImageV];
    
    [codeImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomLab.mas_left);
        make.height.width.equalTo([NSNumber numberWithInteger:14]);
        make.bottom.equalTo(bottomLab.mas_top).offset(-18);
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
    [centerView addSubview:self.getCodeBtn];
    
    [self.getCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bottomLab.mas_right);
        make.height.equalTo([NSNumber numberWithInteger:30]);
        make.width.equalTo([NSNumber numberWithInteger:90]);
        make.centerY.equalTo(codeImageV.mas_centerY);
    }];
    
    self.codeTextField = [[UITextField alloc] init];
    self.codeTextField.placeholder = @"请输入验证码";
    self.codeTextField.font = [UIFont systemFontOfSize:14];
    [centerView addSubview:self.codeTextField];
    
    [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(codeImageV.mas_right).offset(8);
        make.centerY.equalTo(codeImageV.mas_centerY);
        make.height.equalTo([NSNumber numberWithInteger:21]);
        make.right.equalTo(self.getCodeBtn.mas_left).offset(-10);
    }];
    
    UIView *bottomView = [[UIView alloc] init];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(centerView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    self.pwdLoginBtn = [[UIButton alloc] init];
    [self.pwdLoginBtn setTitle:@"密码登录" forState:UIControlStateNormal];
    [self.pwdLoginBtn setTitleColor:RGBColor(102, 102, 102) forState:UIControlStateNormal];
    [self.pwdLoginBtn addTarget:self action:@selector(pwdLoginAction) forControlEvents:UIControlEventTouchUpInside];
    self.pwdLoginBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bottomView addSubview:self.pwdLoginBtn];
    [self.pwdLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView.mas_left).offset(24);
        make.top.equalTo(bottomView.mas_top).offset(13);
    }];
    
    self.forgetpwdBtn = [[UIButton alloc] init];
    [self.forgetpwdBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [self.forgetpwdBtn setTitleColor:RGBColor(102, 102, 102) forState:UIControlStateNormal];
    [self.forgetpwdBtn addTarget:self action:@selector(forgetpwdAction) forControlEvents:UIControlEventTouchUpInside];
    self.forgetpwdBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [bottomView addSubview:self.forgetpwdBtn];
    [self.forgetpwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomView.mas_top).offset(13);
        make.right.equalTo(bottomView.mas_right).offset(-24);
    }];
    
    UIButton *loginBtn = [[UIButton alloc] init];
    [loginBtn setBackgroundColor:SAGlobalBg];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 25;
    loginBtn.layer.masksToBounds = YES;
    [bottomView addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomView.mas_left).offset(27);
        make.right.equalTo(bottomView.mas_right).offset(-27);
        make.height.equalTo(Number(44));
        make.top.equalTo(self.pwdLoginBtn.mas_bottom).offset(50);
    }];
    
    UILabel *sepearteLab = [[UILabel alloc] init];
    sepearteLab.text = @"——————  or  ——————";
    sepearteLab.textColor = Gray(187);
    sepearteLab.font = [UIFont systemFontOfSize:16];
    [bottomView addSubview:sepearteLab];
    
    [sepearteLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bottomView.mas_centerX);
        make.top.equalTo(loginBtn.mas_bottom).offset(75);
    }];
    
    self.registerBottomView = [[UIView alloc] init];
    self.registerBottomView.backgroundColor = [UIColor whiteColor];
    [self.registerBottomView setHidden:YES];
    [self.view addSubview:self.registerBottomView];
    [self.registerBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(centerView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    UILabel *bottomSepeLab = [[UILabel alloc] init];
    bottomSepeLab.backgroundColor = Gray(229);
    [self.registerBottomView addSubview:bottomSepeLab];
    [bottomSepeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.registerBottomView.mas_left).offset(22);
        make.right.equalTo(self.registerBottomView.mas_right).offset(-22);
        make.height.equalTo([NSNumber numberWithInteger:1]);
        make.top.equalTo(self.registerBottomView.mas_top).offset(64);
    }];
    
    UIImageView *pwdImageV = [[UIImageView alloc] init];
    pwdImageV.image = [UIImage imageNamed:@"icon_pwd"];
    [self.registerBottomView addSubview:pwdImageV];
    
    [pwdImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bottomSepeLab.mas_left);
        make.height.width.equalTo([NSNumber numberWithInteger:14]);
        make.bottom.equalTo(bottomSepeLab.mas_top).offset(-18);
    }];
    
    self.pwdTextField = [[UITextField alloc] init];
    self.pwdTextField.placeholder = @"请输入密码";
    self.pwdTextField.font = [UIFont systemFontOfSize:14];
    [self.registerBottomView addSubview:self.pwdTextField];
    
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pwdImageV.mas_right).offset(8);
        make.centerY.equalTo(pwdImageV.mas_centerY);
        make.height.equalTo([NSNumber numberWithInteger:21]);
        make.right.equalTo(bottomSepeLab.mas_right);
    }];
    
    UILabel *tipLab = [[UILabel alloc] init];
    NSString *str = [NSString stringWithFormat:@"*注册代表已阅读同意《智分类用户协议》"];
    NSMutableAttributedString *str2 = [[NSMutableAttributedString alloc]initWithString:str];
    [str2 addAttribute:NSForegroundColorAttributeName value:Gray(153) range:NSMakeRange(0,10)];
    [str2 addAttribute:NSForegroundColorAttributeName value:SAGlobalBg range:NSMakeRange(10,9)];
    [str2 addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:NSMakeRange(0,19)];
    tipLab.attributedText = str2;
    [self.registerBottomView addSubview:tipLab];
    
    [tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.registerBottomView.mas_left).offset(23);
        make.top.equalTo(bottomSepeLab.mas_bottom).offset(15);
    }];
    
    UIButton *registerBtn = [[UIButton alloc] init];
    [registerBtn setBackgroundColor:SAGlobalBg];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.layer.cornerRadius = 25;
    registerBtn.layer.masksToBounds = YES;
    [self.registerBottomView addSubview:registerBtn];
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.registerBottomView.mas_left).offset(27);
        make.right.equalTo(self.registerBottomView.mas_right).offset(-27);
        make.height.equalTo(Number(44));
        make.top.equalTo(tipLab.mas_bottom).offset(50);
    }];
}

- (void)registerTopAction{
    [self.registerBottomView setHidden:NO];
    [self.registerSelLab setHidden:NO];
    [self.loginSelLab setHidden:YES];
    self.registerLabel.textColor = SAGlobalBg;
    self.loginLabel.textColor = [UIColor blackColor];
}

- (void)loginTopAction{
    [self.registerBottomView setHidden:YES];
    [self.registerSelLab setHidden:YES];
    [self.loginSelLab setHidden:NO];
    self.registerLabel.textColor = [UIColor blackColor];
    self.loginLabel.textColor = SAGlobalBg;
}

- (void)pwdLoginAction{
    if (selectPwd) {
        [self.getCodeBtn setHidden:NO];
        [self.pwdLoginBtn setTitle:@"密码登录" forState:UIControlStateNormal];
        selectPwd = NO;
    }else{
       [self.getCodeBtn setHidden:YES];
        [self.pwdLoginBtn setTitle:@"验证码登录" forState:UIControlStateNormal];
        selectPwd = YES;
    }
    
}

- (void)getCodeAction{
     [self.getCodeBtn countDownFromTime:60 title:@"重获验证码" unitTitle:@"S" mainColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0] countColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1.0]];
}

- (void)forgetpwdAction{
    SAForgetpwdViewController *forgetVC = [[SAForgetpwdViewController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
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
