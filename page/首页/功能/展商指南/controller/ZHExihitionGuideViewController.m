//
//  ZHExihitionGuideViewController.m
//  exhibition
//
//  Created by 古军 on 2020/6/1.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "ZHExihitionGuideViewController.h"

@interface ZHExihitionGuideViewController ()

@property (weak, nonatomic) IBOutlet UILabel *hotelname;

@property (weak, nonatomic) IBOutlet UILabel *address;

@property (weak, nonatomic) IBOutlet UILabel *hoteltel;

@property (weak, nonatomic) IBOutlet UIImageView *hotelImageView;

@end

@implementation ZHExihitionGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationItem.title = @"展商指南";
}

@end
