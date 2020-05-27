//
//  ForgetPasswordViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/27.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()

@property (weak, nonatomic) IBOutlet UIButton *verificationCodeButton;//验证码按钮

@property (weak, nonatomic) IBOutlet UILabel *verificationCodeLabel;

@property (weak, nonatomic) IBOutlet UITextField *telTextfield;
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextfield;
@property (weak, nonatomic) IBOutlet UITextField *newpasswordTextfield;
@property (weak, nonatomic) IBOutlet UITextField *ageinpasswordTextfield;




@end

@implementation ForgetPasswordViewController
{
    NSTimer *timer;
    int second;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"忘记密码";
}

#pragma mark 确定

- (IBAction)ClickensureButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
    
    if (textField == self.telTextfield) {
        [self.verificationCodeTextfield becomeFirstResponder];
        return NO;
    }else if (textField == self.verificationCodeTextfield){
        [self.newpasswordTextfield becomeFirstResponder];
        return NO;

    }else if (textField == self.newpasswordTextfield){
        [self.ageinpasswordTextfield becomeFirstResponder];
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

@end
