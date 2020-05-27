//
//  ZHLoginViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/27.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHLoginViewController.h"
#import "ForgetPasswordViewController.h"
#import "ZHRegisteredViewController.h"
#import "ZHInterestHobbiesViewController.h"

@interface ZHLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *languageButton;

@property (weak, nonatomic) IBOutlet UIButton *usernameButton;
@property (weak, nonatomic) IBOutlet UIButton *codeButton;
@property (weak, nonatomic) IBOutlet UILabel *usernameLine;
@property (weak, nonatomic) IBOutlet UILabel *codeLine;

@property (weak, nonatomic) IBOutlet UILabel *accountLabel;
@property (weak, nonatomic) IBOutlet UITextField *accountTextfield;
//Verification code


@property (weak, nonatomic) IBOutlet UILabel *passwordLabel;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@property (weak, nonatomic) IBOutlet UIButton *verificationCodeButton;//验证码按钮

@property (weak, nonatomic) IBOutlet UILabel *verificationCodeLabel;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;


//约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passwordTrailingConstraint;


@end

@implementation ZHLoginViewController
{
    NSTimer *timer;
    int second;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 隐藏导航栏
    [self.navigationController setNavigationBarHidden:YES];
    
    if (@available(iOS 13.0,*)) {
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark 用户名和验证码切换

- (IBAction)ClickswitchLoginStyle:(UIButton *)sender {
    
    [sender setTitleColor:DEFAULBLACKCOLOR forState:UIControlStateNormal];
    sender.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    
    if (sender.tag==101) {//验证码登录
        self.usernameLine.hidden=YES;
        self.codeLine.hidden=NO;

        [self.usernameButton setTitleColor:DEFAULBLACK02COLOR forState:UIControlStateNormal];
        self.usernameButton.titleLabel.font = font14;

        self.accountLabel.text = @"手机号";
        self.accountTextfield.placeholder = @"请输入手机号";
        
        self.passwordLabel.text = @"验证码";
        self.passwordTextfield.placeholder = @"请输入验证码";
        
        self.passwordTrailingConstraint.constant = 80;
        
        self.verificationCodeButton.hidden=NO;
    }else{//用户名登录
        self.codeLine.hidden=YES;
        self.usernameLine.hidden=NO;
        
        [self.codeButton setTitleColor:DEFAULBLACK02COLOR forState:UIControlStateNormal];
        self.codeButton.titleLabel.font = font14;

        self.accountLabel.text = @"用户名";
        self.accountTextfield.placeholder = @"请输入用户名或手机号";
        
        self.passwordLabel.text = @"密码";
        self.passwordTextfield.placeholder = @"请输入登录密码";
        
        self.passwordTrailingConstraint.constant = 5;

        self.verificationCodeButton.hidden=YES;
    }
}

- (void)sendCode{
    
    [self.view endEditing:YES];

    self.verificationCodeButton.hidden = YES;
    second = 29;
    self.verificationCodeLabel.hidden = NO;
    
    self.verificationCodeLabel.text =[NSString stringWithFormat:@"请%d秒后重试",second];
    if ([timer isValid]) {
        
        [timer invalidate];
        timer = nil;
        
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerSecondAction) userInfo:nil repeats:YES];
}
-(void)timerSecondAction{
    
    second--;
    if (second<=0) {
        
        second=0;
        [timer invalidate];
        
        self.verificationCodeLabel.hidden = YES;
        self.verificationCodeButton.hidden = NO;
        
    }
    self.verificationCodeLabel.text =[NSString stringWithFormat:@"请%d秒后重试",second];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.accountTextfield) {
        [self.passwordTextfield becomeFirstResponder];
        return NO;
    }else{
        [textField resignFirstResponder];
        return YES;
    }
}

#pragma mark 获取验证码 verificationCodeButton

- (IBAction)ClickVerificationCodeButton:(UIButton *)sender {
    
    //接口请求成功后开始倒计时
    [self sendCode];
    
}

#pragma mark 忘记密码

- (IBAction)ClickForgotpassword:(UIButton *)sender {
    ForgetPasswordViewController *forgetVC = [[ForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}


#pragma mark 新用户注册

- (IBAction)NewuserRegistered:(UIButton *)sender {
    ZHRegisteredViewController * registeredVC = [[ZHRegisteredViewController alloc] init];
    [self.navigationController pushViewController:registeredVC animated:YES];
}

#pragma mark 登录

- (IBAction)ClickLoginButton:(UIButton *)sender {
    
//    if (self.accountTextfield.text.length==0) {
//        Toast(@"请输入账号或手机号!");
//        return;
//    }
//
//    if (self.accountTextfield.text.length==0) {
//        Toast(@"请输入密码或验证码!");
//        return;
//    }
    ZHInterestHobbiesViewController * hobbiesVC = [ZHInterestHobbiesViewController new];
    [self.navigationController pushViewController:hobbiesVC animated:YES];
    
//    if ([NSThread isMainThread]) {
//        TabBarViewController *tabbar = [[TabBarViewController alloc] init];
//        [UIApplication sharedApplication].keyWindow.rootViewController = tabbar;
//    }else{
//        dispatch_async(dispatch_get_main_queue(), ^{
//            TabBarViewController *tabbar = [[TabBarViewController alloc] init];
//            [UIApplication sharedApplication].keyWindow.rootViewController = tabbar;
//        });
//    }

}


@end
