//
//  AppDelegate.m
//  MyApp
//
//  Created by apple on 2020/4/23.
//  Copyright © 2020 tii. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+IQKeyBoard.h"
#import "CYLTabBarControllerConfig.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {//设置全局状态栏字体颜色为黑色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    //设置全局状态栏字体颜色为白色
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    //设置IQKeyBoard
    [self settingIQKeyBoard];
    CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc] init];
    CYLTabBarController *tabBarController = tabBarControllerConfig.tabBarController;
    tabBarController.selectedIndex = 0;
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
