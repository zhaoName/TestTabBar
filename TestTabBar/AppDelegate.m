//
//  AppDelegate.m
//  TestTabBar
//
//  Created by zhao on 16/5/26.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "RootTabBarViewController.h"
#import "GuideViewController.h"

#define VERSIONKEY @"CFBundleShortVersionString" //版本号

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:VERSIONKEY];
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[VERSIONKEY];
    if(![lastVersion isEqualToString:currentVersion]) //若两次的版本号不同，则显示引导页
    {
        [self showGuide];
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:VERSIONKEY];
    }
    else
    {
        if([[NSUserDefaults standardUserDefaults] objectForKey:@"phone"] && [[NSUserDefaults standardUserDefaults] objectForKey:@"password"])
        {
            [self showRootTabBar];
        }
        else
        {
            [self showLogin];
        }
    }
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)showGuide
{
    GuideViewController *guideVC = [[GuideViewController alloc] init];
    
    guideVC.guideBlock = ^(void)
    {
        [self showLogin];
    };
    
    self.window.rootViewController = guideVC;
}

- (void)showRootTabBar
{
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RootTabBarViewController *rootTabBar = [board instantiateViewControllerWithIdentifier:@"RootTabBarViewController"];
    self.window.rootViewController = rootTabBar;
}

- (void)showLogin
{
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    LoginViewController *loginVC = [story instantiateViewControllerWithIdentifier:@"LoginViewController"];
    UINavigationController *na = [[UINavigationController alloc] initWithRootViewController:loginVC];
    self.window.rootViewController = na;
}

@end
