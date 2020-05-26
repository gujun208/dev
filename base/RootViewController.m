//
//  RootViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/26.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController (){
    UILabel *label;
    UIImageView *imageView;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = DEFAULLIGHTGRAYCOLOR;
    self.navigationController.navigationBar.tintColor = DEFAULTFONTMAINCOLOR;
    [self.navigationController.navigationBar setBackgroundImage:[Tool createImageWithColor:NAVCOLOR] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:17],NSFontAttributeName,DEFAULTFONTMAINCOLOR, NSForegroundColorAttributeName, nil];
    if (self.navigationController.viewControllers.count > 1) {
        UIBarButtonItem *backBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NA_BackBtn"] style:0 target:self action:@selector(backClick)];
        self.navigationItem.leftBarButtonItem = backBtn;
    }

}

- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  设置导航栏左右按钮
 *
 *  @param positionItem  position_left = 0,   position_right
 *  @param title        左右按钮名称
 *  @param image        左右按钮图片 无传nil
 *  @param action       左右按键点击事件
 */
- (void)customNavigationItem:(position_item)positionItem title:(NSString *)title backgroundImage:(UIImage *)image action:(SEL)action {
    
    UIView *btn;
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 90, 30)];
    label.font = [UIFont boldSystemFontOfSize:15];
    label.textColor = DEFAULBLUECOLOR;
    label.text = title;
    if (positionItem==position_left) {
        label.textAlignment = NSTextAlignmentLeft;
    }else if (positionItem==position_right){
        label.textAlignment = NSTextAlignmentRight;
    }
    label.userInteractionEnabled = YES;
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 21, 21)];
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    
    if (title) {
        btn = label;
        
    } else if (image) {
        btn = imageView;
    }
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:action];
    [btn addGestureRecognizer:tap];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    if (positionItem == position_left) {
        self.navigationItem.leftBarButtonItem = item;
    } else {
        self.navigationItem.rightBarButtonItem = item;
    }
}

@end
