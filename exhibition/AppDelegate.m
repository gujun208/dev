//
//  AppDelegate.m
//  exhibition
//
//  Created by 古军 on 2020/5/25.
//  Copyright © 2020 exhibition. All rights reserved.
//

#import "AppDelegate.h"
#import "HomePageViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>//UITabBarControllerDelegate

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if (@available(iOS 13.0,*)) {
        self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;
    }else{
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }

    [self initUI:launchOptions];

    return YES;
}

- (void)initUI:(NSDictionary *)launchOptions{
   
//    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"UserManager_userInfo"]) {
        self.tabbar = [[TabBarViewController alloc] init];
        self.tabbar.delegate = self;
        self.window.rootViewController = self.tabbar;
        self.window.backgroundColor = [UIColor whiteColor];
        [self.window makeKeyAndVisible];
//    }else{
//        LoginViewController *loginVc = [LoginViewController new];
//        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:loginVc];
//        self.window.rootViewController = nc;
//        [self.window makeKeyAndVisible];
//    }
}

@end
