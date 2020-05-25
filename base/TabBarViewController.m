//
//  TabBarViewController.m
//  exhibition
//
//  Created by 古军 on 2020/5/25.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "TabBarViewController.h"
#import "Tool.h"
@interface TabBarViewController (){
    NSMutableArray *_dataArr;
}

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpSubNav];
}

- (void)setUpSubNav{
    
    [[UINavigationBar appearance] setBackgroundColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setBackgroundImage:[Tool createImageWithColor:NAVCOLOR]  forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance]  setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:19],NSFontAttributeName,[UIColor whiteColor], NSForegroundColorAttributeName, nil]];

    ///tabBar
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TabBarPList_Other" ofType:@"plist"];
    _dataArr = [[NSArray arrayWithContentsOfFile:path] mutableCopy];

    NSMutableArray *vcArr = [NSMutableArray array];
    
    for (int i=0;i<_dataArr.count;i++) {
        //取出页面的类名
        NSDictionary *dic =_dataArr[i];
        NSString *name = [dic objectForKey:@"name"];
        UIViewController *vc;
        Class cl = NSClassFromString(name);
        vc = [[cl alloc] init];
        //导航
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.navigationController.navigationBar.tintColor = [UIColor whiteColor];
        //导航字体颜色
        vc.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:17],NSFontAttributeName,DEFAULTFONTMAINCOLOR, NSForegroundColorAttributeName, nil];
        [vc.navigationController.navigationBar setBackgroundColor:NAVCOLOR];
        //        [vc.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NA_NavigationBar"] forBarMetrics:UIBarMetricsDefault];
        nc.tabBarItem = [[UITabBarItem alloc] initWithTitle:[dic objectForKey:@"title"] image:[UIImage imageNamed:[dic objectForKey:@"icon"]] tag:i];
        nc.tabBarItem.selectedImage=[UIImage imageNamed:[dic objectForKey:@"selectIcon"]];
        [vcArr addObject:nc];
    }
    self.viewControllers = vcArr;
    self.tabBar.tintColor =DEFAULBLUECOLOR;
    
//    self.tabBar.opaque = YES;
//    [self.tabBar setClipsToBounds:YES];

}

@end
