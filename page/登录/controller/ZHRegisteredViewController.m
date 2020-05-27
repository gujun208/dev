//
//  ZHRegisteredViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/27.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHRegisteredViewController.h"
#import "ZHAgreementViewController.h"

@interface ZHRegisteredViewController ()<UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *telTextfield;

@property (weak, nonatomic) IBOutlet UITextField *codeTextfield;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;

@property (weak, nonatomic) IBOutlet UITextField *agreepasswordTextfield;

@property (weak, nonatomic) IBOutlet UIButton *verificationCodeButton;//验证码按钮

@property (weak, nonatomic) IBOutlet UILabel *verificationCodeLabel;




@end

@implementation ZHRegisteredViewController
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

- (IBAction)ClickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField == self.telTextfield) {
        [self.codeTextfield becomeFirstResponder];
        return NO;
    }else if (textField == self.codeTextfield){
        [self.passwordTextfield becomeFirstResponder];
        return NO;

    }else if (textField == self.passwordTextfield){
        [self.agreepasswordTextfield becomeFirstResponder];
        return NO;

    }else{
        [textField resignFirstResponder];
        return YES;
    }
}

#pragma mark 获取验证码
- (IBAction)ClickVerificationCodeButton:(UIButton *)sender {
    
    //接口请求成功后开始倒计时
    [self sendCode];
    
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


#pragma mark 是否勾选协议
- (IBAction)checkDelegate:(UIButton *)sender {
    sender.selected = !sender.selected;
}

#pragma mark 查看协议
- (IBAction)ClickdelegateButton:(UIButton *)sender {
    ZHAgreementViewController * agreementVC = [ZHAgreementViewController new];
    [self.navigationController pushViewController:agreementVC animated:YES];
}

#pragma mark 注册
- (IBAction)registeredButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//Interests and hobbies
@end
