
//
//  YeYeController.m
//  TestTabBar
//
//  Created by zhao on 16/6/1.
//  Copyright © 2016年 zhao. All rights reserved.
//

#import "YeYeController.h"

@interface YeYeController ()

@end

@implementation YeYeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (IBAction)touchQuitButton:(UIButton *)sender
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"phone"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"password"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    self.tabBarController.tabBar.hidden = YES; 
}

@end
