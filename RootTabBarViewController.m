//
//  RootTabBarViewController.m
//  TestTabBar
//
//  Created by zhao on 16/6/3.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "RootTabBarViewController.h"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注意这里不能用 self.tabBarController.tabBar.tintColor
    self.tabBar.tintColor = [UIColor purpleColor];
}

@end
