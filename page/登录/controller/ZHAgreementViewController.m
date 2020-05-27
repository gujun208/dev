//
//  ZHAgreementViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/27.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHAgreementViewController.h"

@interface ZHAgreementViewController ()

@property (weak, nonatomic) IBOutlet UITextView *agreementTextview;


@end

@implementation ZHAgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"ChinaJoy用户注册协议";
}

- (IBAction)Clickclose:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
