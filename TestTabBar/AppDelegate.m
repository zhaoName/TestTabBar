//
//  AppDelegate.m
//  TestTabBar
//
//  Created by zhao on 16/5/26.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "IQKeyboardManager.h"
#import "RootTabBarViewController.h"
#import "GuideViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //[[UITabBar appearance] setTintColor:[UIColor redColor]];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    if(![[NSUserDefaults standardUserDefaults] objectForKey:@"guide"])
    {
        [self showGuide];
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
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"phone"]);
    
    [[IQKeyboardManager sharedManager] setEnable:YES];
    [IQKeyboardManager sharedManager].keyboardDistanceFromTextField = 50.0;
    
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
